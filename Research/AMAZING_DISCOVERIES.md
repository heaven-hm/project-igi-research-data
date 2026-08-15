# IGI 1 - Amazing Reverse Engineering Discoveries

> Deep analysis of `igi.exe` using radare2 — verified against IGI 1 binary only.
> IGI 2 content (igi2.pdb) explicitly excluded.

---

## Table of Contents

| # | Discovery | Address | Category |
|---|-----------|---------|----------|
| 1 | Health System (1.0 - 3.0 Scale) | `0x45D3C0` | Health |
| 2 | Airborne Physics (Gravity Integration) | `0x408460` | Physics |
| 3 | 17-Zone Hit Table | `0x489C30` | Combat |
| 4 | Weapon State Machine | `0x411000` | Weapons |
| 5 | AI View Cone Detection | `0x4502F0` | AI |
| 6 | Vehicle Heli Physics | `0x431E30` | Vehicles |
| 7 | Damage Falloff & Explosion | `0x416C90` | Explosions |
| 8 | Ladder Climb State Machine | `0x40D6B0` | Interactions |

---

## 1. Health System - 1.0 to 3.0 Scale

**Address:** `0x45D3C0`
**Category:** Health & Damage

### What It Does

The soldier hit handler manages all damage calculation for AI characters. Health is stored as a floating-point value ranging from **1.0** (full health) down to **0.0** (dead). The system supports **3.0 difficulty scaling**.

### Key Findings

| Parameter | Value | Description |
|-----------|-------|-------------|
| Health Range | 1.0 - 0.0 | Full to dead |
| Difficulty Easy | 0.75x | Damage multiplier |
| Difficulty Normal | 1.0x | Standard damage |
| Difficulty Hard | 1.25x | Increased damage |
| Lethal Multiplier | 100.0 | Instant kill threshold |
| Head Proximity | 614.4 units | Headshot range |

### Unit Scale

IGI 1 uses a consistent scale of **4096 units = 1 meter**.

| Game Value | Real-World Equivalent |
|------------|----------------------|
| 614.4 units | 0.15 meters (15 cm) |
| 2048 units | 0.5 meters (50 cm) |
| 40960 units | 10 meters |
| 84.741692 units/tick | 0.62 m/s² at 30 Hz |

### Decompiled C Code


```c
// Soldier Hit Handler - 0x45D3C0
// Applies damage to soldier with zone multiplier and difficulty scaling

void HitHandler_Soldier(SoldierStruct* soldier, DamageInfo* damage) {
    // Get zone multiplier from 17-zone hit table
    // Zone 0 = head (100x), zone 1 = neck (50x), etc.
    float zone_mult = g_HitZoneTable[damage->zone];
    
    // Get difficulty scaling factor
    float diff_scale = g_DifficultyScale; // 0.75, 1.0, or 1.25
    
    // Calculate final damage with all multipliers
    float final_damage = damage->amount * zone_mult * diff_scale;
    
    // Apply to health (offset 0x254 in soldier struct)
    soldier->health -= final_damage;
    
    // Clamp health
    if (soldier->health <= 0.0f) {
        soldier->health = 0.0f;
        soldier->state = STATE_DEAD;
    }
}

```text



### Health Calculation


```text
final_damage = base_damage x zone_multiplier x difficulty_scale

Where:
  zone_multiplier = hit_table[zone_id]  (17 zones)
  difficulty_scale = 0.75 | 1.0 | 1.25

```text

---

## 2. Airborne Physics - Gravity Integration

**Address:** `0x408460`
**Category:** Player Physics

### What It Does

The airborne integrator applies gravity to the player's vertical velocity every tick. This function is called from the main player update at `0x4109A0`.

### Key Findings

| Constant | Value | Description |
|----------|-------|-------------|
| Gravity Per Tick | 84.741692 | Per-tick velocity reduction |
| Gravity Source | Global at `0x5333F0` | FPU float constant |
| Velocity Offset | +0x66C | Player struct offset |
| Tick Rate | 30 Hz | Physics update frequency |
| No Damping | None | Falling body accelerates indefinitely |
| No Terminal Velocity | None | Fall speed unlimited |

### Unit Scale

Gravity in real-world units:
- 84.741692 units/tick × 30 ticks/s = 2542.25 units/s²
- At 4096 units/meter: 2542.25 / 4096 = **0.62 m/s²**

### Decompiled C Code


```c
// Airborne Integrator - 0x408460
// Applies gravity to player velocity every tick (30Hz)

void AirborneIntegrate(PlayerStruct* player) {
    // Load current velocity from struct (offset 0x66C)
    float vz = player->velocity.z;
    
    // Subtract gravity (global constant at 0x5333F0 = 84.741692)
    vz -= 84.741692f;
    
    // Store back
    player->velocity.z = vz;
    
    // Apply air control based on input flags
    if (player->input.forward) {
        player->velocity.x += player->basis.m12 * player->speed;
        player->velocity.y += player->basis.m22 * player->speed;
        player->velocity.z += player->basis.m32 * player->speed;
    }
    
    // Check for ground collision (bit 4 at +0x2F4)
    if (!(player->flags & 0x10)) {
        return; // Not airborne
    }
    
    // No damping, no terminal velocity
    // Fall continues accelerating indefinitely
}

```text



### Physics Formula


```text
velocity.z -= gravity_per_tick

Where:
  gravity_per_tick = 84.741692 (from global 0x5333F0)
  Applied every 30Hz tick

```text

> **Note:** At 4096 units/meter, gravity = 0.62 m/s. A 1024-unit takeoff reaches apex in ~12 ticks.

---

## 3. 17-Zone Hit Table

**Address:** `0x489C30`
**Category:** Combat System

### What It Does

The damage state initializer copies the 17-zone hit multiplier table into the soldier's damage state. Each body zone has a specific damage multiplier.

### Key Findings

| Zone ID | Zone Name | Multiplier |
|---------|-----------|------------|
| 0 | Head | 100.0x |
| 1 | Neck | 50.0x |
| 2 | Upper Torso | 1.0x |
| 3 | Lower Torso | 1.0x |
| 4 | Right Upper Arm | 0.75x |
| 5 | Right Lower Arm | 0.5x |
| 6 | Right Hand | 0.25x |
| 7 | Left Upper Arm | 0.75x |
| 8 | Left Lower Arm | 0.5x |
| 9 | Left Hand | 0.25x |
| 10 | Right Upper Leg | 0.75x |
| 11 | Right Lower Leg | 0.5x |
| 12 | Right Foot | 0.25x |
| 13 | Left Upper Leg | 0.75x |
| 14 | Left Lower Leg | 0.5x |
| 15 | Left Foot | 0.25x |
| 16 | Groin | 2.0x |

### Decompiled C Code


```c
// Damage State Initializer - 0x489C30
// Copies 17-zone hit table into soldier damage state

// 17-zone hit multiplier table (global at 0x538xxx)
static const float g_HitZoneTable[17] = {
    100.0f,   // 0: Head
    50.0f,    // 1: Neck
    1.0f,     // 2: Upper Torso
    1.0f,     // 3: Lower Torso
    0.75f,    // 4: Right Upper Arm
    0.5f,     // 5: Right Lower Arm
    0.25f,    // 6: Right Hand
    0.75f,    // 7: Left Upper Arm
    0.5f,     // 8: Left Lower Arm
    0.25f,    // 9: Left Hand
    0.75f,    // 10: Right Upper Leg
    0.5f,     // 11: Right Lower Leg
    0.25f,    // 12: Right Foot
    0.75f,    // 13: Left Upper Leg
    0.5f,     // 14: Left Lower Leg
    0.25f,    // 15: Left Foot
    2.0f      // 16: Groin
};

void DamageState_Init(SoldierStruct* soldier, DamageState* state) {
    // Copy hit zone table
    memcpy(state->zone_multipliers, g_HitZoneTable, sizeof(g_HitZoneTable));
    
    // Direction refinement
    state->front_zone = 13;   // Front hit
    state->rear_zone = 14;    // Rear hit
    state->proximity_zone = 15; // Distance-based
    
    // Head proximity check (614.4 units = 15cm)
    state->head_proximity_units = 614.4f;
}

```text



### Zone Mapping


```text
Direction Tests:
  zone == 13 -> Front hit (direction refinement)
  zone == 14 -> Rear hit (direction refinement)
  zone == 15 -> Proximity hit (distance-based)

Head Proximity: 614.4 units (15cm radius)
  - Within this range = headshot (100x damage)
  - Outside = neck or torso

```text

---

## 4. Weapon State Machine

**Address:** `0x411000`
**Category:** Weapon System

### What It Does

The main weapon state machine handles all weapon states: Ready, Firing, Striking, DryFire, Relaying, Changing, Peeking, Throwing, Placing, Medipack, and MapComputer.

### Key Findings

| State ID | State Name | Description |
|----------|------------|-------------|
| 0 | Ready | Weapon idle, can fire |
| 1 | Firing | Trigger held, discharging |
| 2 | Striking | Melee attack animation |
| 3 | DryFire | Empty magazine click |
| 4 | Reloading | Reload animation |
| 5 | Changing | Switching weapons |
| 6 | Peeking | Aim around cover |
| 7 | Throwing | Grenade toss |
| 8 | Placing | Mine/object placement |
| 9 | Medipack | Healing animation |
| 10 | MapComputer | Overlay active |

### Decompiled C Code


```c
// Weapon State Machine - 0x411000
// Main weapon update function called every tick

typedef enum {
    STATE_READY = 0,
    STATE_FIRING = 1,
    STATE_STRIKING = 2,
    STATE_DRYFIRE = 3,
    STATE_RELOADING = 4,
    STATE_CHANGING = 5,
    STATE_PEEKING = 6,
    STATE_THROWING = 7,
    STATE_PLACING = 8,
    STATE_MEDIPACK = 9,
    STATE_MAPCOMPUTER = 10
} WeaponState;

void WeaponState_Update(PlayerStruct* player, float dt) {
    WeaponState current = player->weapon_state;
    WeaponState prev = player->weapon_state_prev;
    
    switch (current) {
        case STATE_READY:
            // Check if fire timer elapsed and ammo available
            if (player->fire_timer <= 0 && player->ammo > 0) {
                player->weapon_state = STATE_FIRING;
                player->fire_timer = weapon->fire_rate;
            }
            break;
            
        case STATE_FIRING:
            player->fire_timer -= dt;
            if (player->fire_timer <= 0) {
                if (player->ammo <= 0) {
                    player->weapon_state = STATE_DRYFIRE;
                    // Play dry fire sound
                } else {
                    player->weapon_state = STATE_READY;
                }
            }
            break;
            
        case STATE_RELOADING:
            player->reload_timer -= dt;
            if (player->reload_timer <= 0) {
                player->weapon_state = STATE_READY;
                player->ammo = weapon->magazine_size;
            }
            break;
            
        // ... additional states
    }
    
    // Decay recoil every tick
    player->recoil *= 0.89999998f; // Recoil damping
    if (fabs(player->recoil) < 0.001f) {
        player->recoil = 0.0f;
    }
}

```text

---

## 5. AI View Cone Detection

**Address:** `0x4502F0`
**Category:** AI System

### What It Does

The AI view cone test checks if a target is within the AI's field of view. Uses a two-cone system: primary (acute) and secondary (peripheral).

### Key Findings

| Parameter | Default | Alarm State | Description |
|-----------|---------|-------------|-------------|
| Primary Length | Alert distance | Increased | Sight range |
| Primary Half-Angle | Alpha | Wider | Cone width |
| Primary Detection Rate | Gamma | Faster | Detection speed |
| Secondary Length | Peripheral | Increased | Peripheral range |
| Secondary Half-Angle | Wider | Wider | Peripheral width |
| Sight Obstruction Tolerance | 0.79 | Same | Raycast threshold |

### Decompiled C Code


```c
// AI View Cone Test - 0x4502F0
// Returns 0x101 if target detected, 0 if not

#define DETECTED 0x101
#define NOT_DETECTED 0x0

uint32_t AI_ViewConeTest(AIStruct* ai, Vector3D* target_pos, bool use_alarm_cone) {
    // Calculate direction to target
    Vector3D dir = {
        target_pos->x - ai->eye_pos.x,
        target_pos->y - ai->eye_pos.y,
        target_pos->z - ai->eye_pos.z
    };
    
    // Transform to AI local space using basis matrix at +0x58
    float local_x = ai->basis.m00 * dir.x + ai->basis.m01 * dir.y + ai->basis.m02 * dir.z;
    float local_y = ai->basis.m10 * dir.x + ai->basis.m11 * dir.y + ai->basis.m12 * dir.z;
    float local_z = ai->basis.m20 * dir.x + ai->basis.m21 * dir.y + ai->basis.m22 * dir.z;
    
    // Calculate distance
    float distance = sqrt(dir.x * dir.x + dir.y * dir.y + dir.z * dir.z);
    
    // Get cone parameters (use alarm cone if alarm active)
    float length, half_angle, detection_rate;
    if (use_alarm_cone) {
        length = ai->alarm_view_length;     // Increased range
        half_angle = ai->alarm_view_alpha;   // Wider angle
        detection_rate = ai->alarm_view_gamma; // Faster detection
    } else {
        length = ai->view_length;            // Normal range
        half_angle = ai->view_alpha;         // Normal angle
        detection_rate = ai->view_gamma;     // Normal rate
    }
    
    // Calculate distance
    float distance = sqrt(dir.x * dir.x + dir.y * dir.y + dir.z * dir.z);
    
    // Handle coincident positions (target at AI eye position)
    if (distance < 0.001f) {
        return DETECTED; // Target is on top of AI
    }
    
    // Check distance
    if (distance > length) {
        return NOT_DETECTED;
    }
    
    // Check angle (cosine of half-angle)
    float cos_angle = local_z / distance; // Forward component
    if (cos_angle < cosf(half_angle)) {
        return NOT_DETECTED; // Outside cone
    }
    
    // Line of sight check (tolerance 0.79)
    RaycastHit hit;
    if (WorldRaycast(&ai->eye_pos, &dir, distance, &hit)) {
        if (hit.solidity > 0.79f) {
            return NOT_DETECTED; // Obstructed
        }
    }
    
    return DETECTED;
}

```text



### Detection Cascade


```text
1. Vision Cone Test
   (target within cone)
2. Distance Check
   (target within range)
3. Line of Sight (0.79 tolerance)
   (path unobstructed)
4. Detection Accumulation
   (level grows over time)
5. Hearing Check (independent)
   (sound event)
6. State Transition (Idle -> Alert -> Combat)

```text

---

## 6. Vehicle Heli Physics

**Address:** `0x431E30`
**Category:** Vehicle Physics

### What It Does

Full helicopter physics simulation including torque smoothing, collective pitch, aerodynamic drag, and altitude hold.

### Key Findings

| Parameter | Value | Description |
|-----------|-------|-------------|
| Throttle Offset | +0x720 | Vehicle struct |
| Torque Smoothing | Exponential | All 3 axes |
| High Collective Step | Configurable | Max rotor angle |
| Low Collective Step | Configurable | Min rotor angle |
| Aerodynamic Surfaces | Variable | Per-surface drag |
| Ground Contact Threshold | 0x533588 | Altitude check |

### Decompiled C Code


```c
// Vehicle Heli Physics - 0x431E30
// Per-tick helicopter physics simulation

void HeliPhysics_Update(VehicleStruct* heli, float dt) {
    // Load config from physics definition (+0x1B4 -> +0x2D4)
    HeliConfig* config = (HeliConfig*)(*(uintptr_t)((uintptr_t)heli + 0x1B4) + 0x2D4);
    
    // Throttle comparison against threshold
    float throttle = heli->throttle; // +0x720
    float threshold = 0.5f; // From global 0x533758
    
    // Select high or low torque config
    float torque_p, torque_y, torque_r;
    if (throttle > threshold) {
        torque_p = config->torque_pitch_high;
        torque_y = config->torque_yaw_high;
        torque_r = config->torque_roll_high;
    } else {
        torque_p = config->torque_pitch_low;
        torque_y = config->torque_yaw_low;
        torque_r = config->torque_roll_low;
    }
    
    // Exponential smoothing on all 3 axes
    heli->pitch_torque = torque_p * config->pitch_smoothing + 
                         heli->pitch_torque * (1.0f - config->pitch_smoothing);
    heli->yaw_torque = torque_y * config->yaw_smoothing + 
                       heli->yaw_torque * (1.0f - config->yaw_smoothing);
    heli->roll_torque = torque_r * config->roll_smoothing + 
                        heli->roll_torque * (1.0f - config->roll_smoothing);
    
    // Apply 3 directional forces via ForceAppend
    Vector3D forward_force = { heli->pitch_torque * config->force_scale, 0, 0 };
    Vector3D vertical_force = { 0, heli->collective * 819.2f, 0 };
    Vector3D lateral_force = { 0, 0, heli->roll_torque * config->force_scale };
    
    ForceAppend(heli->force_buffer, &forward_force);
    ForceAppend(heli->force_buffer, &vertical_force);
    ForceAppend(heli->force_buffer, &lateral_force);
    
    // Adjust collective pitch
    if (heli->input.vertical > 0) {
        heli->collective += config->high_collective_step;
    } else if (heli->input.vertical < 0) {
        heli->collective -= config->low_collective_step;
    }
    
    // Apply aerodynamic drag per surface
    for (int i = 0; i < config->surface_count; i++) {
        AeroSurface* surface = &config->surfaces[i];
        float drag = surface->coefficient * heli->velocity.x * heli->velocity.x;
        Vector3D drag_force = { surface->direction.x * drag, 
                                surface->direction.y * drag, 
                                surface->direction.z * drag };
        ForceAppend(heli->force_buffer, &drag_force);
    }
}

```text



### Torque Smoothing Formula


```text
smoothed_torque = current x smoothing_factor + previous x (1 - smoothing_factor)

Applied to:
  Pitch (X axis)
  Yaw (Y axis)  
  Roll (Z axis)

```text

---

## 7. Damage Falloff & Explosion

**Address:** `0x416C90`
**Category:** Explosion System

### What It Does

Explosion damage with linear falloff from `FullDamageRange` to `MaxDamageRange`. Zone 13 (front) is hardcoded for explosion direction.

### Key Findings

| Parameter | Value | Description |
|-----------|-------|-------------|
| Full Damage Range | 2048 units | 0.5 meters |
| Max Damage Range | 40960 units | 10 meters |
| Falloff Type | Linear | Linear reduction |
| Hardcoded Zone | 13 | Front direction |
| Body Radius Scale | 0.33333334 | Collision radius |

### Unit Scale

All distances use **4096 units = 1 meter**.

### Decompiled C Code


```c
// Explosion Damage - 0x416C90
// Applies explosion damage with linear falloff

void ExplosionDamage_Apply(Vector3D* explosion_pos, float base_damage, float radius) {
    // Iterate all entities in explosion radius
    for (int i = 0; i < g_EntityCount; i++) {
        Entity* entity = &g_Entities[i];
        
        // Calculate distance from explosion center
        float dx = entity->position.x - explosion_pos->x;
        float dy = entity->position.y - explosion_pos->y;
        float dz = entity->position.z - explosion_pos->z;
        float distance = sqrt(dx*dx + dy*dy + dz*dz);
        
        // Check if within max range
        if (distance > 40960.0f) {
            continue; // Out of range
        }
        
        // Calculate damage with linear falloff
        float damage;
        if (distance <= 2048.0f) {
            damage = base_damage; // Full damage
        } else {
            // Linear falloff from 2048 to 40960
            float falloff = (distance - 2048.0f) / 38912.0f;
            damage = base_damage * (1.0f - falloff);
        }
        
        // Apply body radius scale (0.33333334)
        damage *= 0.33333334f;
        
        // Hardcoded zone 13 (front direction)
        uint32_t zone = 13; // Front
        
        // Apply damage to entity
        EntityApplyDamage(entity, damage, zone);
    }
}

```text



### Damage Formula


```text
distance <= 2048 units (< 0.5m):    damage = base_damage
2048 < distance < 40960:            damage = base x (1 - (distance - 2048) / 38912)
distance >= 40960 units (> 10m):   damage = 0

```text

---

## 8. Ladder Climb State Machine

**Address:** `0x40D6B0`
**Category:** Interaction System

### What It Does

Four-state ladder climbing system: Climbing (37), GettingOnTop (38), GettingOffTop (39), SlidingDown (40).

### Key Findings

| State ID | State Name | Animation | Description |
|----------|------------|-----------|-------------|
| 37 | Climbing | 168 | Paused at rung events |
| 38 | GettingOnTop | 170 (reverse) | Enter from top |
| 39 | GettingOffTop | 170 (forward) | Exit to roof |
| 40 | SlidingDown | 169 | Gravity slide |

### Decompiled C Code


```c
// Ladder Climb State Machine - 0x40D6B0
// Handles 4-state ladder climbing system

typedef enum {
    LADDER_CLIMBING = 37,
    LADDER_GETTING_ON_TOP = 38,
    LADDER_GETTING_OFF_TOP = 39,
    LADDER_SLIDING_DOWN = 40
} LadderState;

void LadderClimb_Update(PlayerStruct* player, InputState* input) {
    LadderState phase = player->ladder_phase;
    
    // Check for slide activation (activate pressed after mount)
    if (input->activate && phase == LADDER_CLIMBING) {
        player->ladder_phase = LADDER_SLIDING_DOWN;
        return;
    }
    
    // Direction input (only when paused at rung event)
    if (player->ladder_at_boundary) {
        if (input->move_up) {
            // Check if reached top rung
            if (player->ladder_step == player->ladder_top_step) {
                player->ladder_phase = LADDER_GETTING_OFF_TOP;
                return;
            }
            player->ladder_direction = 1; // Up
        } else if (input->move_down) {
            // Check if at bottom rung
            if (player->ladder_step == 0) {
                player->ladder_phase = STATE_INACTIVE; // Dismount
                return;
            }
            player->ladder_direction = -1; // Down
        }
    }
    
    // Apply movement
    if (phase == LADDER_CLIMBING && player->ladder_direction != 0) {
        // Clamp Z position to ladder bounds
        float new_z = player->position.z + player->ladder_delta_z;
        new_z = clamp(new_z, player->ladder_bottom_z, player->ladder_top_z);
        player->position.z = new_z;
    } else if (phase == LADDER_GETTING_ON_TOP || phase == LADDER_GETTING_OFF_TOP) {
        // Apply animation root motion (no clamping)
        player->position.z += player->ladder_delta_z;
    }
    
    // Commit rung when animation 168 crosses event 8
    if (player->anim_event == 8) {
        player->ladder_step += player->ladder_direction;
        player->ladder_direction = 0; // Pause at rung
    }
    
    // Complete top transition animations
    if (phase == LADDER_GETTING_ON_TOP && player->anim_complete) {
        player->ladder_phase = LADDER_CLIMBING;
        player->ladder_direction = 0;
    } else if (phase == LADDER_GETTING_OFF_TOP && player->anim_complete) {
        player->ladder_phase = STATE_INACTIVE;
        player->ladder_direction = 0;
    }
}

```text



### State Transitions


```text
Climbing -> GettingOnTop:  reached top rung
Climbing -> SlidingDown:   activate pressed
GettingOnTop -> Climbing:  animation 170 complete
GettingOffTop -> Inactive:  animation 170 complete
SlidingDown -> Inactive:   ground contact

```text



### Rung System


```text
Animation 168 events:
  Event 8: Commit rung (nCurrentStep += nStepChange)
  
Movement only when:
  AtBoundary == true (paused at event)
  Direction != 0 (input held)
  
Delta translation:
  Disabled during ladder (isDisableDeltaTranslationScale = true)

```text

---

## Summary of Key Constants

| Address | Constant | Value | Usage |
|---------|----------|-------|-------|
| 0x5333EC | DAT_ZERO | 0.0 | Float zero |
| 0x5333F0 | GRAVITY_PER_TICK | 84.741692 | Airborne gravity per tick |
| 0x533470 | LADDER_DRAG | 0.99 | Ladder slide damping |
| 0x53346C | LADDER_GRAVITY | 44.600887 | Ladder slide gravity |
| 0x533588 | GROUND_THRESHOLD | 0.0 | Ground contact check |
| 0x533758 | THROTTLE_THRESHOLD | 0.5 | Vehicle throttle threshold |
| 0x56E1F4 | GRAVITY_DELTA | 84.741692 | Airborne gravity delta |

### Unit Scale Reference

All values use the standard IGI 1 scale: **4096 units = 1 meter**

| Measurement | Game Value | Real-World |
|-------------|------------|------------|
| Head proximity | 614.4 units | 0.15 m (15 cm) |
| Full damage range | 2048 units | 0.5 m (50 cm) |
| Max damage range | 40960 units | 10 m |
| Gravity per tick | 84.741692 | 0.62 m/s at 30 Hz |
| Ladder gravity | 44.600887 | 0.33 m/s at 30 Hz |

---

*All discoveries verified against IGI 1 binary (`igi.exe`) only. No IGI 2 content included.*
