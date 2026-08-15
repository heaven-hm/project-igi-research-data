# MTP - Complete Reference

Consolidated documentation for MTP file format.

---

## Mtp-Structure-Explanation

The MTP Material Structure is a file that defines the materials and textures used in a game. The file starts with a signature that identifies it as an MTP file. The next line specifies the number of models in the file.

Each model in the file is defined by a line that contains the model name and the number of materials that the model uses. The following lines list the materials that the model uses, each with the name of the associated texture file.

For example, the following line defines a model named "210_01_1" that uses two materials:

```
210_01_1   2
```

The following lines list the materials for the model "210_01_1":

```
207_01_1   207_01_1.tex
316_04_1   316_04_1.tex
```

The MTP Material Structure can be used to quickly and easily identify the materials and textures used in a game. This information can be useful for a variety of purposes, such as modding the game or creating custom content.

Here is a bullet list of the general structure of the MTP Material Structure:

* The file starts with a signature that identifies it as an MTP file.
* The next line specifies the number of models in the file.
* Each model is defined by a line that contains the model name and the number of materials that the model uses.
* The following lines list the materials that the model uses, each with the name of the associated texture file.

---

## Mtp Format

**Extension:** `.mtp`
**Container:** FORM/IFF (EA IFF-85 variant with big-endian sizes)

MTP files define which textures belong to which models for a given level or asset group.

## 6.1 File Header (12 bytes)

| Offset | Size | Type         | Description                         |
|--------|------|--------------|-------------------------------------|
| 0x00   | 4    | char[4]      | Magic: `"FORM"`                     |
| 0x04   | 4    | uint32 (BE)  | FORM payload size (big-endian)      |
| 0x08   | 4    | char[4]      | Format ID: `"MTP "` (with trailing space) |

## 6.2 IFF Chunk Header (8 bytes)

| Offset | Size | Type         | Description                    |
|--------|------|--------------|--------------------------------|
| 0x00   | 4    | char[4]      | FourCC chunk type              |
| 0x04   | 4    | uint32 (BE)  | Data size (big-endian)         |

Chunks are aligned to 2-byte boundaries (standard IFF). If data size is odd, one padding byte follows.

## 6.3 Chunk Types

| FourCC | Description                            | Data Format              |
|--------|----------------------------------------|--------------------------|
| `BANM` | Bone animation names                   | String array             |
| `SNDS` | Sound names                            | String array             |
| `SVOL` | Shadow volume names                    | String array             |
| `MODS` | Model filenames                        | String array             |
| `VNAM` | Vertex names                           | String array             |
| `TEXF` | Texture filenames                      | String array             |
| `PALF` | Palette filenames                      | String array             |
| `GTT`  | (Unknown purpose)                      | -                        |
| `INST` | Model-texture instance mappings        | Instance array (see below) |

## 6.4 String Array Format

All string-list chunks (BANM, SVOL, MODS, TEXF, etc.) use this layout:

| Offset | Size | Type   | Description                                    |
|--------|------|--------|------------------------------------------------|
| 0x00   | 4    | uint32 (LE) | count -- number of strings                |
| 0x04   | var  | char[] | `count` null-terminated strings packed sequentially |

Note: The count field is little-endian despite the IFF chunk sizes being big-endian.

## 6.5 INST Chunk -- Instance Mappings

The INST chunk maps each model to its texture list:

| Offset | Size | Type        | Description                           |
|--------|------|-------------|---------------------------------------|
| 0x00   | 4    | uint32 (LE) | count -- number of mapping entries    |

Each entry (variable length):

| Offset | Size       | Type        | Description                           |
|--------|------------|-------------|---------------------------------------|
| 0x00   | 2          | uint16 (LE) | modelIdx -- index into MODS array    |
| 0x02   | 2          | uint16 (LE) | texCount -- number of textures       |
| 0x04   | texCount*2 | uint16 (LE)[] | Array of texture indices into TEXF |

## 6.6 Example Parsing Flow

```
1. Validate "FORM" magic and read BE size
2. Validate "MTP " format ID at offset 8
3. Iterate chunks from offset 12:
   - Parse MODS -> list of model names
   - Parse TEXF -> list of texture names
   - Parse INST -> resolve model/texture indices to names
4. Each INST entry: model_name = MODS[modelIdx], textures = TEXF[texIdx] for each texIdx
```

---

## Mtp Import

## Material Importer manual method

**Steps to Import new Model from another level:**

1. Decompile Target Level and Source Level `models.res` from `level\models\level#.res`.
2. Copy your desired Model MEF object like `435_011.mef`. Copy all mefs with "435" same model name.
3. Paste them in your source level models and Pack them again to `models.res`.
4. Copy object Texture data from `level\models\level#.mtp`.
5. Download and Get MTP Decoder tool under [`\Tools`](https://github.com/IGI-Research/IGIEditor/tree/master/Tools).
6. Add your new textures in `level#.mtp` file and Increase total Objects Count and decode it.
7. Now add your New model with full qualified name like `435_01_1` into your level.

**Detailed explanation:**

1. Decompile the `models.res` files of the target level and the source level.
2. Copy the desired model MEF object and all other MEF objects with the same model name.
3. Paste the copied objects into the source level models and pack them again to `models.res`.
4. Copy the object texture data from the `mtp` file of the target level.
5. Download and use the MTP Decoder tool found in the `\Tools` section.
6. Add your new textures to the `mtp` file of the source level, increase the total object count, and decode the file.
7. Add your new model with the full qualified name like `435_01_1` to your level.

---

## Materials

| MaterialName | MaterialId |
|---|---|
| Air           | 0         |
| Ground        | 1         |
| Water         | 2         |
| Wood          | 3         |
| Carton        | 4         |
| StrongMetal   | 5         |
| NormalMetal   | 6         |
| SoftMetal     | 7         |
| Flesh         | 8         |
| BloodyFlesh  | 9         |
| Textiles      | 10        |
| Concrete      | 11        |
| Runway        | 12        |
| Rug           | 13        |
| Glass         | 14        |
| Plastic       | 15        |
| Porcelain     | 16        |
| Rubber        | 17        |
| Fence         | 18        |
| Gravel        | 19        |
| Snow          | 20        |
| HumanCollision | 21        |
| MetalLadder   | 22        |
| MetalFence    | 23        |

---

