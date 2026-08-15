# MEF - Complete Reference

Consolidated documentation for MEF file format.

---

## Mef 3D Components

| 3D Component | Information |
|---|---|
| HSEM | Model Info |
| ATTA | Attachment |
| XTVM | Magic Vertices |
| TROP | Portal Definition |
| XVTP | Portal Vertices |
| CFTP | Portal Faces |
| D3DR | Render Mesh Info |
| DNER | Render Mesh Materials |
| ECAF | Render Mesh Faces |
| XTRV | Render Mesh Vertices |
| PMTL | Render Mesh Lightmap |
| WOLG | Glow Sprites |
| HSMC | Collision Mesh Definition |
| XTVC | Collision Mesh Vertices (type0) |
| ECFC | Collision Mesh Faces (type0) |
| TAMC | Collision Mesh Materials (type0) |
| HPSC | Collision Mesh Spheres (type0) |
| XTVC | Collision Mesh Vertices (type1) |
| ECFC | Collision Mesh Faces (type1) |
| TAMC | Collision Mesh Materials (type1) |
| HPSC | Collision Mesh Spheres (type1) |
| REIH | Bone Hierarchy Info |
| MANB | Bone Names Info |
| SEMS | Shadow Model Header |
| XTVS | Shadow Mesh Vertices |
| CAFS | Shadow Mesh Faces |
| EGDE | Shadow Mesh Edges |

---

## Mef Components

| Data Type  | Field Name | Field Type  | Field Description                      |
|------------|------------|------------|----------------------------------------|
| HSEM       | _0         | Integer    |                                        |
|            | yy         | Integer    | datetime                               |
|            | mm         | Integer    | datetime                               |
|            | dd         | Integer    | datetime                               |
|            | hh         | Integer    | datetime                               |
|            | mn         | Integer    | datetime                               |
|            | ss         | Integer    | datetime                               |
|            | ms         | Integer    | datetime                               |
|            | mt         | Integer    | modeltype                              |
|            | _1         | Integer    | 0                                      |
|            | _2         | Integer    | 0                                      |
|            | _3         | Integer    | 0                                      |
|            | f0         | Float      |                                        |
|            | f1         | Float      |                                        |
|            | f2         | Float      |                                        |
|            | f3         | Float      |                                        |
|            | f4         | Float      |                                        |
|            | f5         | Float      |                                        |
|            | f6         | Float      |                                        |
|            | f7         | Float      |                                        |
|            | f8         | Float      |                                        |
|            | f9         | Float      |                                        |
|            | fa         | Float      |                                        |
|            | fb         | Float      |                                        |
|            | fn         | Integer    | render faces count                     |
|            | vn         | Integer    | render verts count                     |
|            | _6         | Integer    |                                        |
|            | cv         | Integer    | collision verts count                  |
|            | cf         | Integer    | collision faces count                  |
|            | _9         | Integer    | 0                                      |
|            | fc         | Float      |                                        |
|            | mg         | Integer    | magic verts count                      |
|            | an         | Integer    | attachments count                      |
|            | pv         | Integer    | portal verts count                     |
|            | pf         | Integer    | portal faces count                     |
|            | pn         | Integer    | portal count                           |
|            | _f         | Integer    | 0                                      |
|            | rs         | (Integer, 20) |                                    |
| ATTA       | obj        | (String, 16) |                                |
|            | loc        | (Float, 3)  |                                |
|            | _3         | Float      |                                        |
|            | _4         | Float      |                                        |
|            | _5         | Float      |                                        |
|            | _6         | Float      |                                        |
|            | _7         | Float      |                                        |
|            | _8         | Float      |                                        |
|            | _9         | Float      |                                        |
|            | _a         | Float      |                                        |
|            | _b         | Float      |                                        |
|            | _c         | Integer    |                                        |
| XTVM       | pos        | (Float, 3)  |                                |
|            | _3         | Integer    |                                        |
| TROP       | vertsoff   | Integer    |                                        |
|            | vertsnum   | Integer    |                                        |
|            | facesoff   | Integer    |                                        |
|            | facesnum   | Integer    |                                        |
|            | portalid   | Integer    |                                        |
| XVTP       |             | (Float, 3)  |                                |
| CFTP       |             | (Integer, 3) |                                |
| D3DR_0     | _0         | Integer    |                                        |
|            | facesnum   | Integer    |                                        |
|            | partsnum   | Integer    |                                        |
|            | vertsnum   | Integer    |                                        |
|            | reserved   | (Integer, 8)  |                                |
| D3DR_1     | _0         | Integer    |                                        |
|            | facesnum   | Integer    |                                        |
|            | partsnum   | Integer    |                                        |
|            | vert0num  | Integer    |                                        |
|            | vert1num  | Integer    |                                        |
|            | vertsnum   | Integer    |                                        |
|            | reserved   | (Integer, 8)  |                                |
| D3DR_3     | _0         | Integer    |                                        |
|            | ltmapnum   | Integer    |                                        |
|            | facesnum   | Integer    |                                        |
|            | partsnum   | Integer    |                                        |
|            | vertsnum   | Integer    |                                        |
|            | _5         | Integer    |                                        |
|            | _6         | Integer    |                                        |
|            | reserved   | (Integer, 7)  |                                |
| DNER_0     | location   | (Float, 3)  |                              |
|            | indexnum   | Integer    |                                        |
|            | nextoffs   | Integer    |                                        |
|            | parentid   | Integer    |                                        |
|            | vertsoff   | Integer    |                                        |
|            | vertsnum   | Integer    |                                        |
|            | _8         | Integer    |                                        |
|            | _9         | Integer    |                                        |
|            | _a         | Integer    |                                        |
| DNER_3     | location   | (Float, 3)  |                              |
|            | indexnum   | Integer    |                                        |
|            | nextoffs   | Integer    |                                        |
|            | parentid   | Integer    |                                        |
|            | _6         | Integer    |                                        |
|            | vertsoff   | Integer    |                                        |
|            | vertsnum   | Integer    |                                        |
|            | _9         | Integer    |                                        |
|            | _a         | Integer    |                                        |
|            | _b         | Integer    |                                        |
|            | _c         | Integer    |                                        |
| XTRV_0     | pos        | (Float, 3)  |                                |
|            | _3         | Float      |                                        |
|            | _4         | Float      |                                        |
|            | _5         | Float      |                                        |
|            | uv0        | (Float, 2)  |                                |
| XTRV_1     | pos        | (Float, 3)  |                                |
|            | _3         | Float      |                                        |
|            | _4         | Float      |                                        |
|            | _5         | Float      |                                        |
|            | uv0        | (Float, 2)  |                                |
|            | uv1        | (Float, 2)  |                                |
| XTRV_3     | pos        | (Float, 3)  |                                |
|            | _3         | Float      |                                        |
|            | _4         | Float      |                                        |
|            | _5         | Float      |                                        |
|            | uv0        | (Float, 2)  |                                |
|            | uv1        | (Float, 2)  |                                |
| PMTL       | _0         | Integer    |                                        |
|            | _1         | Integer    |                                        |
|            | _2         | Integer    |                                        |
|            | _3         | Integer    |                                        |
| HSMC       | fn         | Integer    |                                        |
|            | vn         | Integer    |                                        |
|            | mn         | Integer    |                                        |
|            | sn         | Integer    |                                        |
|            | _0         | Integer    |                                        |
|            | _1         | Integer    |                                        |
|            | _2         | Integer    |                                        |
|            | _3         | Integer    |                                        |
| XTVC       | pos        | (Float, 3)  |                                |
|            | _3         | Integer    |                                        |
| ECFC       | _0         | Integer    |                                        |
|            | _1         | Integer    |                                        |
|            | _2         | Integer    |                                        |
|            | _3         | Integer    |                                        |
| TAMC       | _0         | Integer    |                                        |
|            | _1         | Integer    |                                        |
|            | _2         | Integer    |                                        |
|            | _3         | Integer    |                                        |
|            | _4         | Integer    |                                        |
|            | _5         | Integer    |                                        |
| HPSC       | _0         | Float      |                                        |
|            | _1         | Float      |                                        |
|            | _2         | Float      |                                        |
|            | _3         | Float      |                                        |
|            | _4         | Integer    |                                        |
|            | _5         | Integer    |                                        |
|            | _6         | Integer    |                                        |
|            | _7         | Integer    |                                        |

---

## Mef Format

**Extension:** `.mef`
**Container:** ILFF with format ID `"HSEM"` (at offset 0x10)

MEF files store 3D geometry for buildings, props, characters, and vehicles. The game uses a Z-up coordinate system. Vertex positions in MEF files are stored in native game units; the editor applies a scale factor of **1.0 / 40.96** when importing to convert to meters.

```c
constexpr float kNativeMefImportScale = 1.0f / 40.96f;
```

## 2.1 Chunk Overview

A typical MEF file contains these chunks (order may vary):

| FourCC | Name                | Description                                               |
|--------|---------------------|-----------------------------------------------------------|
| `HSEM` | Mesh Info           | Model metadata including model type                       |
| `XTRV` | Vertices (render)   | Interleaved vertex data for rendering                     |
| `DNER` | Render blocks       | Triangle indices + per-block metadata                     |
| `ECAF` | Face indices        | Separate index buffer (used by Type 1 bone models)        |
| `D3DR` | D3D Render info     | Face/mesh/vertex counts                                   |
| `XTVC` | Collision vertices  | Collision mesh vertices (16 bytes each, IGI 1)            |
| `ECFC` | Collision faces     | Collision mesh face indices (8 bytes each, IGI 1)         |
| `TAMC` | Material config     | Per-face material properties (opacity, diffuse, portal)   |
| `ATTA` | Attachments         | Sub-model attachment points with transform matrix (68 bytes each) |
| `XTVM` | Magic vertices      | Special-purpose vertices for game events (16 bytes each)  |
| `REIH` | Bone hierarchy      | Bone parent/child relationships and rest-pose pivots      |
| `MANB` | Bone names          | Bone name strings (16 bytes each, null-padded)            |
| `TROP` | Portal records      | Portal zone entries (20 bytes each)                       |
| `XVTP` | Portal vertices     | Portal mesh vertex positions (12 bytes each)              |
| `CFTP` | Portal faces        | Portal mesh triangle indices (12 bytes each)              |
| `PMTL` | Portal materials    | Material IDs for portal zones (16 bytes each)             |

## 2.2 HSEM Chunk -- Mesh Info

The HSEM chunk contains model metadata. The model type field is critical for determining vertex layout.

| Offset (in chunk data) | Size | Type   | Description           |
|------------------------|------|--------|-----------------------|
| 0x00                   | 32   | -      | Reserved / unknown    |
| 0x20                   | 4    | uint32 | **Model type** (0, 1, or 3) |

The chunk must be at least 36 bytes to contain the model type field.

## 2.3 Model Types and Vertex Layouts

### Type 0 -- Rigid Model (32-byte vertex)
Used for static props and buildings with no skeletal animation.

| Byte Offset | Size | Type    | Field         |
|-------------|------|---------|---------------|
| 0x00        | 4    | float32 | Position X    |
| 0x04        | 4    | float32 | Position Y    |
| 0x08        | 4    | float32 | Position Z    |
| 0x0C        | 4    | float32 | Normal X      |
| 0x10        | 4    | float32 | Normal Y      |
| 0x14        | 4    | float32 | Normal Z      |
| 0x18        | 4    | float32 | UV U          |
| 0x1C        | 4    | float32 | UV V          |
**Total: 32 bytes per vertex.** UV offset within vertex: 24.

### Type 1 -- Bone/Skeletal Model (40-byte vertex)
Used for animated characters and objects with skeletal rigs.

**Note on Animations & Skeletons:**
They are not in a single file because one animation can be applied to different models. For example, enemy soldiers from level to level have different models but animations are the same. 

But there is a constraint that defines which animations to which models we can apply: the skeleton of the model should be exactly the same as the skeleton of the animation, exactly the same number of bones, exactly the same joints, and exactly the same names.

Some MEFs have two chunks `REIH` (reversed HIER - Bone Hierarchy) and `MANB` (reversed BNAM - Bone names).
* `REIH` contains the bones, their hierarchy, and their offsets.
* `MANB` contains names.

All IFFs have a chunk `REIH` (bone hierarchy). The binary structure is exactly the same as in MEFs `REIH`. But `MANB` (bone names) in IFFs we don't have. So you should have hardcoded bone names in your animation exporter.
There are typically two variations of skeletons:
* with 31 bones - for 3rd party animations
* with 47 bones - for 1st party animations

| Byte Offset | Size | Type    | Field             |
|-------------|------|---------|-------------------|
| 0x00        | 4    | float32 | Position X        |
| 0x04        | 4    | float32 | Position Y        |
| 0x08        | 4    | float32 | Position Z        |
| 0x0C        | 4    | float32 | Normal X          |
| 0x10        | 4    | float32 | Normal Y          |
| 0x14        | 4    | float32 | Normal Z          |
| 0x18        | 4    | float32 | UV0 U             |
| 0x1C        | 4    | float32 | UV0 V             |
| 0x20        | 4    | float32 | UV1 U / bone data |
| 0x24        | 4    | float32 | UV1 V / bone data |
**Total: 40 bytes per vertex.** Primary UV offset within vertex: 24.

### Type 3 -- Lightmap Model (40-byte vertex)
Used for level geometry with lightmap UVs.

| Byte Offset | Size | Type    | Field              |
|-------------|------|---------|-------------------|
| 0x00        | 4    | float32 | Position X         |
| 0x04        | 4    | float32 | Position Y         |
| 0x08        | 4    | float32 | Position Z         |
| 0x0C        | 4    | float32 | UV0 U (primary)    |
| 0x10        | 4    | float32 | UV0 V (primary)    |
| 0x14        | 4    | float32 | UV1 U (lightmap)   |
| 0x18        | 4    | float32 | UV1 V (lightmap)   |
| 0x1C        | 12   | -       | Additional data    |
**Total: 40 bytes per vertex.** Primary UV offset within vertex: 12.

### Summary Table
| Model Type | Vertex Size | UV Offset | Description |
|------------|-------------|-----------|-------------|
| 0          | 32 bytes    | 24        | Rigid (pos + normal + uv) |
| 1          | 40 bytes    | 24        | Bone/skeletal (pos + normal + uv0 + uv1) |
| 3          | 40 bytes    | 12        | Lightmap (pos + uv0 + uv1 + ...) |
The vertex count is determined by: `XTRV.chunk_data_size / vertex_size`.

## 2.4 D3DR Chunk -- Render Info
The D3DR chunk stores face, mesh, and vertex counts. Its layout depends on the model type.

### Type 0 (Rigid) -- D3DR Layout
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 4    | uint32 | (unknown)   |
| 0x04   | 4    | uint32 | numFaces    |
| 0x08   | 4    | uint32 | numMeshes   |
| 0x0C   | 4    | uint32 | numVerts    |
Minimum chunk size: 16 bytes.

### Type 1 (Bone) -- D3DR Layout
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 4    | uint32 | (unknown)   |
| 0x04   | 4    | uint32 | numFaces    |
| 0x08   | 4    | uint32 | numMeshes   |
| 0x0C   | 4    | uint32 | verts0      |
| 0x10   | 4    | uint32 | verts1      |
| 0x14   | 4    | uint32 | numVerts    |
Minimum chunk size: 24 bytes.

### Type 3 (Lightmap) -- D3DR Layout
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 4    | uint32 | (unknown)   |
| 0x04   | 4    | uint32 | (unknown)   |
| 0x08   | 4    | uint32 | numFaces    |
| 0x0C   | 4    | uint32 | numMeshes   |
| 0x10   | 4    | uint32 | numVerts    |
Minimum chunk size: 20 bytes.

## 2.5 DNER Chunk -- Render Blocks / Triangle Indices
The DNER chunk encodes triangle indices organized into render blocks (one per material/submesh). There are two parsing strategies depending on the model type.

### 2.5.1 Packed DNER (Type 0 and Type 3, fallback for Type 1)
Each render block has a variable-length header followed by packed uint16 index triples.

**Block header (28 bytes for Type 0/1, 32 bytes for Type 3):**
| Offset | Size | Type   | Field                    | Notes                    |
|--------|------|--------|--------------------------|--------------------------|
| 0x00   | 12   | -      | Reserved/unknown         |                          |
| 0x0C   | 2    | int16  | indexCount               | Number of uint16 indices |
| 0x0E   | 2    | int16  | nextoffs                 | -1 = last block          |
| 0x10   | 2    | int16  | materialSlot (Type 3)    | Only present in Type 3   |
| 0x12   | 2    | uint16 | vertsOffset              | Base vertex offset       |
| 0x14   | 2    | uint16 | vertsCount               | Vertex count for block   |

For Type 0/1, `materialSlot` is the block's sequential index. For Type 0/1, `vertsOffset` is at byte 18 and `vertsCount` at byte 20 (0-indexed within the block header).
**Index data:** Immediately following the header, `indexCount` uint16 values are packed. Every 3 consecutive indices define one triangle. The final vertex index for each triangle is `vertsOffset + local_index`. The linked iteration terminates when `nextoffs == -1`.

### 2.5.2 Split Bone DNER (Type 1 with ECAF)
When a Type 1 model has both DNER and ECAF chunks, the DNER chunk contains fixed-size bone records (32 or 28 bytes each), and the ECAF chunk contains the actual triangle indices.

**DNER bone record (28-byte and 32-byte variants):**
| Offset (28-byte) | Offset (32-byte) | Size | Type    | Field        | Description                                  |
|------------------|------------------|------|---------|--------------|----------------------------------------------|
| 0x00             | 0x00             | 12   | float32 | `px, py, pz` | Joint rest-pose local position translation  |
| 0x0C             | 0x0C             | 2    | uint16  | `numFace`    | Index count (in bytes: `numFace * 2` index)   |
| 0x0E             | 0x0E             | 2    | int16   | `skip`       | Offset index                                 |
| -                | 0x10             | 2    | int16   | `td`         | Texture descriptor index                     |
| 0x10             | 0x12             | 2    | uint16  | `offVerts`   | Base vertex offset                           |
| 0x12             | 0x14             | 2    | uint16  | `numVerts`   | Vertex count in this bone submesh            |
| 0x14             | 0x16             | 2    | uint16  | `rawOpacity` | Base material opacity index                  |
| 0x16             | 0x18             | 1    | uint8   | `eflame`     | Emissive flame multiplier                    |
| 0x17             | 0x19             | 1    | uint8   | `mshine`     | Material shininess factor                    |
| 0x18             | 0x1A             | 1    | uint8   | `scolor`     | Specular color (or diffuse color index)      |
| 0x19             | 0x1B             | 1    | uint8   | `opacitd`    | Opacity detail                               |
| -                | 0x1C             | 4    | uint32  | `_0`         | Padding/alignment zero bytes                 |

* **Record stride detection:** The record size is auto-detected: if `DNER.size % 32 == 0` use 32-byte records; else if `DNER.size % 28 == 0` use 28-byte records; otherwise fall back to packed DNER parsing.
* **ECAF index buffer:** A flat array of uint16 values. For each bone record, read `numFace` indices starting at `ECAF.data + offsetIndex * 2`. Indices in ECAF are **global** vertex indices (no vertsOffset addition needed).

### 2.5.3 Skeletal Archetypes & The "Missing Skeleton" Problem
A major limitation of the original binary `.mef` file format for skeletal models (`modelType == 1`) is that it **completely lacks skeletal tree hierarchy definitions**. The binary files only contain vertex blending weight tables (mapping which vertex is influenced by which raw bone index). They do not store:
1. **Bone Names** (e.g. `"head"`, `"left hand"`, `"shoulders"`).
2. **Parent-Child Linkages** (which joints are connected to which, which is necessary for forward kinematics and joint rotations).
3. **Rest-Pose Bone Lengths/Offsets** (`px, py, pz`).

To solve this, the game engine originally compiled the default character skeletons directly into the executable binary (`igi.exe`/`loop.dll`). The Level Editor restores these missing hierarchies at runtime by matching model filenames or the maximum bone counts to hardcoded **Skeletal Archetypes** via the `BoneRigType` enum:

```cpp
enum class BoneRigType {
    JonesCinematic = 0,    // Type 0: David Jones and key cinematic actors
    StandardSoldier = 1,   // Type 1: Default soldiers and player model
    HeavySoldier = 6,      // Type 6: Heavy/special soldier models
    AdvancedFingerRig = 48 // Type 48: Character models with advanced hand rig
};
```
* **JonesCinematic (Type 0):** A 32-bone skeletal rig with custom bone proportions tailored for David Jones (`000_01_1`), `009_02_1`, and `008_01_1` models.
* **StandardSoldier (Type 1):** The default 32-bone rig used by the player model (`001_01_1`) and standard combat NPC AI soldiers.
* **HeavySoldier (Type 6):** An adjusted 32-bone rig with wider shoulder and elbow structures designed to prevent heavy armor plates from clipping on special guards (`012_01_1`, `015_01_1`, `028_01_1`).
* **AdvancedFingerRig (Type 48):** Selected automatically when `maxBoneIdx` matches `48`, mapping a highly articulate 48-bone hand and attachment skeleton.

## 2.6 ECAF Chunk -- Face Index Buffer
A flat array of `uint16` triangle indices, used by Type 1 (bone) models with split DNER parsing. Total index count: `ECAF.size / 2`.

## 2.7 Collision Mesh Chunks
When no render geometry is available (no XTRV/DNER), the parser falls back to collision geometry.

### XTVC -- Collision Vertices (16 bytes each)
| Offset | Size | Type    | Field      |
|--------|------|---------|------------|
| 0x00   | 4    | float32 | Position X |
| 0x04   | 4    | float32 | Position Y |
| 0x08   | 4    | float32 | Position Z |
| 0x0C   | 4    | -       | Padding    |
Vertex count: `XTVC.size / 16`. UVs are synthesized as `(x * 0.1, z * 0.1)`.

### ECFC -- Collision Faces (8 bytes each)
| Offset | Size | Type   | Field       |
|--------|------|--------|-------------|
| 0x00   | 2    | uint16 | Index A     |
| 0x02   | 2    | uint16 | Index B     |
| 0x04   | 2    | uint16 | Index C     |
| 0x06   | 2    | -      | Padding     |
Face count: `ECFC.size / 8`.

## 2.8 ATTA Chunk -- Attachment Points (68 bytes each)
ATTA records place named sub-models onto a parent model with a local position and 3x3 rotation matrix. Sub-models can be static visual parts or MagicObjects with runtime behavior (see MagicObject System).

| Offset | Size | Type     | Field     | Description                                        |
|--------|------|----------|-----------|----------------------------------------------------|
| 0x00   | 16   | char[16] | name      | Sub-model name (null-padded, e.g. `"600_02_1"`)    |
| 0x10   | 4    | float32  | px        | Local position X (raw MEF units, NOT scaled)       |
| 0x14   | 4    | float32  | py        | Local position Y                                   |
| 0x18   | 4    | float32  | pz        | Local position Z                                   |
| 0x1C   | 4    | float32  | r00       | Rotation matrix row 0, col 0                       |
| 0x20   | 4    | float32  | r01       | Rotation matrix row 0, col 1                       |
| 0x24   | 4    | float32  | r02       | Rotation matrix row 0, col 2                       |
| 0x28   | 4    | float32  | r03       | Rotation matrix row 1, col 0                       |
| 0x2C   | 4    | float32  | r04       | Rotation matrix row 1, col 1                       |
| 0x30   | 4    | float32  | r05       | Rotation matrix row 1, col 2                       |
| 0x34   | 4    | float32  | r06       | Rotation matrix row 2, col 0                       |
| 0x38   | 4    | float32  | r07       | Rotation matrix row 2, col 1                       |
| 0x3C   | 4    | float32  | r08       | Rotation matrix row 2, col 2                       |
| 0x40   | 4    | int32    | boneId    | Parent bone index (-1 = not bone-attached)         |

**Total: 68 bytes per record.** Count: `ATTA.size / 68`.
Positions are in raw MEF units (divide by 40.96 to get meters). The parent model contains one ATTA record per logical sub-model slot; the same sub-model name can appear multiple times at different offsets.

## 2.9 XTVM Chunk -- Magic Vertices (16 bytes each)
XTVM records mark special-purpose positions within a model used by the game engine for events: gun fire origins, ladder interaction zones, particle emitters, etc. These are *not* rendered — they are invisible game logic hooks.

| Offset | Size | Type    | Field       | Description                                                      |
|--------|------|---------|-------------|------------------------------------------------------------------|
| 0x00   | 4    | float32 | px          | Position X (raw MEF units, NOT scaled)                           |
| 0x04   | 4    | float32 | py          | Position Y                                                       |
| 0x08   | 4    | float32 | pz          | Position Z                                                       |
| 0x0C   | 4    | int32   | magicType   | Magic vertex type ID (unconfirmed; see TASKTYPE constants below) |

**Total: 16 bytes per vertex.** Count: `XTVM.size / 16`.
The `magicType` field meaning is unconfirmed from binary analysis. It likely maps to a `TASKTYPE_*` constant indicating what engine system uses this vertex (gun clip position, ladder zone, etc.). Many entries have `magicType == 0`.

## 2.10 Parsing Algorithm Summary
```
1. Read ILFF header; validate "ILFF" magic and size
2. Parse chunk linked list (follow skip pointers)
3. Read model type from HSEM chunk (offset 0x20)
4. Read D3DR for face/mesh/vertex counts
5. Parse XTRV vertices using model-type-specific stride
6. Parse triangles:
   a. Type 1 with ECAF + valid D3DR -> split bone parse (DNER records + ECAF indices)
   b. Otherwise -> packed DNER parse (inline indices per block)
7. If no render geometry found, fall back to XTVC/ECFC collision mesh
8. Parse ATTA for sub-model attachment points
9. Parse XTVM for magic vertex positions
10. Scale all render positions by 1.0/40.96
```

## 2.11 Text-Based MEF Format (Exported)
The editor also supports a text-based MEF representation (parsed by `mef_parser.cpp`). This is a line-oriented script format:

```
NewObject("building_01");
Material(0, "concrete", 0.8, 0.8, 0.8, 0.1, 0.1, 0.1, 0.9, 0.9, 0.9, 0.0, 0.0, 0.0, 1.0);
MaterialShininess(0, 32.0);
Vertex(0, 100.5, 200.3, 50.0);
Normal(0, 0.0, 0.0, 1.0);
Face(0, 0, 1, 2, 0, 1, 2, 0);
UV(0, 0.0, 1.0);
BreakScript();
```
**Commands:**
| Command             | Arguments                                                   |
|---------------------|-------------------------------------------------------------|
| `NewObject`         | `(name)`                                                    |
| `Material`          | `(index, name, diffR,G,B, ambR,G,B, specR,G,B, emR,G,B, hasCollision)` |
| `MaterialShininess` | `(index, shininess)`                                        |
| `Vertex`            | `(index, x, y, z)`                                         |
| `Normal`            | `(index, nx, ny, nz)`                                      |
| `Face`              | `(faceIdx, v0, v1, v2, n0, n1, n2, materialIdx)`           |
| `UV`                | `(index, u, v, ...)`                                        |
| `BreakScript`       | `()` -- separator, no action                                |
Lines starting with `#` or `//` are comments. Empty lines are skipped.

---

## Mef Magic Objects

MagicObjects are mesh sub-parts with runtime behavior. They are the engine's system for giving interactivity to parts of a 3D model — a door that swings, glass that shatters, a ladder you can climb, helicopter rotors that spin.

The system is split across two data sources that the engine combines at load time:

| Data Source          | Role                                                        |
|----------------------|-------------------------------------------------------------|
| `magicobjconfig.qsc` | Defines the **behavior** (what type of interactive object)  |
| Parent model ATTA    | Defines the **placement** (transform in the parent mesh)    |

## 9.1 MagicObject Config Files

**IGI 1** — `magicobjconfig.qsc` uses `Task_New`:
```qsc
Task_New(-1, "MagicObjConfig",
    "name",       // lookup key — matches ATTA entry name
    "model_id",   // which .mef mesh to use
    TASKTYPE_XXX  // what behavior to apply
);
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

---

## Mef Structure

The Mesh-Exported-File (MEF) format is a highly specialized, proprietary binary file structure engineered specifically to define, manage, and render 3D models within the game engine environment (specifically associated with the Innerloop Studios engine used in titles like Project IGI). Understanding the MEF format requires a deep dive into its hierarchical data structures, memory management protocols, and the specific geometric and physical properties it dictates for every object within the game world.

Here is a highly detailed, comprehensive breakdown of the MEF architecture, its mathematical structures, and its various sub-components:

### 1. The Core Data Structure: InnerLoopFileFormat (ILFF)

The foundation of the MEF format relies on the InnerLoopFileFormat (ILFF), a standardized binary wrapper used across various resource files within the game engine.

* **The Global Header (20 Bytes):** Every MEF file initiates with a strict 20-byte global header. It begins with a 4-byte signature—specifically the ASCII characters `ILFF`—which acts as a magic number for the engine to verify the file type before allocating memory. Following this signature, the header includes a 4-byte integer defining the total data size of the file, a 4-byte alignment size (usually fixed at 4 to ensure proper memory alignment for the CPU), and a 4-byte offset variable (typically set to 0 at the start).
* **Section Headers (16 Bytes):** Following the global header, the file is subdivided into modular data "chunks" or sections. Each of these sections is preceded by its own 16-byte header. This micro-header contains a 4-byte signature (often written in reverse ASCII, such as `HSEM`, `D3DR`, or `HSMC`) that identifies the specific type of data contained within the chunk. It also includes a 4-byte integer defining the exact size of the payload, a 4-byte alignment lock (again, usually 4), and a 4-byte structural offset.

### 2. Critical Data Sections and Signatures

The modularity of the MEF format allows the engine to parse only the data it currently needs. The most vital sections include:

* **HSEM (Header Specific Model Data):** This is the master configuration section for the model. It contains the `FileVersion` (ensuring engine compatibility), the `Date&Time` stamp (crucial for verifying if pre-rendered lightmaps are outdated), the `ModelType` integer (which dictates how the engine processes the model), and the `ModelRadius` (used for occlusion culling and LOD calculations).
* **D3DR (Direct3D Render Mesh):** This section holds the purely visual geometry data. It stores the `FaceCount` (number of polygons/triangles) and `VertCount` (number of vertices). This section is paired with texture, material, and UV coordinate data to draw the object on the screen.
* **HSMC (Collision Mesh):** Visual geometry is often too complex for physics calculations, so the HSMC section provides a simplified, invisible proxy mesh used exclusively for hit detection, blocking player movement, and projectile physics. It contains its own `FaceCount` and `VertCount`, alongside a `SphereCount`—mathematical spheres generated by the GCONV compiling program to create rapid, low-cost collision boundaries.

### 3. Comprehensive Model Typology

The engine classifies every 3D object into one of four primary categories, dictated by the `ModelType` parameter in the HSEM section:

* **Rigid Models (Type 0):** Generated using the command `CreateCompleteModelRigid(0)`. These are dynamic, moving entities like vehicles, weapons, and dropped items. Because they move through the environment, they cannot rely on pre-baked shadows. Instead, they use simple, real-time lightmapping determined strictly by the orientation of their geometric faces relative to a global light source (like the sun). They do not cast complex dynamic shadows.
* **Lightmap Models (Type 3):** Generated using `CreateCompleteModelLightmap(3)`. These constitute approximately 90% of the game world—buildings, terrain, walls, and static props. Because they never move, the GCONV program pre-computes (bakes) complex lighting data directly into their textures. This process accounts for global illumination, local point lights (like lamps), and shadows cast by surrounding obstacles. The resolution of these baked lightmaps can be manually overridden using the `SetLightmapResolution` command.
* **Bone Models (Type 1):** Generated using `CreateCompleteModelBone(1)`. These are highly complex character and entity models driven by a skeletal animation system. The mesh is bound to a hierarchical tree of "bones" (typically 47 bones for high-detail first-person arm models, and 31 bones for standard third-person NPC models). The vertices of the mesh are assigned "weights," determining how much a specific vertex should stretch or move when an underlying bone rotates, allowing for organic movements like running, reloading, or dying.
* **Shadow Models:** Rendering real-time shadows from high-polygon models is computationally expensive. To solve this, the engine uses Shadow Models—extremely low-polygon, invisible duplicates of standard models. The GCONV program calculates the face normal vectors of these low-poly meshes specifically to project sharp, dynamic shadows onto the environment without bogging down the CPU/GPU.

### 4. Ancillary Features and the MTP Architecture

Beyond standard rendering and collision, the MEF format supports advanced features to bring the game world to life:

* **Portals and Magic Vertices:** Used for advanced optimization and engine logic. Portals divide the game world into rendering "rooms," ensuring the engine only draws what the player can currently see. Magic Vertices are hidden points on a model used to spawn particle effects (like muzzle flashes) or attach other models.
* **LOD (Level of Detail) Models:** To maintain high frame rates, the MEF format supports LOD scaling. As the player moves further away from an object, the engine seamlessly swaps the high-polygon MEF with lower-polygon variants, reducing rendering strain.
* **The GCONV Program and MTP Integration:** The MEF files are not compiled by hand; they are generated by a proprietary command-line utility known as GCONV. GCONV processes raw 3D data, computes the collision spheres, calculates shadow normals, unwraps lightmap UVs, and outputs the final MEF. Furthermore, GCONV simultaneously generates **MTP Files**. If MEF files are the building blocks, MTP files are the blueprints. Starting with a `FORM` signature, MTP data structures instruct the game engine on exactly how and when to load these compiled MEF models, along with their associated animation data and texture files, into the system's active memory pool.

---

## Models Information

In Project IGI, model IDs follow a structured format, consisting of three parts: Main Model ID, Attachment Part ID, and Level of Detail (LOD) Details.

| Part       | Description                       | Range                | Example                |
|------------|-----------------------------------|----------------------|------------------------|
| 1st Part   | Main Model ID                     | 000 to 999           | 435                    |
| 2nd Part   | Attachment Part ID                | 01 to 99             | 01                     |
| 3rd Part   | Model Details LOD Details         | 1 to 9               | 1                      |

For example:
- `435_01_1` represents "Water Tower."
- `435_02_1` represents "Water Tower stairs" due to the Attachment Part ID of 02.
- `435_01_5` corresponds to the 5th LOD view mode, suitable for viewing from a distance (refer to the `LOD.qvm` file for more information).

## Model Meshes Information

IGI 2 MEF models are categorized into four types of meshes:

1. **Portal Mesh** (TROP XTVP CFTP)
2. **Render Mesh** (DNER XTRV ECAF)
3. **Collision Type 0 Mesh** (HSMC XTVC ECFC TAMC HPSC)
4. **Collision Type 1 Mesh** (HSMC XTVC ECFC TAMC HPSC)

## Magic Models in IGI

Magic Models in IGI are those that exhibit animations and require the definition of magic vertices. These include:

- All Weapon Models
- All Car Models
- All Door Models
- All Glass Models
- All Ladder Models

For example, Weapon models have animations for firing and reloading, while Door models have animations for opening and closing.

## Model Management

To facilitate model management, models in MEF format will be shared using `gconv`. You can easily add or remove models from the MTP (Model Texture Pack) by creating MTP files. It's worth noting that the MTP file version remains the same for both IGI games.

## Types of Models in Project IGI

There are four types of MEF models in Project IGI 2:

1. **Rigid Model**: Dynamic models.
2. **Lightmap Model**: Static models.
3. **Bone Model**: Character models.
4. **Shadow Model**: Low-resolution shadow representations of models.

---

