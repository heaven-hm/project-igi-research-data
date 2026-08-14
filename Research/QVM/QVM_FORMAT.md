# QVM Format - Consolidated Reference

Auto-generated consolidation of 5 research files.

---

## QVM-v5-Instructions.md

| Opcode | OpName   |
|--------|----------|
|   00   |    BRK   |
|   01   |    NOP   |
|   02   |    PUSH  |
|   03   |   PUSHB  |
|   04   |   PUSHW  |
|   05   |   PUSHF  |
|   06   |   PUSHA  |
|   07   |   PUSHS  |
|   08   |  PUSHSI  |
|   09   | PUSHSIB  |
|   0A   | PUSHSIW  |
|   0B   |   PUSHI  |
|   0C   |  PUSHII  |
|   0D   | PUSHSIB  |
|   0E   | PUSHSIW  |
|   0F   |   PUSH0  |
|   10   |   PUSH1  |
|   11   |   PUSHM  |
|   12   |     POP  |
|   13   |     RET  |
|   14   |     BRA  |
|   15   |      BF  |
|   16   |      BT  |
|   17   |     JSR  |
|   18   |    CALL  |
|   19   |     ADD  |
|   1A   |     SUB  |
|   1B   |     MUL  |
|   1C   |     DIV  |
|   1D   |     SHL  |
|   1E   |     SHR  |
|   1F   |     AND  |
|   20   |      OR  |
|   21   |     XOR  |
|   22   |    LAND  |
|   23   |     LOR  |
|   24   |      EQ  |
|   25   |      NE  |
|   26   |      LT  |
|   27   |      LE  |
|   28   |      GT  |
|   29   |      GE  |
|   2A   |  ASSIGN  |
|   2B   |    PLUS  |
|   2C   |   MINUS  |
|   2D   |     INV  |
|   2E   |     NOT  |
|   2F   |     BLK  |
|   30   | ILLEGAL  |

---

## QVM-v7-Instructions.md

| Opcode | OpName   |
|--------|----------|
|   01   |    NOP   |
|   00   |    BRK   |
|   02   |    RET   |
|   03   |    BRA   |
|   04   |     BF   |
|   05   |     BT   |
|   06   |    JSR   |
|   07   |   CALL   |
|   08   |    PUSH  |
|   09   |   PUSHB  |
|   0A   |   PUSHW  |
|   0B   |   PUSHF  |
|   0C   |   PUSHA  |
|   0D   |   PUSHS  |
|   0E   |  PUSHSI  |
|   0F   | PUSHSIB  |
|   10   | PUSHSIW  |
|   11   |   PUSHI  |
|   12   |  PUSHII  |
|   13   | PUSHSIB  |
|   14   | PUSHSIW  |
|   15   |   PUSH0  |
|   16   |   PUSH1  |
|   17   |   PUSHM  |
|   18   |     POP  |
|   19   |     ADD  |
|   1A   |     SUB  |
|   1B   |     MUL  |
|   1C   |     DIV  |
|   1D   |     SHL  |
|   1E   |     SHR  |
|   1F   |     AND  |
|   20   |      OR  |
|   21   |     XOR  |
|   22   |    LAND  |
|   23   |     LOR  |
|   24   |      EQ  |
|   25   |      NE  |
|   26   |      LT  |
|   27   |      LE  |
|   28   |      GT  |
|   29   |      GE  |
|   2A   |  ASSIGN  |
|   2B   |    PLUS  |
|   2C   |   MINUS  |
|   2D   |     INV  |
|   2E   |     NOT  |
|   2F   |     BLK  |
|   30   | ILLEGAL  |

---

## QVM_DOC.md

## What is QVM?

QVM stands for "Q Virtual Machine". It is a compiled binary file used in Project IGI to run game logic like AI, objects, and player scripts. The virtual machine interprets bytecode from these files during gameplay.</br>
The **QVM** are not **readable** to make them **readable** we need to **decompile** them to **QSC** file.

## File Signature & Variability

Most QVM files start with the ASCII signature `LOOP`. They vary in internal layout: object files use task trees (`objects.qvm`), while AI scripts are logic-based (`ai.qvm`). File sizes range from 270 bytes to 990 KB.</br>


## What Are QSC and QAS file formats?

- **QSC**: Human-readable source script written in _C-style_ syntax.
- **QAS**: Intermediate assembly generated from _QSC_ during build.
- **QVM**: Final compiled binary executed by the game engine.

These files follow this path:
```
QSC → QAS → QVM
```

## Compilation and Decompilation Flow

During development:
```
QSC (source) → QAS (assembler) → QVM (compiled)
```

When reverse engineering:
```
QVM → QSC (decompiled)
```

QAS is only generated if a flag is set during compilation.

## File Header Structure

| Offset | Type | Name        | Description              |
|--------|------|-------------|--------------------------|
| 0x00   | U4   | signature   | Must be `'LOOP'`         |
| 0x04   | U4   | ver_major   | Major version number     |
| 0x08   | U4   | ver_minor   | Minor version number     |

This header defines where tables for integers, strings, and bytecode instructions are located inside the file.

## Opcodes Information

| Hex | Name  | Description                            |
|-----|-------|----------------------------------------|
| 00  | BRK   | Stops execution                        |
| 01  | NOP   | No action                              |
| 02  | PUSH  | Pushes 32-bit value to stack           |

These are basic commands interpreted by the virtual machine to control flow and data handling.

## Task-Based Structure - objects.qvm

`objects.qvm` uses recursive task trees built using:
- `Task_DeclareParameters`: Defines expected types
- `Task_New`: Creates node with ID, type, context, and values

Example:
```c
Task_New(-1, "EditRigidObj", "", 24977198.0, -55751300.0, 174413136.0, 0, 0, 0.6645680069923401, "905_01_1", 1, 1, 1, 0, 0, 0)
```

Each child task can be referenced via ID later in scripts.

## Script-Based Logic - ai.qvm

AI logic lives in `ai.qvm`. These are QSC scripts that use C-like syntax with conditionals, functions, and logical operators.

Example:
```c
if(AIFunction_GetCurrentEventType() == AIEVENT_IDLE) 
{ 
    AIAction_Patrol(1203, 0, AIACTIONFLAG_NONE); 
}
```

They define behavior routines and event handlers used by in-game characters.

# Project IGI QVM Versions & Tools

## Overview

Project IGI is split into two major versions — **IGI 1** and **IGI 2**, each using its own QVM format. These formats are not compatible with each other, making direct file sharing or reuse between the two games impossible.

---

## 🎮 Project IGI 1 – QVM 0.5

IGI 1 uses the `QVM 0.5` format, which contains structured bytecode for various game elements like AI, human characters, and objects. Each type of QVM file may have a different internal layout depending on its use case.

### Compiler</br>

For compiling IGI 1 files, there has been recent progress a **DLL based compiler** [IGI-Compiler](https://github.com/Jones-HM/project-igi-editor/blob/develop/IGIEditor/QCompiler.cs#L119) with [Native-method](https://github.com/search?q=repo%3AJones-HM%2Fproject-igi-internals%20QSCRIPT_COMPILE&type=code) thanks to a discovery by **Jones-HM**. He found a way to compile files directly inside the game by using **DLL injection** to call the game’s internal compilation functions. This method is fast, doesn't require external tools, and is now used in the **Project IGI Editor**.

### Decompiler</br>

There is no official SDK, compiler, or decompiler available for this version. However, an unofficial tool called [DConv](https://github.com/NEWME0/Project-IGI/tree/master/tools/dconv), created by modder **Artiom**, can successfully decompile IGI 1 QVM files into readable QSC (source code). It also supports conversion between QVM 0.5 and QVM 0.7, helping bridge the gap between the two IGI versions.

---

## 🎮 Project IGI 2 – QVM 0.7

IGI 2 uses the newer `QVM 0.7` format, which has a completely different structure from IGI 1. The two formats are incompatible, meaning you cannot use QVM files from one version in the other.

In IGI 2 it comes with an **[Official SDK](https://www.nexusmods.com/igi2covertstrike/mods/1)** that includes a powerful tool called [GConv](https://www.gamepressure.com/download/igi-2-covert-strike-map-editor-mod/zbbfc). This tool allows full decompilation and compilation of QVM files to QSC and back again. It is widely used for mod development and scripting support.

Despite having official tools, GConv is not always user-friendly or well-documented, so community tools and documentation continue to play a big role in expanding modding support.

---

## QVM_FORMAT.md

**Extension:** `.qvm`
**Container:** None (raw structured binary)
**Signature:** `"LOOP"` (same magic as TEX)

QVM is a compiled bytecode format for IGI's scripting virtual machine (version "0.5", stored as major=8, minor=5 in the header).

## 4.1 Header (60 bytes)

| Offset | Size | Type     | Field         | Description                            |
|--------|------|----------|---------------|----------------------------------------|
| 0x00   | 4    | char[4]  | signature     | `"LOOP"` (0x4C4F4F50)                 |
| 0x04   | 4    | uint32   | ver_major     | Must be 8                              |
| 0x08   | 4    | uint32   | ver_minor     | Must be 5                              |
| 0x0C   | 4    | uint32   | of_itable     | Offset to identifier table             |
| 0x10   | 4    | uint32   | of_ivalue     | Offset to identifier strings           |
| 0x14   | 4    | uint32   | sz_itable     | Size of identifier table               |
| 0x18   | 4    | uint32   | sz_ivalue     | Size of identifier string pool         |
| 0x1C   | 4    | uint32   | of_stable     | Offset to string table                 |
| 0x20   | 4    | uint32   | of_svalue     | Offset to string value pool            |
| 0x24   | 4    | uint32   | sz_stable     | Size of string table                   |
| 0x28   | 4    | uint32   | sz_svalue     | Size of string value pool              |
| 0x2C   | 4    | uint32   | of_ctable     | Offset to code (bytecode) section      |
| 0x30   | 4    | uint32   | sz_ctable     | Size of code section                   |
| 0x34   | 4    | uint32   | unknown_1     | Unknown                                |
| 0x38   | 4    | uint32   | unknown_2     | Unknown                                |

## 4.2 String Pools

The identifier pool (`of_ivalue`, `sz_ivalue`) and string pool (`of_svalue`, `sz_svalue`) are both arrays of null-terminated strings packed sequentially. The parser splits on `\0` bytes to recover individual strings.

## 4.3 Opcodes (49 total)

All opcodes are encoded as a single byte. The operand (if any) follows immediately in little-endian format.

| Value | Name     | Operand Size | Description                           |
|-------|----------|--------------|---------------------------------------|
| 0x00  | BRK      | 0            | Break / debug trap                    |
| 0x01  | NOP      | 0            | No operation                          |
| 0x02  | PUSH     | 4 (uint32)   | Push 32-bit integer                   |
| 0x03  | PUSHB    | 1 (uint8)    | Push byte as integer                  |
| 0x04  | PUSHW    | 2 (uint16)   | Push 16-bit word as integer           |
| 0x05  | PUSHF    | 4 (float32)  | Push 32-bit float                     |
| 0x06  | PUSHA    | 0            | Push address                          |
| 0x07  | PUSHS    | 0            | Push string ref                       |
| 0x08  | PUSHSI   | 4 (uint32)   | Push string identifier (32-bit index) |
| 0x09  | PUSHSIB  | 1 (uint8)    | Push string identifier (8-bit index)  |
| 0x0A  | PUSHSIW  | 2 (uint16)   | Push string identifier (16-bit index) |
| 0x0B  | PUSHI    | 0            | Push immediate                        |
| 0x0C  | PUSHII   | 4 (uint32)   | Push indirect integer (32-bit)        |
| 0x0D  | PUSHIIB  | 1 (uint8)    | Push indirect integer (8-bit)         |
| 0x0E  | PUSHIIW  | 2 (uint16)   | Push indirect integer (16-bit)        |
| 0x0F  | PUSH0    | 0            | Push constant 0                       |
| 0x10  | PUSH1    | 0            | Push constant 1                       |
| 0x11  | PUSHM    | 0            | Push memory ref                       |
| 0x12  | POP      | 0            | Pop top of stack                      |
| 0x13  | RET      | 0            | Return from subroutine                |
| 0x14  | BRA      | 4 (int32)    | Branch always (relative offset)       |
| 0x15  | BF       | 4 (int32)    | Branch if false                       |
| 0x16  | BT       | 4 (int32)    | Branch if true                        |
| 0x17  | JSR      | 0            | Jump to subroutine                    |
| 0x18  | CALL     | special      | Native function call (see below)      |
| 0x19  | ADD      | 0            | Integer addition                      |
| 0x1A  | SUB      | 0            | Integer subtraction                   |
| 0x1B  | MUL      | 0            | Integer multiplication                |
| 0x1C  | DIV      | 0            | Integer division                      |
| 0x1D  | SHL      | 0            | Shift left                            |
| 0x1E  | SHR      | 0            | Shift right                           |
| 0x1F  | AND      | 0            | Bitwise AND                           |
| 0x20  | OR       | 0            | Bitwise OR                            |
| 0x21  | XOR      | 0            | Bitwise XOR                           |
| 0x22  | LAND     | 0            | Logical AND                           |
| 0x23  | LOR      | 0            | Logical OR                            |
| 0x24  | EQ       | 0            | Equal comparison                      |
| 0x25  | NE       | 0            | Not equal comparison                  |
| 0x26  | LT       | 0            | Less than                             |
| 0x27  | LE       | 0            | Less than or equal                    |
| 0x28  | GT       | 0            | Greater than                          |
| 0x29  | GE       | 0            | Greater than or equal                 |
| 0x2A  | ASSIGN   | 0            | Assignment                            |
| 0x2B  | PLUS     | 0            | Unary plus                            |
| 0x2C  | MINUS    | 0            | Unary minus (negate)                  |
| 0x2D  | INV      | 0            | Bitwise invert                        |
| 0x2E  | NOT      | 0            | Logical NOT                           |
| 0x2F  | BLK      | 0            | Block marker                          |
| 0x30  | ILLEGAL  | 0            | Illegal / invalid opcode              |

## 4.4 CALL Instruction Encoding

The CALL opcode has variable-length encoding:

```
[0x18] [uint32 count] [int32 target_0] [int32 target_1] ... [int32 target_(count-1)]
```

| Offset | Size        | Type     | Description                   |
|--------|-------------|----------|-------------------------------|
| 0      | 1           | uint8    | Opcode (0x18)                 |
| 1      | 4           | uint32   | count -- number of call targets |
| 5      | count * 4   | int32[]  | Array of call target offsets  |

**Total instruction size:** `1 + 4 + (count * 4)` bytes.

## 4.5 Instruction Encoding Summary

```
[opcode: 1 byte] [operand: 0, 1, 2, or 4 bytes depending on opcode]
```
Most instructions are 1 byte (opcode only). Branch instructions (BRA, BF, BT) use 4-byte signed offsets. Push variants use 1, 2, or 4-byte operands as indicated in the table above.

## 4.6 Execution Model

The VM uses a **stack-based architecture**:
1. Push operands onto the stack (literals, variables, strings)
2. Execute operators that pop operands and push results
3. CALL pops a function name variable from the stack, evaluates arguments from subprograms, and pushes the call result
4. BF pops a condition and branches (used for if/else and while loops)
5. BRK terminates a block; BRA jumps unconditionally (used after CALL to skip argument code, and for else/loop branches)

### Control Flow Reconstruction
The decompiler reconstructs the structured control flow from branch offsets:
- **BF with forward BRA at end of then-block (offset > 0)** -> if/else
- **BF with BRA offset = 0 at end of then-block** -> if (no else)
- **BF with backward BRA at end of then-block (offset < 0)** -> while loop

## 4.7 Decompiled Output (QSC)

The converter decompiles QVM bytecode into QSC — a C-like scripting language. Example:
`c
if(AIFunction_GetCurrentEventType() == AIEVENT_CREATE)
{
        AIFunction_DefaultHandler();
}
`
QSC files use tab indentation and semicolon-terminated statements. Function calls use the Task_New(id, "Type", "Name", ...) pattern for object definitions, and engine API calls like AIFunction_*, AIAction_* for AI scripting.

## 4.8 File Organization

QVM files appear throughout the game directory structure:
- config.qvm -> Game configuration
- common/ai/default.qvm -> Default AI behavior
- missions/location1/level1/objects.qvm -> Level object placement (largest files)
- missions/location1/level1/mission.qvm -> Mission logic
- missions/location1/level1/ai/500.qvm -> Individual AI scripts

---

## humanplayer.md

The `DefineHumanPlayerGeneral` function in Project IGI 1's Humanplayer QVM configures core player mechanics. While structurally similar to IGI 2, IGI 1 uses unique parameter sequences with critical gameplay implications. Due to the absence of official documentation, these values were reverse-engineered by the modding community through extensive testing. Below is a complete parameter breakdown with verified defaults and contextual explanations.

## Parameter Documentation
```c
// Project IGI 1 - Humanplayer QVM Parameter Reference
// Verified defaults (community-researched via reverse engineering)
// Note: Parameters beyond healthFence follow undocumented patterns (0.5/0.75/1 sequences)
DefineHumanPlayerGeneral(
    1.75,       // movementSpeed: Base movement speed multiplier (default: 1.75)
                // Controls overall walking/running pace. Higher = faster movement
    
    17.5,       // forwardSpeed: Forward jump directional speed (default: 17.5)
                // Determines forward momentum when jumping toward targets
    
    27.0,       // upwardSpeed: Vertical climbing/jumping speed (default: 27.0)
                // Controls jumping and heights.
    
    0.5,        // AirSpeed: Air movement multiplier (default: 0.5)
                // Speed of player movements while in air.
    
    0.85,       // peekLRLen: Horizontal peek distance (left/right) (default: 0.85)
                // Distance player can lean sideways while peeking around cover
    
    0.85,       // peekCrouchLen: Crouched peek distance (default: 0.85)
                // Vertical peek range when crouching
    
    0.25,       // peekTime: Peek animation duration (seconds) (default: 0.25)
                // Time to complete peek and reset it back to normal position.
    
    3.0,        // healthScale: Health scale of player (default: 3.0)
                // Health scale from 0.0 - 3.0
    
    0.5,        // healthFence: Critical health threshold (default: 0.5)
                // Health damage multiplier by fence.
    
    // Undocumented parameters (pattern analysis by modding community):
    0.5, 0.75, 1,  
    0.5, 0.75, 1,  
    0.5, 0.75, 1,   
    0.5, 0.75, 1,   
    1, 1, 1, 1, 1, 
    0.5, 0.75, 1, 
    0.5, 0.75, 1,  
    0.5, 0.75, 1,   
    0.5, 0.75, 1,  
    1, 1, 1, 1,   
    100000,        
    100000    
);

---

