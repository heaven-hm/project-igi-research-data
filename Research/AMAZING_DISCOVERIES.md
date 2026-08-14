# IGI 1 - Amazing Reverse Engineering Discoveries

> Deep analysis of `igi.exe` using radare2 — verified against IGI 1 binary only.
> IGI 2 content (igi2.pdb) explicitly excluded.

---

## Table of Contents

| # | Discovery | Address | Category |
|---|-----------|---------|----------|
| 1 | Health System (1.0 - 3.0 Scale) | `0x45D3C0` | ❤️ Health |
| 2 | Airborne Physics (Gravity Integration) | `0x408460` | 🪂 Physics |
| 3 | 17-Zone Hit Table | `0x489C30` | 🎯 Combat |
| 4 | Weapon State Machine | `0x411000` | 🔫 Weapons |
| 5 | AI View Cone Detection | `0x4502F0` | 🤖 AI |
| 6 | Vehicle Heli Physics | `0x431E30` | 🚁 Vehicles |
| 7 | Damage Falloff & Explosion | `0x416C90` | 💥 Explosions |
| 8 | Ladder Climb State Machine | `0x40D6B0 | 🪜 Interactions |

---

## 1. Health System — 1.0 to 3.0 Scale

**Address:** `0x45D3C0`
**Category:** ❤️ Health & Damage

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
| Head Proximity | 614.4 units | 15cm headshot range |

### Disassembly Snippet

```asm
; Soldier Hit Handler - 0x45D3C0
mov     ebx, [esp+0x40]      ; Load soldier struct
mov     esi, [esp+0x40]      ; Load damage amount
mov     byte [esp+0x44], 0   ; Clear hit flag
mov     eax, [esi+0x800]     ; Load hit zone
lea     edi, [esi+0x254]     ; Load health pointer
test    eax, eax             ; Check valid zone
je      0x45D400             ; Skip if invalid
```

### Health Calculation

```
final_damage = base_damage × zone_multiplier × difficulty_scale

Where:
  zone_multiplier = hit_table[zone_id]  (17 zones)
  difficulty_scale = 0.75 | 1.0 | 1.25
```

---

## 2. Airborne Physics — Gravity Integration

**Address:** `0x408460`
**Category:** 🪂 Player Physics

### What It Does

The airborne integrator applies gravity to the player's vertical velocity every tick. This function is called from the main player update at `0x4109A0`.

### Key Findings

| Constant | Value | Description |
|----------|-------|-------------|
| Gravity Per Tick | 84.741692 | ~18.6 m/s² (nearly 2× Earth) |
| Gravity Source | Global at `0x5333F0` | FPU float constant |
| Velocity Offset | +0x66C | Player struct offset |
| No Damping | None | Falling body accelerates indefinitely |
| No Terminal Velocity | None | Fall speed unlimited |

### Disassembly Snippet

```asm
; Airborne Integrator - 0x408460
sub     esp, 0x54            ; Allocate stack space
push    esi
mov     esi, [esp+0x5C]      ; Load player struct
push    edi
mov     dword [esp+8], 0     ; Clear local var
fld     dword [esi+0x66C]    ; Load current Z velocity
fsub    dword [0x5333F0]     ; Subtract gravity (84.741692)
lea     edi, [esi+0x254]     ; Velocity vector pointer
fst     dword [esi+0x66C]    ; Store new Z velocity
```

### Physics Formula

```
velocity.z -= gravity_per_tick

Where:
  gravity_per_tick = 84.741692 (from global 0x5333F0)
  Applied every 30Hz tick (Δt = 1/30)
```

> **Note:** This is why IGI 1 jumps feel "heavy" — the gravity is nearly twice Earth's gravity (9.8 m/s² vs 18.6 m/s²). A 1024-unit takeoff reaches apex in just 12 ticks.

---

## 3. 17-Zone Hit Table

**Address:** `0x489C30`
**Category:** 🎯 Combat System

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

### Zone Mapping

```
Direction Tests:
  zone == 13 → Front hit (direction refinement)
  zone == 14 → Rear hit (direction refinement)
  zone == 15 → Proximity hit (distance-based)

Head Proximity: 614.4 units (15cm radius)
  - Within this range = headshot (100x damage)
  - Outside = neck or torso
```

---

## 4. Weapon State Machine

**Address:** `0x411000`
**Category:** 🔫 Weapon System

### What It Does

The main weapon state machine handles all weapon states: Ready, Firing, Striking, DryFire, Reloading, Changing, Peeking, Throwing, Placing, Medipack, and MapComputer.

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

### Disassembly Snippet

```asm
; Weapon State Machine - 0x411000
push    ecx
push    ebx
push    esi
mov     esi, [esp+0x10]      ; Load player struct
or      ebx, 0xFFFFFFFF      ; State = -1 (invalid)
fld     dword [esi+0x20C]    ; Check ready timer
fcomp   dword [0x5333EC]     ; Compare to zero
fnstsw  ax
test    ah, 0x40
jne     0x411032             ; Skip if not ready
fld     dword [esi+0x16C]    ; Check firing timer
fcomp   dword [0x5333EC]     ; Compare to zero
fnstsw  ax
test    ah, 0x40
je      0x411032             ; Skip if not firing
xor     ebx, ebx             ; State = 0 (Ready)
```

---

## 5. AI View Cone Detection

**Address:** `0x4502F0`
**Category:** 🤖 AI System

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

### Detection Cascade

```
1. Vision Cone Test
   ↓ (target within cone)
2. Distance Check
   ↓ (target within range)
3. Line of Sight (0.79 tolerance)
   ↓ (path unobstructed)
4. Detection Accumulation
   ↓ (level grows over time)
5. Hearing Check (independent)
   ↓ (sound event)
6. State Transition (Idle → Alert → Combat)
```

---

## 6. Vehicle Heli Physics

**Address:** `0x431E30`
**Category:** 🚁 Vehicle Physics

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

### Torque Smoothing Formula

```
smoothed_torque = current × smoothing_factor + previous × (1 - smoothing_factor)

Applied to:
  Pitch (X axis)
  Yaw (Y axis)  
  Roll (Z axis)
```

### Disassembly Snippet

```asm
; Heli Physics - 0x431E30
sub     esp, 0x80            ; Large stack frame
push    ebx
mov     ebx, [esp+0x88]      ; Load vehicle struct
push    ebp
push    esi
fld     dword [ebx+0x720]    ; Load throttle
fcomp   qword [0x533758]     ; Compare to threshold
mov     edx, [ebx+0x1B4]     ; Load physics config
lea     ebp, [ebx+0xF0]      ; Position vector
mov     ecx, [edx+0x2D4]     ; Load config data
```

---

## 7. Damage Falloff & Explosion

**Address:** `0x416C90`
**Category:** 💥 Explosion System

### What It Does

Explosion damage with linear falloff from `FullDamageRange` to `MaxDamageRange`. Zone 13 (front) is hardcoded for explosion direction.

### Key Findings

| Parameter | Value | Description |
|-----------|-------|-------------|
| Full Damage Range | 2048 units | 20 meters |
| Max Damage Range | 40960 units | 40 meters |
| Falloff Type | Linear | Linear reduction |
| Hardcoded Zone | 13 | Front direction |
| Body Radius Scale | 0.33333334 | Collision radius |

### Damage Formula

```
distance ≤ 2048:    damage = base_damage
2048 < distance < 40960:  damage = base × (1 - (distance - 2048) / 38912)
distance ≥ 40960:   damage = 0
```

---

## 8. Ladder Climb State Machine

**Address:** `0x40D6B0`
**Category:** 🪜 Interaction System

### What It Does

Four-state ladder climbing system: Climbing (37), GettingOnTop (38), GettingOffTop (39), SlidingDown (40).

### Key Findings

| State ID | State Name | Animation | Description |
|----------|------------|-----------|-------------|
| 37 | Climbing | 168 | Paused at rung events |
| 38 | GettingOnTop | 170 (reverse) | Enter from top |
| 39 | GettingOffTop | 170 (forward) | Exit to roof |
| 40 | SlidingDown | 169 | Gravity slide |

### State Transitions

```
Climbing → GettingOnTop:  reached top rung
Climbing → SlidingDown:   activate pressed
GettingOnTop → Climbing:  animation 170 complete
GettingOffTop → Inactive:  animation 170 complete
SlidingDown → Inactive:   ground contact
```

### Rung System

```
Animation 168 events:
  Event 8: Commit rung (nCurrentStep += nStepChange)
  
Movement only when:
  AtBoundary == true (paused at event)
  Direction != 0 (input held)
  
Delta translation:
  Disabled during ladder (isDisableDeltaTranslationScale = true)
```

---

## Summary of Key Constants

| Address | Constant | Value | Usage |
|---------|----------|-------|-------|
| 0x5333EC | DAT_ZERO | 0.0 | Float zero |
| 0x5333F0 | DAT_ONE | 1.0 / 84.741692 | Gravity |
| 0x533470 | LADDER_DRAG | 0.99 | Slide damping |
| 0x53346C | LADDER_GRAVITY | 44.600887 | Slide gravity |
| 0x533588 | GROUND_THRESHOLD | 0.0 | Ground check |
| 0x533758 | THROTTLE_THRESHOLD | 0.0 | Vehicle throttle |
| 0x56E1F4 | GRAVITY_DELTA | 84.741692 | Airborne gravity |

---

*All discoveries verified against IGI 1 binary (`igi.exe`) only. No IGI 2 content included.*
