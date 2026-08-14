# MTP Format - Consolidated Reference

Auto-generated consolidation of 8 research files.

---

## MTP-Structure-Explanation.md

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

## MTP-Structure.txt

/*Project I.G.I 1 MTP Material Structure.
*Research of Yoejin Light.
* If you want to use this data respect fellow researchers and give proper credits to people. (давать людям должные кредиты)
* Yoejin Light - https://vk.com/id436486682
*/
The definition of materials is in the MEF file (each material has a texture)
------------------------------------------------------------------
* This file is machine generated
* DO NOT EDIT!

415     (total 415 models in use)
210_01_1    model 1 name 
2                   model 1 contain 2 materials 
207_01_1   materials 1 (with texture file 207_01_1.tex)
316_04_1   materials 2 (with texture file 316_04_1.tex)
210_01_2   model 2 name 
2                  model 2 contain 2 materials   
207_01_1  .................
316_04_1
210_01_3
1
316_04_1
000_01_1  model 4 name
10               model 4 contain 10 materials
000_03_1
000_02_1
000_06_1
000_01_1
000_09_1
000_08_1
015_13_1
000_05_1
000_04_1
000_07_1
000_01_2
.......(ellipsis)........
waypoint    model 415 name
0                  model 415 contain 0 materials
393             (total 393 textures in use)
207_01_1   textures 1
316_04_1   textures 2
000_03_1   ......
000_02_1
000_06_1
000_01_1

---

## MTP_FORMAT.md

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

## MTP_Import.md

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

## Material_Import_Info.txt

//Material Importer manual method.

Steps to Import new Model from another level.

1)First decompile Target Level and Source Level models.res from level\models\level#.res
2)Then Copy your desired Model MEF object like 435_011.mef copy all mefs with "435" same model name.
3)Then paste them in your source level models and Pack them again to models.res
4)Then copy object Texture data from level\models\level#.mtp
5)Download and Get MTP Decoder tool under \Tools section.
6)Add your new textures in level#.mtp file and Increase total Objects Count and decode it.
7)Now add your New model with full qualified name like 435_01_1 into your level"

+---------------------------------------------------+
| Decompile target level and source level models.res|
+-----------------------+---------------------------+
                        |
+-----------------------v---------------------------+
|   Copy desired model MEF object and all mefs with   |
|           the same model name.                      |
+-----------------------+---------------------------+
                        |
+-----------------------v---------------------------+
|     Paste the copied objects into your source      |
|             level models and pack them again        |
|                      to models.res.                 |
+-----------------------+---------------------------+
                        |
+-----------------------v---------------------------+
|      Copy object texture data from level#.mtp      |
+-----------------------+---------------------------+
                        |
+-----------------------v---------------------------+
| Download and use MTP Decoder tool found under      |
|                  \Tools section.                   |
+-----------------------+---------------------------+
                        |
+-----------------------v---------------------------+
|  Add your new textures in level#.mtp file, increase|
| the total Objects Count and decode it.             |
+-----------------------+---------------------------+
                        |
+-----------------------v---------------------------+
|     Add your new model with a full qualified name   |
|            like 435_01_1 into your level.           |
+-----------------------------------------------------+

---

## Materials.json

{
  "materials": [
    {
      "MaterialName": "Air",
      "MaterialId": 0
    },
    {
      "MaterialName": "Ground",
      "MaterialId": 1
    },
    {
      "MaterialName": "Water",
      "MaterialId": 2
    },
    {
      "MaterialName": "Wood",
      "MaterialId": 3
    },
    {
      "MaterialName": "Carton",
      "MaterialId": 4
    },
    {
      "MaterialName": "StrongMetal",
      "MaterialId": 5
    },
    {
      "MaterialName": "NormalMetal",
      "MaterialId": 6
    },
    {
      "MaterialName": "SoftMetal",
      "MaterialId": 7
    },
    {
      "MaterialName": "Flesh",
      "MaterialId": 8
    },
    {
      "MaterialName": "BloodyFlesh",
      "MaterialId": 9
    },
    {
      "MaterialName": "Textiles",
      "MaterialId": 10
    },
    {
      "MaterialName": "Concrete",
      "MaterialId": 11
    },
    {
      "MaterialName": "Runway",
      "MaterialId": 12
    },
    {
      "MaterialName": "Rug",
      "MaterialId": 13
    },
    {
      "MaterialName": "Glass",
      "MaterialId": 14
    },
    {
      "MaterialName": "Plastic",
      "MaterialId": 15
    },
    {
      "MaterialName": "Porcelain",
      "MaterialId": 16
    },
    {
      "MaterialName": "Rubber",
      "MaterialId": 17
    },
    {
      "MaterialName": "Fence",
      "MaterialId": 18
    },
    {
      "MaterialName": "Gravel",
      "MaterialId": 19
    },
    {
      "MaterialName": "Snow",
      "MaterialId": 20
    },
    {
      "MaterialName": "HumanCollision",
      "MaterialId": 21
    },
    {
      "MaterialName": "MetalLadder",
      "MaterialId": 22
    },
    {
      "MaterialName": "MetalFence",
      "MaterialId": 23
    }
  ]
}

---

## Materials.md

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

## Materials_info.txt

MATERIAL_AIR = 0
MATERIAL_GROUND = 1
MATERIAL_WATER = 2
MATERIAL_WOOD = 3
MATERIAL_CARTON = 4
MATERIAL_STRONGMETAL = 5
MATERIAL_NORMALMETAL = 6
MATERIAL_SOFTMETAL, = 7
MATERIAL_FLESH = 8
MATERIAL_BLOODYFLESH = 9
MATERIAL_TEXTILES = 10
MATERIAL_CONCRETE = 11
MATERIAL_RUNWAY = 12
MATERIAL_RUG = 13
MATERIAL_GLASS = 14
MATERIAL_PLASTIC, = 15
MATERIAL_PORCELAIN = 16
MATERIAL_RUBBER = 17
MATERIAL_FENCE = 18
MATERIAL_GRAVEL = 19
MATERIAL_SNOW = 20
MATERIAL_HUMANCOLLISION = 21
MATERIAL_METALLADDER = 22
MATERIAL_METALFENCE = 23

---

