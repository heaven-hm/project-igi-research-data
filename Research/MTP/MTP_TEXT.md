# MTP - Text Data

## Mtp-Structure

```
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
```

## Material Import Info

```
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

```

## Materials Info

```
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
```

