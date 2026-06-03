# QVM -- Script Bytecode

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

## 4.9 Statistics (IGI 2)
- Total files: 1,786 (all version 8.7, signature LOOP)
- Size range: 105–393,614 bytes (Median: 292 bytes)
- Contiguous layout: 100% of files
- objects.qvm are the largest files containing all object definitions for a level.
- Opcode Frequency: BRK is the most common (530,932), followed by PUSHSIW (124,805) and PUSHIIB (91,742). 23 of 49 opcodes are used.
