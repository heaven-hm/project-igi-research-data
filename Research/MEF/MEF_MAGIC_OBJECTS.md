# MagicObject System

MagicObjects are mesh sub-parts with runtime behavior. They are the engine's system for giving interactivity to parts of a 3D model — a door that swings, glass that shatters, a ladder you can climb, helicopter rotors that spin.

The system is split across two data sources that the engine combines at load time:

| Data Source          | Role                                                        |
|----------------------|-------------------------------------------------------------|
| `magicobjconfig.qsc` | Defines the **behavior** (what type of interactive object)  |
| Parent model ATTA    | Defines the **placement** (transform in the parent mesh)    |

## 9.1 MagicObject Config Files

Two formats exist depending on game version:

**IGI 1** — `magicobjconfig.qsc` uses `Task_New`:
```qsc
Task_New(-1, "MagicObjConfig",
    "name",       // lookup key — matches ATTA entry name
    "model_id",   // which .mef mesh to use
    TASKTYPE_XXX  // what behavior to apply
);
```

**IGI 2** — `magicobj.qvm` (compiled from `magicobj.qsc`) uses `DefineMagicObj`:
```qsc
DefineMagicObj("model_id", "model_id", TASKTYPE_XXX);
// Some task types have extra parameters:
DefineMagicObj("614_02_1", "614_02_1", TASKTYPE_AISTATIONARYGUN, "614_03_1", 361, 15, -4, 10000, 15, 15, "tank_turret", 0, 6);
DefineMagicObj("610_02_1", "610_02_1", TASKTYPE_CARDOOR, 0, 30, -118);
DefineMagicObj("700_05_1", "700_05_1", TASKTYPE_HELIDOOR, 1, 0.6, 2.65);
```

The engine checks every ATTA sub-model name against this registry at spawn time. If found, it spawns a MagicObject with the configured behavior; if not found, it spawns a static visual sub-part.

The **parent** vehicle models (`614_01_1`, `622_01_1`, `700_01_1`) are NOT listed in magicobj — they are plain parent meshes. Only their ATTA sub-models (turrets, wheels, rotors, doors) are registered as MagicObjects.

`editormagicobj.qvm` is a parallel file used by the level editor only — it shipped empty in the retail game.

## 9.2 Task Types

179 total MagicObj entries across all levels, using 15 distinct task types:

| TASKTYPE               | Count | Description                                                                 |
|------------------------|-------|-----------------------------------------------------------------------------|
| `SHADOWVOLUME`         | 72    | Simplified geometry for stencil shadow casting. Most common — nearly every weapon and prop has one. Rendered separately from the main mesh. |
| `GLASS`                | 64    | Breakable glass panels. Shatters on bullet impact or explosion.             |
| `LADDER`               | 15    | Climbable surface. Player can interact to climb up/down.                   |
| `DEATHZONE`            | 5     | Invisible kill volume. Instant death on contact (helicopter blades, fall zones). Models: `killbox`, `Killair`, `603_13`, `603_14`, `610_04`. |
| `WHEEL`                | 5     | Rotating wheel/tire. Spins based on vehicle movement. Models: `600_05`, `600_06`, `616_02`, `661_02`, `663_02`. |
| `AISTATIONARYGUN`      | 4     | Mounted gun position. AI or player can man it. Models: `313_09` (tripod gun), `661_03`, `700_01`, `720_06` (heli gun). |
| `GRENADEPIN`           | 3     | Grenade pin that detaches on throw. Used by explosive, smoke, and flashbang grenades. |
| `ROTOR`                | 3     | Helicopter rotor blade. Spins continuously. Models: `711_01`, `711_02`, `712_01`. |
| `HITZONE`              | 2     | Damageable area (e.g. vehicle fuel tank). Has max damage and smoke threshold. Models: `709_02`, `709_03`. |
| `CARDOOR`              | 1     | Hinged vehicle door. Rotation axis, 30 deg/sec speed, −118 deg max angle. Model: `610_02`. |
| `DRAWER`               | 1     | Openable drawer. Model: `221_02`.                                           |
| `RPGROCKET`            | 1     | RPG rocket projectile in flight. Model: `140_02`.                          |
| `BOMBBACKPACK`         | 1     | Explosive backpack. Model: `113_02`.                                        |
| `WEAPONMAGICOBJ`       | 1     | Generic weapon attachment point. `model=none` (virtual, no mesh).          |
| `PRIMARYMAGICOBJ`      | 1     | Generic primary attachment point. `model=none` (virtual, no mesh).         |

**Shadow volumes dominate:** 72 of 179 entries (40%) are `SHADOWVOLUME`. In the early 2000s, stencil shadow volumes were the standard real-time shadow technique. The engine needed a separate simplified mesh to project shadows — using the full-detail model was too expensive. These shadow meshes are stored as ATTA sub-parts; `magicobjconfig` tells the engine "this sub-part is a shadow volume, don't render it normally."

## 9.3 XTVM -- Magic Vertices vs MagicObjects

XTVM magic vertices and the MagicObject system serve different purposes and are **independent**:

| Feature        | XTVM Magic Vertices                             | ATTA MagicObjects                              |
|----------------|-------------------------------------------------|------------------------------------------------|
| Storage        | XTVM chunk in parent `.mef`                     | ATTA chunk + `magicobjconfig.qsc`              |
| What it is     | A 3D position within the model                  | A separate sub-mesh with behavior              |
| Purpose        | Engine event hook (gun fire origin, etc.)        | Interactive sub-object (door, glass, rotor...) |
| Rendering      | Not rendered — invisible to player              | Has its own `.mef` mesh, may render            |
| Relationship   | No direct relationship to ATTA entries          | Referenced by ATTA name in parent model        |

A model can have both: e.g., an AK47 has XTVM magic vertices for muzzle/clip positions *and* an ATTA sub-model registered as `SHADOWVOLUME`.

## 9.4 Examples

### Guard Tower (600 family)
```
600_01_1.mef  (main structure — building mesh)
│
├── ATTA "600_02_1"  → magicobjconfig TASKTYPE_GLASS     (breakable window)
├── ATTA "600_03_1"  → magicobjconfig TASKTYPE_GLASS     (another window)
├── ATTA "600_04_1"  → magicobjconfig TASKTYPE_GLASS     (×2, two more panels)
├── ATTA "600_05_1"  → magicobjconfig TASKTYPE_WHEEL     (rotating parts, ×2)
├── ATTA "600_06_1"  → magicobjconfig TASKTYPE_WHEEL     (more rotating parts, ×4)
├── ATTA "killbox"   → magicobjconfig TASKTYPE_DEATHZONE (invisible kill volume)
├── ATTA "truckshade" → NOT in magicobjconfig            (static shadow mesh)
│
└── XTVM: 8 magic vertices  (independent — unknown purpose)
```

### AK47 (107 family)
```
107_01_1.mef  (gun body)
│
├── ATTA "107_02_1"  → NOT in magicobjconfig   (scope/sight — static visual)
├── ATTA "107_03_1"  → NOT in magicobjconfig   (magazine — static visual)
├── ATTA "107_04_1"  → magicobjconfig TASKTYPE_SHADOWVOLUME
│                      (simplified shadow mesh for stencil shadow rendering)
│
└── XTVM: 4 magic vertices  (2 active positions, 2 null/zero entries)

107_05_1  → also in magicobjconfig TASKTYPE_SHADOWVOLUME
            (not referenced by 107_01_1 ATTA — used by LOD variants)
```

## 9.5 Engine Load Sequence
```
1. Load parent mesh (e.g. 600_01_1.mef)
2. Parse ATTA chunk → list of sub-model names + transforms
3. For each ATTA entry:
   a. Check name against magicobjconfig registry
   b. If found  → spawn MagicObject(model, transform, taskType)
   c. If not found → spawn static visual sub-part at transform
4. Parse XTVM chunk → register magic vertex positions for engine events
   (gun clip positions, ladder interaction zones, etc.)
```
