; IGI 1 Native Function Disassembly
; Consolidated from 80 files

; === AmmoTypeOpen_0047CAB0.asm ===
; This is an assembly file for AmmoTypeOpen located at address 0047CAB0
; Assembly for AmmoTypeOpen
; Address: 0047CAB0
push    0FFFFFFFFh  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    offset sub_47CAD0  ; Push register value onto the stack
push    offset aDefineammotype  ; Push register value onto the stack
call    GameDefineOptions  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
jmp     loc_47CCF0  ; Unconditional jump to a label or address


; === AnimTriggerLoad_004EC0C0.asm ===
; This is an assembly file for AnimTriggerLoad located at address 004EC0C0
; Assembly for AnimTriggerLoad
; Address: 004EC0C0
mov     eax, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    offset sub_4EBDF0  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B1420  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === AnimTriggerRead_004EC070.asm ===
; This is an assembly file for AnimTriggerRead located at address 004EC070
; Assembly for AnimTriggerRead
; Address: 004EC070
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, [esp+8+Str]  ; Move data between registers or between register and memory
push    offset SubStr  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    _strstr  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4EC0A6  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4EC0A9  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aAnimtriggerPar  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4EC0B7  ; Unconditional jump to a label or address


; === CompilerCleanup_004B83D0.asm ===
; This is an assembly file for CompilerCleanup located at address 004B83D0
; Assembly for CompilerCleanup
; Address: 004B83D0
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
mov     eax, [esi+8Ch]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B83F3  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4BD380  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    ResourceUnload  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === ConfigCompile_004F0CF0.asm ===
; This is an assembly file for ConfigCompile located at address 004F0CF0
; Assembly for ConfigCompile
; Address: 004F0CF0
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    offset aTaskNew  ; Push register value onto the stack
call    ScriptSetsymbolCxt  ; Call a procedure
mov     edi, [esp+10h+arg_4]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4F0D3A  ; Unrecognized or less common instruction
mov     ecx, [esp+8+arg_8]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    ScriptInit  ; Call a procedure
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
mov     eax, dword_A758A8  ; Move data between registers or between register and memory
add     esp, 18h  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === ConfigRead_00405850.asm ===
; This is an assembly file for ConfigRead located at address 00405850
; Assembly for ConfigRead
; Address: 00405850
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_405884  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
call    sub_4058A0  ; Call a procedure
call    sub_405980  ; Call a procedure
call    sub_405B30  ; Call a procedure
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
call    sub_405300  ; Call a procedure
call    sub_4058A0  ; Call a procedure
call    sub_405980  ; Call a procedure
call    sub_405B30  ; Call a procedure
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === ConfigWrite_00405BD0.asm ===
; This is an assembly file for ConfigWrite located at address 00405BD0
; Assembly for ConfigWrite
; Address: 00405BD0
push    ebx  ; Push register value onto the stack
mov     ebx, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    offset aW  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    QFileOpen  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_405BFA  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    offset aCouldNotCreate_4  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_405BF8  ; Unconditional jump to a label or address
push    edi  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_405C50  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_406170  ; Call a procedure
mov     eax, dword_BC2380  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
xor     edi, edi  ; XOR operation, usually for zeroing a register
test    eax, eax  ; Unrecognized or less common instruction
jle     short loc_405C29  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_405C90  ; Call a procedure
mov     eax, dword_BC2380  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
inc     edi  ; Unrecognized or less common instruction
cmp     edi, eax  ; Unrecognized or less common instruction
jl      short loc_405C15  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
call    sub_48F340  ; Call a procedure
test    eax, eax  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
jz      short loc_405C4B  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
call    QscCompile  ; Call a procedure
push    ebx  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === CutsceneDelete_00415AB0.asm ===
; This is an assembly file for CutsceneDelete located at address 00415AB0
; Assembly for CutsceneDelete
; Address: 00415AB0
mov     eax, dword_57BAB0  ; Move data between registers or between register and memory
sub     esp, 18h  ; Unrecognized or less common instruction
cmp     dword ptr [eax], 0  ; Unrecognized or less common instruction
jz      short loc_415AD3  ; Unrecognized or less common instruction
mov     eax, [eax+8]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4015F0  ; Call a procedure
mov     eax, dword_57BAB0  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
cmp     dword ptr [eax], 0  ; Unrecognized or less common instruction
jnz     short loc_415ABD  ; Unrecognized or less common instruction
mov     eax, [esp+18h+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+20h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
mov     [esp+20h+var_18], 1  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === EnemyDetectorOverlay_00471F60.asm ===
; --------------------------------------------
; Function start 00471F60
; Arguments (from stack):
;   [esp+0x0C] â value to search for (passed in EBX)
;   [esp+0x10] â base pointer to data structure (passed in EDI)
; --------------------------------------------

push    ebx                    ; Save EBX on stack (callee-saved register)
mov     ebx, [esp+0x0C]       ; EBX â first function argument (search key)
push    esi                    ; Save ESI on stack
push    edi                    ; Save EDI on stack
mov     edi, [esp+0x10]       ; EDI â second function argument (base pointer)
xor     eax, eax              ; EAX = 0 (initialize index/counter)
lea     ecx, [edi + 0x2C44]   ; ECX = pointer to array element 0: edi + offset 0x2C44
mov     edx, ecx              ; EDX = ECX (iterator pointer)

; Loop 1: scan up to 10 entries comparing first DWORD with EBX
cmp     [edx], ebx            ; Compare array[index].field0 with search key
je      igi.exe+71F84         ; If equal, jump to âfoundâ handler
inc     eax                   ; index++
add     edx, 0x2C             ; advance pointer to next element (size = 0x2C)
cmp     eax, 0xA              ; have we checked 10 entries?
jb      igi.exe+71F75         ; if less than 10, repeat loop
jmp     igi.exe+71F95         ; otherwise, exit loop (not found)

; Compute pointer: esi = &array[eax] + baseOffset
lea     edx, [eax + eax*4]    ; edx = eax * 5
lea     eax, [eax + edx*2]    ; eax = eax + edx*2 = eax * 11
lea     esi, [edi + eax*4 + 0x2C44] ; esi = &array[eax] + baseOffset
test    esi, esi              ; Test if pointer is non-zero
jne     igi.exe+71FFD         ; If non-zero, jump to after failure

; If pointer was NULL, scan again using ECX for first non-zero entry
xor     eax, eax              ; EAX = 0 (reset index)
cmp     dword ptr [ecx], 0    ; Check array[0].field0 again
je      igi.exe+71FA7         ; If zero, skip increment
inc     eax                   ; index++
add     ecx, 0x2C             ; ECX = next element
cmp     eax, 0xA              ; have we scanned 10 entries?
jb      igi.exe+71F97         ; if less than 10, repeat
jmp     igi.exe+71FC0         ; otherwise, give up

; Compute esi again based on new EAX
lea     ecx, [eax + eax*4]    ; ecx = eax * 5
lea     edx, [eax + ecx*2]    ; edx = eax + ecx*2 = eax * 11
lea     esi, [edi + edx*4 + 0x2C44] ; esi = &array[eax] + baseOffset

call    igi.exe+90370         ; Call helper function (e.g., allocate or lookup)
test    esi, esi              ; Check returned pointer
mov     [esi+0x20], eax       ; Store return value in esi->field20
jne     igi.exe+71FFD         ; If successful, jump past failure handling

; FPU comparison loop: find first entry with float < given threshold
xor     ecx, ecx              ; ECX = 0 (reset counter)
lea     edx, [edi + 0x2C5C]   ; EDX = pointer to float array start (offset 0x2C5C)
fld     dword ptr [edx]       ; Load array[ecx] float into FP stack
fcomp   dword ptr [esp+0x18]  ; Compare with threshold passed at [esp+0x18]
fnstsw  ax                    ; Store FPU status word into AX
test    ah, 0x41              ; Check C0 (carry) or C3 flags (unordered or <)
je      igi.exe+71FE4         ; If not less, skip increment
inc     ecx                   ; index++
add     edx, 0x2C             ; advance to next float (stride = 0x2C)
cmp     ecx, 0xA              ; have we tried 10 floats?
jb      igi.exe+71FC8         ; if less than 10, repeat
; No match or exhausted
pop     edi                   ; Restore EDI
pop     esi                   ; Restore ESI
xor     eax, eax              ; EAX = 0 (return failure)
pop     ebx                   ; Restore EBX
ret                           ; Return

; If we did not early-return, fall through to record new entry
lea     eax, [ecx + ecx*4]    ; eax = ecx * 5
lea     ecx, [ecx + eax*2]    ; ecx = ecx + eax*2 = ecx * 11
lea     esi, [edi + ecx*4 + 0x2C44] ; esi = &array[ecx] + baseOffset

call    igi.exe+90370         ; Allocate or get new entry
test    esi, esi              ; Check pointer
mov     [esi+0x20], eax       ; Store return value
je      igi.exe+71FDE         ; If NULL, jump to failure

; On success, populate structure at esi with passed arguments
mov     edx, [esp+0x18]       ; Load float threshold argument
mov     eax, [esp+0x1C]       ; Load next argument
mov     ecx, [esp+0x24]       ; Load next argument
mov     [esi], ebx            ; struct.field0 = search key
mov     [esi+0x18], edx       ; struct.field18 = threshold
mov     [esi+0x10], 1         ; struct.field10 = 1 (flag)
mov     [esi+0x14], eax       ; struct.field14 = argument
mov     [esi+0x0C], ecx       ; struct.field0C = argument

call    igi.exe+90370         ; Possibly another helper call
mov     edx, [esp+0x28]       ; Load next argument
mov     [esi+0x1C], eax       ; struct.field1C = return value
mov     eax, [esp+0x2C]       ; Load next argument
mov     [esi+0x08], edx       ; struct.field08 = argument
mov     [esi+0x04], eax       ; struct.field04 = argument
mov     eax, [esp+0x20]       ; Load final argument

pop     edi                   ; Restore EDI
mov     ecx, [eax]            ; ecx = pointer from final arg
mov     [esi+0x24], ecx       ; struct.field24 = dereferenced final arg
mov     edx, [eax+4]          ; edx = pointer at final arg + 4
mov     [esi+0x28], edx       ; struct.field28 = second deref

pop     esi                   ; Restore ESI
mov     eax, 1                ; EAX = 1 (return success)
pop     ebx                   ; Restore EBX
ret                           ; Return to caller


; === ErrorShow_004AF7B0.asm ===
; This is an assembly file for ErrorShow located at address 004AF7B0
; Assembly for ErrorShow
; Address: 004AF7B0
; This is a sample comment added to the assembly file.
mov     eax, dword_936268  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4AF7FD  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aFatalError  ; Push register value onto the stack
push    offset byte_A84640  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
mov     ecx, [esp+0Ch+Format]  ; Move data between registers or between register and memory
lea     eax, [esp+0Ch+ArgList]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
mov     edi, offset byte_A84640  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
dec     ecx  ; Unrecognized or less common instruction
add     ecx, offset byte_A84640  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    _vsprintf  ; Call a procedure
push    offset byte_A84640  ; Push register value onto the stack
call    dword_936268  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
mov     eax, dword_93626C  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short locret_4AF808  ; Unrecognized or less common instruction
jmp     eax  ; Unconditional jump to a label or address
retn  ; Unrecognized or less common instruction


; === FileOpen_004A5350.asm ===
; This is an assembly file for FileOpen located at address 004A5350
; Assembly for FileOpen
; Address: 004A5350
push    40h  ; Push register value onto the stack
push    [esp+4+Mode]  ; Push register value onto the stack
push    [esp+8+FileName]  ; Push register value onto the stack
call    __fsopen  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === FramesSet_00402820.asm ===
; This is an assembly file for FramesSet located at address 00402820
; Assembly for FramesSet
; Address: 00402820
call    sub_490370  ; Call a procedure
mov     ecx, dword_567C8C  ; Move data between registers or between register and memory
mov     [ecx+30h], eax  ; Move data between registers or between register and memory
mov     edx, dword_567C8C  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     [edx+50h], eax  ; Move data between registers or between register and memory
mov     ecx, dword_567C8C  ; Move data between registers or between register and memory
mov     [ecx+34h], eax  ; Move data between registers or between register and memory
mov     edx, dword_567C8C  ; Move data between registers or between register and memory
mov     [edx+38h], eax  ; Move data between registers or between register and memory
mov     ecx, dword_567C8C  ; Move data between registers or between register and memory
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
mov     [ecx+3Ch], eax  ; Move data between registers or between register and memory
mov     edx, dword_567C8C  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
mov     byte ptr [edx+44h], 1  ; Move data between registers or between register and memory
call    sub_4E6030  ; Call a procedure
pop     ecx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === GameDataSymbolLoad_004A53B3.asm ===
; This is an assembly file for GameDataSymbolLoad located at address 004A53B3
; Assembly for GameDataSymbolLoad
; Address: 004A53B3
push    ebp  ; Push register value onto the stack
mov     ebp, esp  ; Move data between registers or between register and memory
sub     esp, 20h  ; Unrecognized or less common instruction
mov     eax, [ebp+Buffer]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
mov     [ebp+File._base], eax  ; Move data between registers or between register and memory
mov     [ebp+File._ptr], eax  ; Move data between registers or between register and memory
lea     eax, [ebp+arg_8]  ; Unrecognized or less common instruction
mov     [ebp+File._flag], 42h  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
lea     eax, [ebp+File]  ; Unrecognized or less common instruction
push    [ebp+Format]  ; Push register value onto the stack
mov     [ebp+File._cnt], 7FFFFFFFh  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    __output  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
dec     [ebp+File._cnt]  ; Unrecognized or less common instruction
mov     esi, eax  ; Move data between registers or between register and memory
js      short loc_4A53F3  ; Unrecognized or less common instruction
mov     eax, [ebp+File._ptr]  ; Move data between registers or between register and memory
and     byte ptr [eax], 0  ; Unrecognized or less common instruction
jmp     short loc_4A5400  ; Unconditional jump to a label or address
lea     eax, [ebp+File]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    0  ; Push register value onto the stack
call    __flsbuf  ; Call a procedure
pop     ecx  ; Pop value from stack into register
pop     ecx  ; Pop value from stack into register
mov     eax, esi  ; Move data between registers or between register and memory
pop     esi  ; Pop value from stack into register
leave  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === GameDataSymbolRemove_004B80A0.asm ===
; This is an assembly file for GameDataSymbolRemove located at address 004B80A0
; Assembly for GameDataSymbolRemove
; Address: 004B80A0
mov     eax, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4B8920  ; Call a procedure
pop     ecx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === GameDefineOptions_004B8890.asm ===
; This is an assembly file for GameDefineOptions located at address 004B8890
; Assembly for GameDefineOptions
; Address: 004B8890
mov     eax, [esp+arg_C]  ; Move data between registers or between register and memory
mov     ecx, [esp+arg_8]  ; Move data between registers or between register and memory
mov     edx, [esp+arg_4]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
mov     eax, dword ptr [esp+10h+ArgList]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    QTaskHashTableSet  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === GameMaterialLoad_00408350.asm ===
; This is an assembly file for GameMaterialLoad located at address 00408350
; Assembly for GameMaterialLoad
; Address: 00408350
push    esi  ; Push register value onto the stack
push    offset aLocalMaterialM  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_408375  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    offset aLocalMaterialM  ; Push register value onto the stack
push    offset aGamematerialLo  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_408387  ; Unconditional jump to a label or address


; === GraphOpen_004F9FF0.asm ===
; This is an assembly file for GraphOpen located at address 004F9FF0
; Assembly for GraphOpen
; Address: 004F9FF0
sub     esp, 20h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+24h+ArgList]  ; Move data between registers or between register and memory
push    offset aR  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    QFileOpen  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
mov     [esp+24h+var_18], eax  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4FA021  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset aUnableToOpenSF  ; Push register value onto the stack
call    WarningShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
add     esp, 20h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
lea     edx, [esp+24h+ArgList]  ; Unrecognized or less common instruction
push    4  ; Push register value onto the stack
lea     ecx, [esp+28h+var_1C]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
mov     [esp+30h+var_14], ecx  ; Move data between registers or between register and memory
call    ResourceUnpack  ; Call a procedure
mov     eax, dword ptr [esp+30h+ArgList]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
cmp     eax, 0FFEEDDCCh  ; Unrecognized or less common instruction
jnz     loc_4FA0EB  ; Unrecognized or less common instruction
mov     eax, [esp+24h+var_18]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
mov     edi, [esp+28h+arg_0]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
mov     [esp+2Ch+var_10], edi  ; Move data between registers or between register and memory
mov     [esp+2Ch+var_C], 0  ; Move data between registers or between register and memory
mov     [esp+2Ch+var_8], 0  ; Move data between registers or between register and memory
call    sub_4B1760  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4FA0DD  ; Unrecognized or less common instruction
lea     ecx, [esp+28h+var_20]  ; Unrecognized or less common instruction
lea     edx, [esp+28h+var_1C]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4FA850  ; Call a procedure
mov     eax, [esp+30h+var_20]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4FA140  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4FA0BD  ; Unrecognized or less common instruction
lea     ecx, [esp+28h+arg_0]  ; Unrecognized or less common instruction
lea     edx, [esp+28h+var_1C]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4FA7E0  ; Call a procedure
mov     eax, [esp+30h+arg_0]  ; Move data between registers or between register and memory
lea     ecx, [esp+30h+var_14]  ; Unrecognized or less common instruction
and     eax, 0FFh  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
mov     [esp+34h+var_4], eax  ; Move data between registers or between register and memory
call    dword ptr [esi+10h]  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
jmp     short loc_4FA0CC  ; Unconditional jump to a label or address
lea     edx, [esp+28h+var_1C]  ; Unrecognized or less common instruction
push    2  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4FA3B0  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
mov     eax, [esp+28h+var_18]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4B1760  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4FA072  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    nullsub_1  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
jmp     short loc_4FA115  ; Unconditional jump to a label or address
mov     ecx, [esp+24h+var_18]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4B17C0  ; Call a procedure
mov     edx, [esp+28h+var_18]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4B1730  ; Call a procedure
mov     ecx, [esp+34h+arg_0]  ; Move data between registers or between register and memory
lea     eax, [esp+34h+var_1C]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4FA160  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
mov     edx, [esp+24h+var_18]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    sub_4B17C0  ; Call a procedure
mov     eax, [esp+28h+var_18]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
add     esp, 20h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === GraphicsReset_00403B70.asm ===
; This is an assembly file for GraphicsReset located at address 00403B70
; Assembly for GraphicsReset
; Address: 00403B70
sub     esp, 18h  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    IsPlayerProfileActive  ; Call a procedure
mov     bl, 1  ; Move data between registers or between register and memory
mov     [eax+1Dh], bl  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     [eax+1Eh], bl  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     [eax+1Ch], bl  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     dword ptr [eax+10h], 1E0h  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     dword ptr [eax+0Ch], 280h  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     dword ptr [eax+14h], 20h  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
mov     [eax+11Fh], bl  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     [eax+1Fh], bl  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     dword ptr [eax+220h], 3F800000h  ; Move data between registers or between register and memory
call    IsPlayerProfileActive  ; Call a procedure
mov     [eax+18h], ebx  ; Move data between registers or between register and memory
mov     eax, [esp+24h+arg_0]  ; Move data between registers or between register and memory
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+24h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
mov     [esp+24h+var_18], ebx  ; Move data between registers or between register and memory
mov     [esp+24h+var_10], ebx  ; Move data between registers or between register and memory
mov     [esp+24h+var_C], ebx  ; Move data between registers or between register and memory
mov     [esp+24h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === HumanTaskViewReset_004659E0.asm ===
; This is an assembly file for HumanTaskViewReset located at address 004659E0
; Assembly for HumanTaskViewReset
; Address: 004659E0
fld     ds:dbl_5335E8  ; Unrecognized or less common instruction
fptan  ; Unrecognized or less common instruction
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
mov     dword ptr [eax+1ECh], 0  ; Move data between registers or between register and memory
fstp    st  ; Unrecognized or less common instruction
fstp    dword ptr [eax+1E4h]  ; Unrecognized or less common instruction
fld     ds:dbl_5339C0  ; Unrecognized or less common instruction
fptan  ; Unrecognized or less common instruction
fstp    st  ; Unrecognized or less common instruction
fstp    dword ptr [eax+1E8h]  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === HumanViewCam_00463760.asm ===
; This is an assembly file for HumanViewCam located at address 00463760
; Assembly for HumanViewCam
; Address: 00463760
mov     ecx, [esp+arg_0]  ; Move data between registers or between register and memory
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
mov     [ecx+4F0h], eax  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === HumanplayerLoad_004137A0.asm ===
; This is an assembly file for HumanplayerLoad located at address 004137A0
; Assembly for HumanplayerLoad
; Address: 004137A0
push    esi  ; Push register value onto the stack
push    offset aLocalHumanplay  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4137C5  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    offset aLocalHumanplay  ; Push register value onto the stack
push    offset aHumanplayerLoa  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4137D7  ; Unconditional jump to a label or address


; === InputDisable_004157D0.asm ===
; This is an assembly file for InputDisable located at address 004157D0
; Assembly for InputDisable
; Address: 004157D0
sub     esp, 18h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
xor     esi, esi  ; XOR operation, usually for zeroing a register
push    esi  ; Push register value onto the stack
call    sub_416A70  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4157ED  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4635B0  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
inc     esi  ; Unrecognized or less common instruction
cmp     esi, 4  ; Unrecognized or less common instruction
jl      short loc_4157D7  ; Unrecognized or less common instruction
mov     eax, [esp+20h+arg_0]  ; Move data between registers or between register and memory
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+20h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
mov     [esp+20h+var_18], 1  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === InputEnable_00415830.asm ===
; This is an assembly file for InputEnable located at address 00415830
; Assembly for InputEnable
; Address: 00415830
sub     esp, 18h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
xor     esi, esi  ; XOR operation, usually for zeroing a register
push    esi  ; Push register value onto the stack
call    sub_416A70  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_41584D  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4635E0  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
inc     esi  ; Unrecognized or less common instruction
cmp     esi, 4  ; Unrecognized or less common instruction
jl      short loc_415837  ; Unrecognized or less common instruction
mov     eax, [esp+20h+arg_0]  ; Move data between registers or between register and memory
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+20h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
mov     [esp+20h+var_18], 1  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === IsPlayerProfileActive_00406220.asm ===
; This is an assembly file for IsPlayerProfileActive located at address 00406220
; Assembly for IsPlayerProfileActive
; Address: 00406220
mov     ecx, dword_BC2384  ; Move data between registers or between register and memory
lea     eax, [ecx+ecx*2]  ; Unrecognized or less common instruction
shl     eax, 3  ; Unrecognized or less common instruction
sub     eax, ecx  ; Unrecognized or less common instruction
lea     eax, [eax+eax*2]  ; Unrecognized or less common instruction
lea     eax, [eax+eax*4]  ; Unrecognized or less common instruction
lea     eax, ds:0BC2388h[eax*4]  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === IsResourceLoaded_004B5B90.asm ===
; This is an assembly file for IsResourceLoaded located at address 004B5B90
; Assembly for IsResourceLoaded
; Address: 004B5B90
sub     esp, 104h  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
xor     esi, esi  ; XOR operation, usually for zeroing a register
mov     eax, [esp+114h+Str1]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
lea     ecx, [esp+118h+var_80]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4B1020  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
lea     edx, [esp+120h+var_80]  ; Unrecognized or less common instruction
lea     eax, [esp+120h+var_100]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
mov     [esp+128h+var_104], esi  ; Move data between registers or between register and memory
call    sub_4B5AF0  ; Call a procedure
mov     cl, [esp+128h+var_100]  ; Move data between registers or between register and memory
add     esp, 14h  ; Unrecognized or less common instruction
test    cl, cl  ; Unrecognized or less common instruction
jz      short loc_4B5BF0  ; Unrecognized or less common instruction
lea     eax, [esp+114h+var_100]  ; Unrecognized or less common instruction
cmp     cl, 5Ch  ; Unrecognized or less common instruction
mov     ecx, 2Fh  ; Move data between registers or between register and memory
jz      short loc_4B5BE6  ; Unrecognized or less common instruction
movsx   ecx, byte ptr [eax]  ; Move data between registers or between register and memory
mov     [eax], cl  ; Move data between registers or between register and memory
mov     cl, [eax+1]  ; Move data between registers or between register and memory
inc     eax  ; Unrecognized or less common instruction
test    cl, cl  ; Unrecognized or less common instruction
jnz     short loc_4B5BD9  ; Unrecognized or less common instruction
lea     ecx, [esp+114h+var_100]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4B5B30  ; Call a procedure
mov     ecx, dword_943E40  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     ebp, ecx  ; Move data between registers or between register and memory
mov     edi, [ecx+4]  ; Move data between registers or between register and memory
test    edi, edi  ; Unrecognized or less common instruction
jz      short loc_4B5C52  ; Unrecognized or less common instruction
cmp     [ebp+20h], eax  ; Unrecognized or less common instruction
jnz     short loc_4B5C49  ; Unrecognized or less common instruction
lea     esi, [esp+114h+var_100]  ; Unrecognized or less common instruction
lea     ecx, [ebp+38h]  ; Unrecognized or less common instruction
mov     bl, [ecx]  ; Move data between registers or between register and memory
mov     dl, bl  ; Move data between registers or between register and memory
cmp     bl, [esi]  ; Unrecognized or less common instruction
jnz     short loc_4B5C3C  ; Unrecognized or less common instruction
test    dl, dl  ; Unrecognized or less common instruction
jz      short loc_4B5C38  ; Unrecognized or less common instruction
mov     bl, [ecx+1]  ; Move data between registers or between register and memory
mov     dl, bl  ; Move data between registers or between register and memory
cmp     bl, [esi+1]  ; Unrecognized or less common instruction
jnz     short loc_4B5C3C  ; Unrecognized or less common instruction
add     ecx, 2  ; Unrecognized or less common instruction
add     esi, 2  ; Unrecognized or less common instruction
test    dl, dl  ; Unrecognized or less common instruction
jnz     short loc_4B5C18  ; Unrecognized or less common instruction
xor     ecx, ecx  ; XOR operation, usually for zeroing a register
jmp     short loc_4B5C41  ; Unconditional jump to a label or address
sbb     ecx, ecx  ; Unrecognized or less common instruction
sbb     ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
test    ecx, ecx  ; Unrecognized or less common instruction
jz      short loc_4B5C5B  ; Unrecognized or less common instruction
mov     esi, [esp+114h+var_104]  ; Move data between registers or between register and memory
mov     ebp, edi  ; Move data between registers or between register and memory
mov     edi, [edi+4]  ; Move data between registers or between register and memory
test    edi, edi  ; Unrecognized or less common instruction
jnz     short loc_4B5C0C  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4B5C78  ; Unrecognized or less common instruction
jmp     loc_4B5B9C  ; Unconditional jump to a label or address
mov     eax, [esp+114h+arg_4]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B5C68  ; Unrecognized or less common instruction
mov     [eax], ebp  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
mov     eax, 1  ; Move data between registers or between register and memory
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === LevelLoad_004F0E10.asm ===
; This is an assembly file for LevelLoad located at address 004F0E10
; Assembly for LevelLoad
; Address: 004F0E10
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
sub     esp, 100h  ; Unrecognized or less common instruction
lea     ecx, [esp+100h+Buffer]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    offset aSObjectsQsc  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
mov     edx, [esp+10Ch+arg_4]  ; Move data between registers or between register and memory
lea     eax, [esp+10Ch+Buffer]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4F0D40  ; Call a procedure
add     esp, 114h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === LevelQuit_00416550.asm ===
; This is an assembly file for LevelQuit located at address 00416550
; Assembly for LevelQuit
; Address: 00416550
call    sub_4B0DB0  ; Call a procedure
test    al, al  ; Unrecognized or less common instruction
jnz     short loc_41655E  ; Unrecognized or less common instruction
call    sub_4B0D40  ; Call a procedure
call    sub_4E7130  ; Call a procedure
call    QtaskUpdate  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     ecx, [eax+54h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    QtaskUpdateList  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     eax, [edx+48h]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_41658F  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4015F0  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     ecx, [eax+44h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4015F0  ; Call a procedure
call    sub_416690  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
mov     eax, [edx+0E8h]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    ResourceFlush  ; Call a procedure
call    sub_416660  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
mov     edx, [ecx+0ECh]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    ResourceFlush  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
call    sub_46B310  ; Call a procedure
call    sub_4868C0  ; Call a procedure
call    sub_4CEA70  ; Call a procedure
mov     ecx, dword_A94E84[eax*4]  ; Move data between registers or between register and memory
test    ecx, ecx  ; Unrecognized or less common instruction
jz      short loc_4165F9  ; Unrecognized or less common instruction
call    sub_4CEA70  ; Call a procedure
push    0  ; Push register value onto the stack
call    dword_A94E84[eax*4]  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
call    sub_4F0CD0  ; Call a procedure
push    offset aMissionSounds  ; Push register value onto the stack
call    sub_4E69C0  ; Call a procedure
push    offset aLocalCommonSou  ; Push register value onto the stack
call    sub_4E69C0  ; Call a procedure
call    sub_4D65D0  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     ecx, [eax+24h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4CF9D0  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
mov     eax, [edx+20h]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4C5CE0  ; Call a procedure
push    0  ; Push register value onto the stack
call    nullsub_1  ; Call a procedure
push    offset aMission  ; Push register value onto the stack
call    sub_4B13A0  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
mov     dword_57BABC, 0  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === LevelRestart_00416FE0.asm ===
; This is an assembly file for LevelRestart located at address 00416FE0
; Assembly for LevelRestart
; Address: 00416FE0
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    sub_4028D0  ; Call a procedure
call    sub_4B0D40  ; Call a procedure
push    5  ; Push register value onto the stack
call    LoadingScreenShow  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
call    sub_4E7130  ; Call a procedure
call    sub_453270  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
call    sub_487180  ; Call a procedure
mov     eax, [eax+4E4h]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4868D0  ; Call a procedure
call    sub_468DD0  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
call    QtaskUpdate  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
call    sub_4EDCC0  ; Call a procedure
push    1Eh  ; Push register value onto the stack
push    offset Buffer  ; Push register value onto the stack
call    LevelLoad  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
add     esp, 30h  ; Unrecognized or less common instruction
xor     edi, edi  ; XOR operation, usually for zeroing a register
push    edi  ; Push register value onto the stack
call    sub_416920  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4CE830  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
inc     edi  ; Unrecognized or less common instruction
cmp     edi, 6  ; Unrecognized or less common instruction
jl      short loc_417050  ; Unrecognized or less common instruction
call    sub_4B0D50  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_48A5D0  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
call    sub_4028F0  ; Call a procedure
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === LevelStart_00415B30.asm ===
; This is an assembly file for LevelStart located at address 00415B30
; Assembly for LevelStart
; Address: 00415B30
sub     esp, 280h  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    1Eh  ; Push register value onto the stack
call    FramesSet  ; Call a procedure
call    sub_4028D0  ; Call a procedure
mov     eax, ArgList  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_485170  ; Call a procedure
mov     edi, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    edi, edi  ; Unrecognized or less common instruction
jnz     short loc_415B6F  ; Unrecognized or less common instruction
mov     ecx, ArgList  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
push    offset aTheMissionIdDD  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_415B6D  ; Unconditional jump to a label or address
lea     edx, [edi+144h]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    offset aLocalS  ; Push register value onto the stack
push    offset Buffer  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
push    offset Buffer  ; Push register value onto the stack
push    offset aMission  ; Push register value onto the stack
call    sub_4B12F0  ; Call a procedure
mov     ebp, [esp+2A0h+arg_0]  ; Move data between registers or between register and memory
mov     dword_57BABC, ebp  ; Move data between registers or between register and memory
call    sub_453270  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
add     eax, 60h  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4D9950  ; Call a procedure
call    sub_416010  ; Call a procedure
call    sub_406390  ; Call a procedure
push    9  ; Push register value onto the stack
call    LoadingScreenShow  ; Call a procedure
push    0DACh  ; Push register value onto the stack
mov     esi, eax  ; Move data between registers or between register and memory
call    sub_4C5B20  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
mov     [ecx+20h], eax  ; Move data between registers or between register and memory
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
mov     dword ptr [edx+0E4h], 0  ; Move data between registers or between register and memory
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     ecx, [eax+20h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_408390  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     edx, [eax+20h]  ; Move data between registers or between register and memory
mov     dword_A44344, edx  ; Move data between registers or between register and memory
mov     eax, [eax+20h]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    nullsub_1  ; Call a procedure
push    offset Buffer  ; Push register value onto the stack
lea     ecx, [esp+2B8h+Buffer]  ; Unrecognized or less common instruction
push    offset aSterrainTerrai  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
lea     edx, [esp+2C0h+Buffer]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
mov     ecx, [eax+20h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4C5F00  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
lea     edx, [esp+2C8h+Buffer]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
mov     ecx, [eax+20h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4C6240  ; Call a procedure
add     esp, 44h  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
call    sub_4B2610  ; Call a procedure
push    0DB840h  ; Push register value onto the stack
push    3F800000h  ; Push register value onto the stack
call    sub_4B25B0  ; Call a procedure
call    sub_4CEEA0  ; Call a procedure
lea     edx, [edi+244h]  ; Unrecognized or less common instruction
lea     eax, [esp+298h+var_200]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    offset aLocalS  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
lea     ecx, [esp+2A4h+var_200]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4CFBD0  ; Call a procedure
push    offset aLocalCommon  ; Push register value onto the stack
call    sub_4CFC00  ; Call a procedure
lea     edx, [edi+444h]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_4CEFA0  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     [ecx+24h], eax  ; Move data between registers or between register and memory
call    sub_48A620  ; Call a procedure
lea     edx, [edi+344h]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
lea     eax, [esp+2BCh+var_100]  ; Unrecognized or less common instruction
push    offset aLocalS  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
lea     ecx, [esp+2C4h+var_100]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4CFBD0  ; Call a procedure
add     edi, 464h  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4CEFA0  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4F0CE0  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
call    sub_4B25F0  ; Call a procedure
push    0FFFFFFFFh  ; Push register value onto the stack
call    sub_4B2610  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
call    sub_4CEA60  ; Call a procedure
mov     ecx, dword_A94E84[eax*4]  ; Move data between registers or between register and memory
test    ecx, ecx  ; Unrecognized or less common instruction
jz      short loc_415D27  ; Unrecognized or less common instruction
call    sub_4CEA60  ; Call a procedure
push    0  ; Push register value onto the stack
call    dword_A94E84[eax*4]  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
push    offset aLocalCommonSou  ; Push register value onto the stack
call    SoundLoad  ; Call a procedure
push    offset aMissionSounds  ; Push register value onto the stack
call    SoundLoad  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
push    0  ; Push register value onto the stack
push    offset aLocalCommonSpr_0  ; Push register value onto the stack
call    ResourceLoad  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
mov     [edx+0E8h], eax  ; Move data between registers or between register and memory
call    sub_4161D0  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
push    0  ; Push register value onto the stack
push    offset aLocalCommonTex  ; Push register value onto the stack
call    ResourceLoad  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
mov     [ecx+0ECh], eax  ; Move data between registers or between register and memory
call    sub_416130  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
call    sub_46B070  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
call    sub_4868A0  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
call    sub_402890  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_485300  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
mov     [edx+44h], eax  ; Move data between registers or between register and memory
call    sub_416D40  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4F0CB0  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     [ecx+4Ch], eax  ; Move data between registers or between register and memory
call    sub_48A620  ; Call a procedure
push    0  ; Push register value onto the stack
call    sub_4E6060  ; Call a procedure
push    offset aLocalCommonSou_0  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4E6550  ; Call a procedure
push    offset aMissionSounds_0  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4E6550  ; Call a procedure
add     esp, 24h  ; Unrecognized or less common instruction
call    sub_416920  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
add     edx, 60h  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_416D40  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4E7D40  ; Call a procedure
mov     edi, eax  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
call    sub_401AE0  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
add     esp, 10h  ; Unrecognized or less common instruction
mov     [ecx+54h], eax  ; Move data between registers or between register and memory
call    sub_416920  ; Call a procedure
push    eax  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    sub_416D40  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4E7D70  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
push    41F00000h  ; Push register value onto the stack
mov     dword ptr [edx+48h], 0  ; Move data between registers or between register and memory
call    sub_4D2D30  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
mov     al, byte_C28C61  ; Move data between registers or between register and memory
test    al, al  ; Unrecognized or less common instruction
jz      short loc_415ECC  ; Unrecognized or less common instruction
mov     cl, byte_C28F80  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
test    cl, cl  ; Unrecognized or less common instruction
jz      short loc_415E6F  ; Unrecognized or less common instruction
mov     eax, 3  ; Move data between registers or between register and memory
push    3D162FC9h  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3DCCCCCDh  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3DCCCCCDh  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3DCCCCCDh  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3D162FC9h  ; Push register value onto the stack
push    3DCCCCCDh  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4061C0  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4061E0  ; Call a procedure
push    eax  ; Push register value onto the stack
push    0  ; Push register value onto the stack
call    sub_4ED5E0  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
mov     dword_BC20A0, 1  ; Move data between registers or between register and memory
push    offset sub_416110  ; Push register value onto the stack
call    sub_4F80E0  ; Call a procedure
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
add     eax, 60h  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_437500  ; Call a procedure
call    sub_4EDCC0  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
add     ecx, 60h  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4F65B0  ; Call a procedure
push    1Eh  ; Push register value onto the stack
call    sub_4F65D0  ; Call a procedure
call    sub_416D40  ; Call a procedure
mov     edx, [eax+44h]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    sub_485320  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4F65C0  ; Call a procedure
push    1Eh  ; Push register value onto the stack
push    offset Buffer  ; Push register value onto the stack
call    LevelLoad  ; Call a procedure
push    1  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
add     esp, 28h  ; Unrecognized or less common instruction
xor     edi, edi  ; XOR operation, usually for zeroing a register
push    edi  ; Push register value onto the stack
call    sub_416920  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4CE830  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
inc     edi  ; Unrecognized or less common instruction
cmp     edi, 6  ; Unrecognized or less common instruction
jl      short loc_415F2C  ; Unrecognized or less common instruction
push    offset Mode  ; Push register value onto the stack
push    offset aMpzmAfp  ; Push register value onto the stack
call    FileOpen  ; Call a procedure
mov     edi, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    edi, edi  ; Unrecognized or less common instruction
jz      short loc_415F83  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    _fseek  ; Call a procedure
push    edi  ; Push register value onto the stack
call    _fgetc  ; Call a procedure
xor     ecx, ecx  ; XOR operation, usually for zeroing a register
cmp     eax, 5Eh  ; Unrecognized or less common instruction
setz    cl  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
mov     ebp, ecx  ; Move data between registers or between register and memory
call    _fclose  ; Call a procedure
add     esp, 14h  ; Unrecognized or less common instruction
test    ebp, ebp  ; Unrecognized or less common instruction
jnz     short loc_415F92  ; Unrecognized or less common instruction
push    offset aExceptionFault_0  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
jmp     short loc_415F90  ; Unconditional jump to a label or address
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
push    offset aGameMusic  ; Push register value onto the stack
mov     dword ptr [edx+0F8h], 0  ; Move data between registers or between register and memory
call    sub_497450  ; Call a procedure
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
push    offset aGameMusic  ; Push register value onto the stack
mov     [ecx+0F0h], eax  ; Move data between registers or between register and memory
call    sub_497410  ; Call a procedure
mov     edx, dword_57BABC  ; Move data between registers or between register and memory
mov     [edx+0F4h], eax  ; Move data between registers or between register and memory
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     dword ptr [eax+0FCh], 30h  ; Move data between registers or between register and memory
mov     ecx, dword_57BABC  ; Move data between registers or between register and memory
add     ecx, 100h  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4974A0  ; Call a procedure
call    sub_4B0D50  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_48A5D0  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
call    sub_4028F0  ; Call a procedure
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
add     esp, 280h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === LoadingScreenShow_0048A440.asm ===
; This is an assembly file for LoadingScreenShow located at address 0048A440
; Assembly for LoadingScreenShow
; Address: 0048A440
sub     esp, 38h  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    4  ; Push register value onto the stack
push    1Ch  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
call    sub_491CF0  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
mov     eax, [esp+50h+arg_0]  ; Move data between registers or between register and memory
mov     dword ptr [esi+4], 0  ; Move data between registers or between register and memory
mov     [esi], eax  ; Move data between registers or between register and memory
mov     eax, [ebx+4]  ; Move data between registers or between register and memory
push    0Ah  ; Push register value onto the stack
sub     eax, 280h  ; Unrecognized or less common instruction
lea     ecx, [esi+10h]  ; Unrecognized or less common instruction
cdq  ; Unrecognized or less common instruction
sub     eax, edx  ; Unrecognized or less common instruction
push    230h  ; Push register value onto the stack
sar     eax, 1  ; Unrecognized or less common instruction
add     eax, 28h  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
mov     [esi+8], eax  ; Move data between registers or between register and memory
mov     eax, [ebx+8]  ; Move data between registers or between register and memory
sub     eax, 1E0h  ; Unrecognized or less common instruction
cdq  ; Unrecognized or less common instruction
sub     eax, edx  ; Unrecognized or less common instruction
sar     eax, 1  ; Unrecognized or less common instruction
add     eax, 1B8h  ; Unrecognized or less common instruction
mov     [esi+0Ch], eax  ; Move data between registers or between register and memory
call    sub_498380  ; Call a procedure
mov     edi, [esi+18h]  ; Move data between registers or between register and memory
mov     ecx, 15E0h  ; Move data between registers or between register and memory
mov     eax, 7F00h  ; Move data between registers or between register and memory
rep stosd  ; Unrecognized or less common instruction
mov     edx, [ebx+8]  ; Move data between registers or between register and memory
mov     eax, [ebx+4]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
lea     ecx, [esp+60h+var_34]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_498380  ; Call a procedure
call    sub_498370  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4B0FD0  ; Call a procedure
lea     edx, [esp+6Ch+var_34]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_498410  ; Call a procedure
push    0  ; Push register value onto the stack
push    offset aLocalMenusyste_4  ; Push register value onto the stack
call    ResourceLoad  ; Call a procedure
add     esp, 30h  ; Unrecognized or less common instruction
mov     dword ptr [esp+48h+ArgList], eax  ; Move data between registers or between register and memory
call    sub_48F2D0  ; Call a procedure
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_48A4F7  ; Unrecognized or less common instruction
push    offset aLocalMenusyste_5  ; Push register value onto the stack
jmp     short loc_48A4FC  ; Unconditional jump to a label or address
push    offset aLocalMenusyste_6  ; Push register value onto the stack
call    sub_4B6DB0  ; Call a procedure
mov     ebp, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     dword ptr [ebp+20h], 0FFFFFFFFh  ; Move data between registers or between register and memory
mov     eax, [ebx+4]  ; Move data between registers or between register and memory
sub     eax, 280h  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
cdq  ; Unrecognized or less common instruction
sub     eax, edx  ; Unrecognized or less common instruction
sar     eax, 1  ; Unrecognized or less common instruction
mov     [esp+4Ch+arg_0], eax  ; Move data between registers or between register and memory
fild    [esp+4Ch+arg_0]  ; Unrecognized or less common instruction
fstp    dword ptr [ebp+4]  ; Unrecognized or less common instruction
mov     eax, [ebx+8]  ; Move data between registers or between register and memory
sub     eax, 1E0h  ; Unrecognized or less common instruction
cdq  ; Unrecognized or less common instruction
sub     eax, edx  ; Unrecognized or less common instruction
sar     eax, 1  ; Unrecognized or less common instruction
mov     [esp+4Ch+arg_0], eax  ; Move data between registers or between register and memory
fild    [esp+4Ch+arg_0]  ; Unrecognized or less common instruction
fstp    dword ptr [ebp+8]  ; Unrecognized or less common instruction
call    sub_4B6E60  ; Call a procedure
call    sub_4B0F90  ; Call a procedure
mov     ecx, 0Ah  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edi, [esp+4Ch+var_28]  ; Unrecognized or less common instruction
rep stosd  ; Unrecognized or less common instruction
call    sub_491DC0  ; Call a procedure
mov     [esp+4Ch+var_24], eax  ; Move data between registers or between register and memory
mov     eax, [esp+4Ch+var_2C]  ; Move data between registers or between register and memory
mov     edx, [esp+4Ch+var_30]  ; Move data between registers or between register and memory
mov     [esp+4Ch+var_8], eax  ; Move data between registers or between register and memory
mov     eax, [esp+4Ch+var_34]  ; Move data between registers or between register and memory
xor     edi, edi  ; XOR operation, usually for zeroing a register
mov     [esp+4Ch+var_10], eax  ; Move data between registers or between register and memory
mov     [esp+4Ch+var_18], edi  ; Move data between registers or between register and memory
lea     ecx, ds:0[eax*4]  ; Unrecognized or less common instruction
lea     eax, [esp+4Ch+var_28]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
mov     [esp+50h+var_1C], ecx  ; Move data between registers or between register and memory
mov     [esp+50h+var_14], edi  ; Move data between registers or between register and memory
mov     [esp+50h+var_C], edx  ; Move data between registers or between register and memory
mov     [esp+50h+var_4], 1  ; Move data between registers or between register and memory
call    sub_491D70  ; Call a procedure
lea     ecx, [esp+50h+var_34]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4983D0  ; Call a procedure
push    ebp  ; Push register value onto the stack
call    sub_4B6E30  ; Call a procedure
mov     edx, dword ptr [esp+58h+ArgList]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    ResourceFlush  ; Call a procedure
push    edi  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_48A620  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
mov     eax, esi  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 38h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === LogAdd_004BBC30.asm ===
; This is an assembly file for LogAdd located at address 004BBC30
; Assembly for LogAdd
; Address: 004BBC30
mov     eax, dword_A43ED4  ; Move data between registers or between register and memory
sub     esp, 400h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4BBC6D  ; Unrecognized or less common instruction
mov     ecx, [esp+400h+Format]  ; Move data between registers or between register and memory
lea     eax, [esp+400h+ArgList]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
lea     edx, [esp+404h+Buffer]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    _vsprintf  ; Call a procedure
mov     eax, dword_A43EC8  ; Move data between registers or between register and memory
lea     ecx, [esp+40Ch+Buffer]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    dword_A43ED4  ; Call a procedure
add     esp, 14h  ; Unrecognized or less common instruction
add     esp, 400h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MagicObjLoad_004C4930.asm ===
; This is an assembly file for MagicObjLoad located at address 004C4930
; Assembly for MagicObjLoad
; Address: 004C4930
mov     eax, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    offset sub_4C2F90  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B1420  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MemoryAlloc_004B0C60.asm ===
; This is an assembly file for MemoryAlloc located at address 004B0C60
; Assembly for MemoryAlloc
; Address: 004B0C60
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
mov     ebx, [esp+4+arg_4]  ; Move data between registers or between register and memory
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     esi, dword_942300  ; Move data between registers or between register and memory
lea     ebp, [eax+ebx+1Ch]  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
inc     esi  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
mov     dword_942300, esi  ; Move data between registers or between register and memory
call    _malloc  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4B0CBE  ; Unrecognized or less common instruction
mov     ecx, dword_A960F0  ; Move data between registers or between register and memory
xor     edx, edx  ; XOR operation, usually for zeroing a register
mov     eax, [ecx]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B0CAC  ; Unrecognized or less common instruction
mov     edi, [ecx+0Ch]  ; Move data between registers or between register and memory
mov     ebx, [ecx+10h]  ; Move data between registers or between register and memory
mov     ecx, eax  ; Move data between registers or between register and memory
mov     eax, [eax]  ; Move data between registers or between register and memory
add     edx, edi  ; Unrecognized or less common instruction
add     esi, ebx  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B0C9A  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    offset aMemAllocFailed  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
jmp     short loc_4B0CBC  ; Unconditional jump to a label or address
lea     edi, [esi+ebx+1Bh]  ; Unrecognized or less common instruction
dec     ebx  ; Unrecognized or less common instruction
not     ebx  ; Unrecognized or less common instruction
and     edi, ebx  ; Unrecognized or less common instruction
lea     ecx, [edi-4]  ; Unrecognized or less common instruction
and     ecx, 0FFFFFFFCh  ; Unrecognized or less common instruction
mov     [ecx], esi  ; Move data between registers or between register and memory
mov     dword ptr [esi+4], 0  ; Move data between registers or between register and memory
mov     dword ptr [esi], 0  ; Move data between registers or between register and memory
mov     al, byte_9422FC  ; Move data between registers or between register and memory
test    al, al  ; Unrecognized or less common instruction
jnz     short loc_4B0CEA  ; Unrecognized or less common instruction
call    sub_4B0BA0  ; Call a procedure
push    esi  ; Push register value onto the stack
push    offset dword_A960F0  ; Push register value onto the stack
call    sub_4AF8F0  ; Call a procedure
mov     edx, [esp+18h+arg_0]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
mov     [esi+8], edi  ; Move data between registers or between register and memory
mov     eax, edi  ; Move data between registers or between register and memory
mov     [esi+0Ch], ebp  ; Move data between registers or between register and memory
mov     [esi+10h], edx  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === MemoryDealloc_004B0BE0.asm ===
; This is an assembly file for MemoryDealloc located at address 004B0BE0
; Assembly for MemoryDealloc
; Address: 004B0BE0
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
xor     edi, edi  ; XOR operation, usually for zeroing a register
call    nullsub_1  ; Call a procedure
mov     eax, dword_A960F0  ; Move data between registers or between register and memory
mov     esi, [eax]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4B0C09  ; Unrecognized or less common instruction
mov     eax, [eax+8]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     eax, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
inc     edi  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4B0BF4  ; Unrecognized or less common instruction
mov     byte_9422FC, 0  ; Move data between registers or between register and memory
call    sub_4B0D50  ; Call a procedure
test    edi, edi  ; Unrecognized or less common instruction
jz      short loc_4B0C37  ; Unrecognized or less common instruction
cmp     edi, 1  ; Unrecognized or less common instruction
mov     eax, offset byte_567C74  ; Move data between registers or between register and memory
jz      short loc_4B0C28  ; Unrecognized or less common instruction
mov     eax, offset aS_3  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    offset aDBlockSOfMemor  ; Push register value onto the stack
call    WarningShow  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     eax, dword_942300  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
test    eax, eax  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
jz      short locret_4B0C50  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    offset aInternalMemory  ; Push register value onto the stack
call    WarningShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MenuManager_00418B00.asm ===
; This is an assembly file for MenuManager located at address 00418B00
; Assembly for MenuManager
; Address: 00418B00
mov     al, [esp+arg_8]  ; Move data between registers or between register and memory
sub     esp, 120h  ; Unrecognized or less common instruction
test    al, al  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
jz      loc_418BE8  ; Unrecognized or less common instruction
call    IsPlayerProfileActive  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
mov     ecx, 47h  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edi, [esp+130h+var_11C]  ; Unrecognized or less common instruction
rep stosd  ; Unrecognized or less common instruction
call    sub_4950E0  ; Call a procedure
mov     [esp+130h+var_104], eax  ; Move data between registers or between register and memory
mov     [esp+130h+var_106], 1  ; Move data between registers or between register and memory
mov     [esp+130h+var_118], 280h  ; Move data between registers or between register and memory
mov     [esp+130h+var_114], 1E0h  ; Move data between registers or between register and memory
mov     [esp+130h+var_10C], 10h  ; Move data between registers or between register and memory
mov     [esp+130h+var_110], 1  ; Move data between registers or between register and memory
call    sub_4950E0  ; Call a procedure
mov     [esp+130h+var_104], eax  ; Move data between registers or between register and memory
lea     eax, [ebx+11Fh]  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
mov     [esp+130h+var_106], 1  ; Move data between registers or between register and memory
mov     [esp+130h+var_108], 1  ; Move data between registers or between register and memory
jnz     short loc_418B7A  ; Unrecognized or less common instruction
mov     eax, offset byte_567C74  ; Move data between registers or between register and memory
mov     edi, eax  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edx, [esp+130h+var_80]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
lea     eax, [ebx+1Fh]  ; Unrecognized or less common instruction
and     ecx, 3  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
jnz     short loc_418BAC  ; Unrecognized or less common instruction
mov     eax, offset byte_567C74  ; Move data between registers or between register and memory
mov     edi, eax  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edx, [esp+130h+var_100]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+134h+var_11C]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4E7540  ; Call a procedure
lea     edx, [esp+138h+var_11C]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_491A90  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     edi, dword ptr [esp+130h+ArgList]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      loc_418D60  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    ScriptInit  ; Call a procedure
mov     ebx, [esp+140h+arg_0]  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    offset aTaskNew  ; Push register value onto the stack
call    ScriptSetsymbolCxt  ; Call a procedure
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
call    sub_418AF0  ; Call a procedure
push    eax  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_401BE0  ; Call a procedure
mov     ebp, eax  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
add     esp, 28h  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
lea     edx, [ebp+26C5h]  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+130h+var_11D]  ; Unrecognized or less common instruction
mov     [esp+130h+var_11D], 1  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4F1A70  ; Call a procedure
push    eax  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_401D80  ; Call a procedure
mov     dl, [esp+13Ch+arg_C]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
neg     dl  ; Unrecognized or less common instruction
sbb     edx, edx  ; Unrecognized or less common instruction
mov     [esp+130h+var_11D], 0  ; Move data between registers or between register and memory
and     edx, 0FFFFFFF7h  ; Unrecognized or less common instruction
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
add     edx, 9  ; Unrecognized or less common instruction
mov     [ebp+28h], edx  ; Move data between registers or between register and memory
mov     eax, dword_539828  ; Move data between registers or between register and memory
cmp     eax, ebx  ; Unrecognized or less common instruction
jnz     short loc_418CA4  ; Unrecognized or less common instruction
mov     dword ptr [ebp+20h], 384h  ; Move data between registers or between register and memory
mov     al, [esp+130h+arg_8]  ; Move data between registers or between register and memory
mov     dword_539828, ebx  ; Move data between registers or between register and memory
test    al, al  ; Unrecognized or less common instruction
jz      short loc_418CDF  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
call    sub_4199D0  ; Call a procedure
mov     [ebp+27E0h], eax  ; Move data between registers or between register and memory
call    sub_402870  ; Call a procedure
push    3Ch  ; Push register value onto the stack
mov     [ebp+26B8h], eax  ; Move data between registers or between register and memory
call    FramesSet  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
mov     byte ptr [ebp+282Ch], 1  ; Move data between registers or between register and memory
jmp     short loc_418CF0  ; Unconditional jump to a label or address
mov     dword ptr [ebp+26B8h], 0FFFFFFFFh  ; Move data between registers or between register and memory
mov     byte ptr [ebp+282Ch], 0  ; Move data between registers or between register and memory
mov     al, [esp+130h+arg_10]  ; Move data between registers or between register and memory
push    offset Mode  ; Push register value onto the stack
push    offset aYmbeAfp  ; Push register value onto the stack
mov     [ebp+2838h], ebx  ; Move data between registers or between register and memory
mov     [ebp+26C3h], al  ; Move data between registers or between register and memory
call    FileOpen  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
cmp     esi, ebx  ; Unrecognized or less common instruction
jz      short loc_418D44  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    _fseek  ; Call a procedure
push    esi  ; Push register value onto the stack
call    _fgetc  ; Call a procedure
xor     ecx, ecx  ; XOR operation, usually for zeroing a register
cmp     eax, 40h  ; Unrecognized or less common instruction
setz    cl  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
mov     edi, ecx  ; Move data between registers or between register and memory
call    _fclose  ; Call a procedure
add     esp, 14h  ; Unrecognized or less common instruction
cmp     edi, ebx  ; Unrecognized or less common instruction
jnz     short loc_418D53  ; Unrecognized or less common instruction
push    offset aExceptionFault_2  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
jmp     short loc_418D51  ; Unconditional jump to a label or address
pop     edi  ; Pop value from stack into register
mov     eax, ebp  ; Move data between registers or between register and memory
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 120h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aFailedToLoadMe  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_418D6E  ; Unconditional jump to a label or address


; === MissionOpen_00484E60.asm ===
; This is an assembly file for MissionOpen located at address 00484E60
; Assembly for MissionOpen
; Address: 00484E60
sub     esp, 104h  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
mov     ebx, [esp+108h+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     al, [ebx+8]  ; Move data between registers or between register and memory
test    al, al  ; Unrecognized or less common instruction
jnz     loc_484F12  ; Unrecognized or less common instruction
mov     edi, [ebx]  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edx, [esp+110h+String]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+110h+String]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    __strlwr  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
call    sub_48F340  ; Call a procedure
test    eax, eax  ; Unrecognized or less common instruction
mov     edi, offset aMissionQvm  ; Move data between registers or between register and memory
jnz     short loc_484EBE  ; Unrecognized or less common instruction
mov     edi, offset aMissionQsc  ; Move data between registers or between register and memory
lea     edx, [esp+110h+String]  ; Unrecognized or less common instruction
push    1  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
call    sub_4B09C0  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_484F24  ; Unrecognized or less common instruction
mov     eax, [ebx]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_484F02  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aMissionOpenCou  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_484F10  ; Unconditional jump to a label or address
mov     ecx, [ebx]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    offset MissionOpen  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4B1420  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MusicDisable_00415A60.asm ===
; This is an assembly file for MusicDisable located at address 00415A60
; Assembly for MusicDisable
; Address: 00415A60
sub     esp, 18h  ; Unrecognized or less common instruction
mov     eax, [esp+18h+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+20h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
mov     byte_57BAC0, 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_18], 1  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MusicEnable_00415A10.asm ===
; This is an assembly file for MusicEnable located at address 00415A10
; Assembly for MusicEnable
; Address: 00415A10
sub     esp, 18h  ; Unrecognized or less common instruction
mov     eax, 1  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
mov     byte_57BAC0, al  ; Move data between registers or between register and memory
mov     [esp+1Ch+var_18], eax  ; Move data between registers or between register and memory
mov     eax, [esp+1Ch+arg_0]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+20h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MusicSetSfxVolume_00495F30.asm ===
; This is an assembly file for MusicSetSfxVolume located at address 00495F30
; Assembly for MusicSetSfxVolume
; Address: 00495F30
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
mov     dword_54390C, eax  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === MusicSetVolume_00495E70.asm ===
; This is an assembly file for MusicSetVolume located at address 00495E70
; Assembly for MusicSetVolume
; Address: 00495E70
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
mov     ecx, [esp+arg_4]  ; Move data between registers or between register and memory
sub     esp, 18h  ; Unrecognized or less common instruction
mov     dword_543904, eax  ; Move data between registers or between register and memory
mov     eax, dword_5CA150  ; Move data between registers or between register and memory
mov     dword_543908, ecx  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
xor     edi, edi  ; XOR operation, usually for zeroing a register
cmp     eax, ebx  ; Unrecognized or less common instruction
jle     loc_495F20  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
mov     esi, offset unk_6771B8  ; Move data between registers or between register and memory
mov     ecx, [esi-360h]  ; Move data between registers or between register and memory
cmp     ecx, ebx  ; Unrecognized or less common instruction
jz      short loc_495F0F  ; Unrecognized or less common instruction
cmp     [esi-32Ch], ebx  ; Unrecognized or less common instruction
jz      short loc_495F0F  ; Unrecognized or less common instruction
mov     edx, [esi-1DCh]  ; Move data between registers or between register and memory
lea     eax, [esi-1DCh]  ; Unrecognized or less common instruction
cmp     edx, ebx  ; Unrecognized or less common instruction
jz      short loc_495F0F  ; Unrecognized or less common instruction
fld     [esp+24h+arg_0]  ; Unrecognized or less common instruction
mov     edx, [esi]  ; Move data between registers or between register and memory
mov     dword ptr [esp+24h+var_18+4], ebx  ; Move data between registers or between register and memory
fmul    [esp+24h+arg_4]  ; Unrecognized or less common instruction
mov     dword ptr [esp+24h+var_18], edx  ; Move data between registers or between register and memory
mov     dword ptr [esp+24h+var_10+4], ebx  ; Move data between registers or between register and memory
fild    [esp+24h+var_18]  ; Unrecognized or less common instruction
fmul    st, st(1)  ; Unrecognized or less common instruction
fistp   qword ptr [esp+24h+var_8]  ; Unrecognized or less common instruction
mov     edx, [esp+24h+var_8]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
mov     edx, [esi-4]  ; Move data between registers or between register and memory
mov     dword ptr [esp+28h+var_10], edx  ; Move data between registers or between register and memory
fild    [esp+28h+var_10]  ; Unrecognized or less common instruction
fmul    st, st(1)  ; Unrecognized or less common instruction
fistp   qword ptr [esp+28h+var_8]  ; Unrecognized or less common instruction
mov     edx, [esp+28h+var_8]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
lea     edx, [esi-0A0h]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
fstp    st  ; Unrecognized or less common instruction
call    sub_495C10  ; Call a procedure
add     esp, 14h  ; Unrecognized or less common instruction
mov     eax, dword_5CA150  ; Move data between registers or between register and memory
inc     edi  ; Unrecognized or less common instruction
add     esi, 364h  ; Unrecognized or less common instruction
cmp     edi, eax  ; Unrecognized or less common instruction
jl      short loc_495E9F  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
pop     edi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === MusicUpdateVolume_004158E0.asm ===
; This is an assembly file for MusicUpdateVolume located at address 004158E0
; Assembly for MusicUpdateVolume
; Address: 004158E0
sub     esp, 18h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    sub_4062D0  ; Call a procedure
push    ecx  ; Push register value onto the stack
fstp    [esp+24h+var_24]  ; Unrecognized or less common instruction
call    sub_4062D0  ; Call a procedure
push    ecx  ; Push register value onto the stack
fstp    [esp+28h+var_28]  ; Unrecognized or less common instruction
call    MusicSetVolume  ; Call a procedure
call    sub_4062C0  ; Call a procedure
fstp    [esp+28h+var_24]  ; Unrecognized or less common instruction
add     esp, 4  ; Unrecognized or less common instruction
call    MusicSetSfxVolume  ; Call a procedure
mov     eax, [esp+24h+arg_0]  ; Move data between registers or between register and memory
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+24h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     [esp+20h+var_18], 1  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === PhysicsObjLoad_004EE030.asm ===
; This is an assembly file for PhysicsObjLoad located at address 004EE030
; Assembly for PhysicsObjLoad
; Address: 004EE030
mov     eax, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    offset sub_4EE050  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B1420  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === PhysicsObjTypeRead_004EDFE0.asm ===
; This is an assembly file for PhysicsObjTypeRead located at address 004EDFE0
; Assembly for PhysicsObjTypeRead
; Address: 004EDFE0
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, [esp+8+Str]  ; Move data between registers or between register and memory
push    offset SubStr  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    _strstr  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4EE016  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4EE019  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aPhysicsobjtype  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4EE027  ; Unconditional jump to a label or address


; === PlayerXPHit_00416D80.asm ===
; This is an assembly file for PlayerXPHit located at address 00416D80
; Assembly for PlayerXPHit
; Address: 00416D80
mov     eax, dword_57BABC  ; Move data between registers or between register and memory
mov     al, [eax+0E1h]  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === QFileOpen_004B1510.asm ===
; This is an assembly file for QFileOpen located at address 004B1510
; Assembly for QFileOpen
; Address: 004B1510
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B1620  ; Call a procedure
mov     edi, dword ptr [esp+14h+ArgList]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    offset byte_9435B0  ; Push register value onto the stack
mov     ebp, eax  ; Move data between registers or between register and memory
call    sub_4B1020  ; Call a procedure
push    offset byte_9435B0  ; Push register value onto the stack
mov     ebx, eax  ; Move data between registers or between register and memory
call    sub_4B11A0  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 14h  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jle     short loc_4B15BD  ; Unrecognized or less common instruction
cmp     esi, 5  ; Unrecognized or less common instruction
jge     short loc_4B15BD  ; Unrecognized or less common instruction
lea     eax, ds:0[esi*8]  ; Unrecognized or less common instruction
sub     eax, esi  ; Unrecognized or less common instruction
lea     edx, [eax+eax*4]  ; Unrecognized or less common instruction
shl     edx, 2  ; Unrecognized or less common instruction
mov     eax, dword_943708[edx]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B15CD  ; Unrecognized or less common instruction
mov     cl, byte_9435B0  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
test    cl, cl  ; Unrecognized or less common instruction
jz      short loc_4B1580  ; Unrecognized or less common instruction
cmp     cl, 3Ah  ; Unrecognized or less common instruction
jz      short loc_4B1580  ; Unrecognized or less common instruction
mov     cl, byte_9435B1[eax]  ; Move data between registers or between register and memory
inc     eax  ; Unrecognized or less common instruction
test    cl, cl  ; Unrecognized or less common instruction
jnz     short loc_4B1570  ; Unrecognized or less common instruction
lea     ecx, byte_9435B1[eax]  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    dword_9436B8[edx]  ; Call a procedure
mov     edx, eax  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    edx, edx  ; Unrecognized or less common instruction
jnz     short loc_4B15E3  ; Unrecognized or less common instruction
test    ebx, ebx  ; Unrecognized or less common instruction
jz      short loc_4B160C  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    offset byte_9435B0  ; Push register value onto the stack
call    sub_4B1020  ; Call a procedure
push    offset byte_9435B0  ; Push register value onto the stack
mov     ebx, eax  ; Move data between registers or between register and memory
call    sub_4B11A0  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 10h  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jg      short loc_4B1546  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aIllegalDeviceN  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4B15CB  ; Unconditional jump to a label or address
push    esi  ; Push register value onto the stack
call    sub_4B1DE0  ; Call a procedure
push    eax  ; Push register value onto the stack
push    offset aDeviceNotPrese  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
jmp     short loc_4B15E1  ; Unconditional jump to a label or address
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     [edx], esi  ; Move data between registers or between register and memory
lea     ebx, [edx+18h]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
mov     eax, edx  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === QTaskHashTableSet_004BAAC0.asm ===
; This is an assembly file for QTaskHashTableSet located at address 004BAAC0
; Assembly for QTaskHashTableSet
; Address: 004BAAC0
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    1  ; Push register value onto the stack
call    QhashInit  ; Call a procedure
push    4  ; Push register value onto the stack
push    1Ch  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
mov     ecx, 7  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     edi, esi  ; Move data between registers or between register and memory
rep stosd  ; Unrecognized or less common instruction
mov     eax, dword ptr [esp+14h+ArgList]  ; Move data between registers or between register and memory
mov     ecx, dword_A43E88  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    SymbolCheck  ; Call a procedure
mov     edx, [esp+20h+arg_4]  ; Move data between registers or between register and memory
mov     ecx, [esp+20h+arg_C]  ; Move data between registers or between register and memory
mov     [esi+14h], eax  ; Move data between registers or between register and memory
mov     eax, [esp+20h+arg_8]  ; Move data between registers or between register and memory
mov     [esi+10h], edx  ; Move data between registers or between register and memory
mov     edx, [esp+20h+arg_10]  ; Move data between registers or between register and memory
mov     [esi+18h], eax  ; Move data between registers or between register and memory
mov     eax, [esp+20h+arg_14]  ; Move data between registers or between register and memory
mov     [esi+0Ch], ecx  ; Move data between registers or between register and memory
mov     ecx, [esp+20h+arg_18]  ; Move data between registers or between register and memory
add     esp, 18h  ; Unrecognized or less common instruction
mov     [esi], edx  ; Move data between registers or between register and memory
mov     [esi+4], eax  ; Move data between registers or between register and memory
mov     [esi+8], ecx  ; Move data between registers or between register and memory
call    QhashReset  ; Call a procedure
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === QhashInit_004B0D60.asm ===
; This is an assembly file for QhashInit located at address 004B0D60
; Assembly for QhashInit
; Address: 004B0D60
mov     eax, dword_A960E0  ; Move data between registers or between register and memory
mov     cl, byte_9422FD  ; Move data between registers or between register and memory
mov     dl, [esp+arg_0]  ; Move data between registers or between register and memory
dec     eax  ; Unrecognized or less common instruction
mov     dword_A960E0, eax  ; Move data between registers or between register and memory
mov     byte_9422FD, dl  ; Move data between registers or between register and memory
mov     byte_9422E8[eax], cl  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === QhashReset_004B0D90.asm ===
; This is an assembly file for QhashReset located at address 004B0D90
; Assembly for QhashReset
; Address: 004B0D90
mov     eax, dword_A960E0  ; Move data between registers or between register and memory
mov     cl, byte_9422E8[eax]  ; Move data between registers or between register and memory
inc     eax  ; Unrecognized or less common instruction
mov     byte_9422FD, cl  ; Move data between registers or between register and memory
mov     dword_A960E0, eax  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === QscCompile_004B8410.asm ===
; This is an assembly file for QscCompile located at address 004B8410
; Assembly for QscCompile
; Address: 004B8410
sub     esp, 104h  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
mov     ebp, dword ptr [esp+10Ch+ArgList]  ; Move data between registers or between register and memory
push    ebp  ; Push register value onto the stack
call    sub_4B5B60  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4B859E  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
lea     eax, [esp+110h+var_104]  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    ResourceLoad  ; Call a procedure
push    4  ; Push register value onto the stack
push    94h  ; Push register value onto the stack
mov     esi, eax  ; Move data between registers or between register and memory
call    MemoryAlloc  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
mov     ecx, 25h  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     edi, ebx  ; Move data between registers or between register and memory
rep stosd  ; Unrecognized or less common instruction
mov     [ebx+80h], esi  ; Move data between registers or between register and memory
mov     ecx, [esp+124h+var_104]  ; Move data between registers or between register and memory
mov     [ebx+84h], ecx  ; Move data between registers or between register and memory
mov     edi, ebp  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
mov     [ebx+88h], eax  ; Move data between registers or between register and memory
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     edx, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, edx  ; Move data between registers or between register and memory
lea     edx, [esp+124h+Str1]  ; Unrecognized or less common instruction
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
mov     edi, ebp  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+124h+Str1]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
call    sub_4B1E90  ; Call a procedure
mov     edx, dword_547290  ; Move data between registers or between register and memory
mov     edi, ebp  ; Move data between registers or between register and memory
mov     [eax], edx  ; Move data between registers or between register and memory
mov     cl, byte_547294  ; Move data between registers or between register and memory
mov     [eax+4], cl  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edx, [esp+130h+var_100]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+130h+var_100]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
call    sub_4B1E90  ; Call a procedure
mov     edx, dword_547288  ; Move data between registers or between register and memory
mov     [eax], edx  ; Move data between registers or between register and memory
mov     cl, byte_54728C  ; Move data between registers or between register and memory
lea     edx, [esp+13Ch+Str1]  ; Unrecognized or less common instruction
mov     [eax+4], cl  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
lea     eax, [esp+140h+var_100]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
lea     ecx, [esp+144h+var_100]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QvmParse  ; Call a procedure
add     esp, 38h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
jnz     short loc_4B858A  ; Unrecognized or less common instruction
lea     edx, [esp+10Ch+var_100]  ; Unrecognized or less common instruction
lea     eax, [esp+10Ch+Str1]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    QvmAssemble  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B8573  ; Unrecognized or less common instruction
lea     ecx, [esp+10Ch+var_100]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
push    ebx  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    offset aAnErrorOccured  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
push    ebp  ; Push register value onto the stack
push    offset aAnErrorOccured  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 104h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === QtaskUpdateList_00401B20.asm ===
; This is an assembly file for QtaskUpdateList located at address 00401B20
; Assembly for QtaskUpdateList
; Address: 00401B20
mov     ecx, [esp+arg_0]  ; Move data between registers or between register and memory
mov     eax, [ecx]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_401B2D  ; Unrecognized or less common instruction
dec     dword ptr [eax+18h]  ; Unrecognized or less common instruction
mov     eax, dword_567C40  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
mov     esi, dword_567C4C  ; Move data between registers or between register and memory
dec     eax  ; Unrecognized or less common instruction
mov     ecx, [esi+ecx]  ; Move data between registers or between register and memory
mov     dword_567C40, eax  ; Move data between registers or between register and memory
cmp     ecx, eax  ; Unrecognized or less common instruction
jz      short loc_401B80  ; Unrecognized or less common instruction
mov     edx, dword_567C3C  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, dword_567C38  ; Move data between registers or between register and memory
mov     eax, [edx+eax*4]  ; Move data between registers or between register and memory
imul    eax, dword_567C48  ; Unrecognized or less common instruction
add     eax, edi  ; Unrecognized or less common instruction
mov     edi, [edx+ecx*4]  ; Move data between registers or between register and memory
mov     esi, [esi+eax]  ; Move data between registers or between register and memory
mov     ebx, [edx+esi*4]  ; Move data between registers or between register and memory
mov     [edx+ecx*4], ebx  ; Move data between registers or between register and memory
mov     edx, dword_567C3C  ; Move data between registers or between register and memory
mov     [edx+esi*4], edi  ; Move data between registers or between register and memory
mov     edx, dword_567C4C  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
mov     [edx+eax], ecx  ; Move data between registers or between register and memory
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === QtaskUpdate_004F0E90.asm ===
; This is an assembly file for QtaskUpdate located at address 004F0E90
; Assembly for QtaskUpdate
; Address: 004F0E90
mov     eax, dword_A758A4  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4F0EA2  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_401780  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
mov     esi, offset dword_A71890  ; Move data between registers or between register and memory
mov     eax, [esi]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4F0EBD  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    QtaskUpdateList  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
mov     dword ptr [esi], 0  ; Move data between registers or between register and memory
add     esi, 4  ; Unrecognized or less common instruction
cmp     esi, offset dword_A75890  ; Unrecognized or less common instruction
jl      short loc_4F0EA8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === QvmAssemble_004BB270.asm ===
; This is an assembly file for QvmAssemble located at address 004BB270
; Assembly for QvmAssemble
; Address: 004BB270
sub     esp, 644h  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+64Ch+arg_0]  ; Move data between registers or between register and memory
xor     ebp, ebp  ; XOR operation, usually for zeroing a register
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    offset asc_547970  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B08A0  ; Call a procedure
add     esp, 14h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4BB2B3  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset a0qvmbinTmp  ; Push register value onto the stack
lea     eax, [esp+654h+Str1]  ; Unrecognized or less common instruction
push    104h  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B0A80  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
jmp     short loc_4BB2F3  ; Unconditional jump to a label or address
mov     ecx, dword_54794C  ; Move data between registers or between register and memory
mov     edx, dword_547950  ; Move data between registers or between register and memory
mov     eax, dword_547954  ; Move data between registers or between register and memory
mov     dword ptr [esp+64Ch+Str1], ecx  ; Move data between registers or between register and memory
mov     ecx, dword_547958  ; Move data between registers or between register and memory
mov     [esp+64Ch+var_550], edx  ; Move data between registers or between register and memory
mov     dl, byte_54795C  ; Move data between registers or between register and memory
mov     [esp+64Ch+var_54C], eax  ; Move data between registers or between register and memory
mov     [esp+64Ch+var_548], ecx  ; Move data between registers or between register and memory
mov     [esp+64Ch+var_544], dl  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    offset aW  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     dword_A43ED0, ebp  ; Move data between registers or between register and memory
call    QFileOpen  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
cmp     ebx, ebp  ; Unrecognized or less common instruction
mov     [esp+650h+var_644], ebx  ; Move data between registers or between register and memory
jz      loc_4BBBFF  ; Unrecognized or less common instruction
mov     esi, [esp+650h+arg_4]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_4B5B60  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4BBBCF  ; Unrecognized or less common instruction
lea     eax, [esp+654h+var_5C8]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    ResourceLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
push    offset aInitialisingPa  ; Push register value onto the stack
mov     dword ptr [esp+660h+var_5D0], esi  ; Move data between registers or between register and memory
call    LogAdd  ; Call a procedure
lea     ecx, [esp+660h+var_634]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4C0660  ; Call a procedure
push    1  ; Push register value onto the stack
push    1  ; Push register value onto the stack
lea     edx, [esp+66Ch+var_634]  ; Unrecognized or less common instruction
push    offset aTNR  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    2  ; Push register value onto the stack
lea     eax, [esp+67Ch+var_634]  ; Unrecognized or less common instruction
push    offset asc_547914  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    0Ah  ; Push register value onto the stack
lea     ecx, [esp+68Ch+var_634]  ; Unrecognized or less common instruction
push    offset aAZaZAZaZ09  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_634]  ; Unrecognized or less common instruction
push    1  ; Push register value onto the stack
push    5  ; Push register value onto the stack
push    offset a0909  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    6  ; Push register value onto the stack
lea     eax, [esp+66Ch+var_634]  ; Unrecognized or less common instruction
push    offset asc_5478E4  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    7  ; Push register value onto the stack
lea     ecx, [esp+67Ch+var_634]  ; Unrecognized or less common instruction
push    offset asc_5478E0  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    8  ; Push register value onto the stack
lea     edx, [esp+68Ch+var_634]  ; Unrecognized or less common instruction
push    offset asc_5478DC  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
lea     eax, [esp+654h+var_634]  ; Unrecognized or less common instruction
push    1  ; Push register value onto the stack
push    3  ; Push register value onto the stack
push    offset a0x09aFaF  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    0Bh  ; Push register value onto the stack
lea     ecx, [esp+66Ch+var_634]  ; Unrecognized or less common instruction
push    offset a09aZaZ  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    1  ; Push register value onto the stack
push    0Ch  ; Push register value onto the stack
lea     edx, [esp+67Ch+var_634]  ; Unrecognized or less common instruction
push    offset a09aZaZ_0  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
push    ebp  ; Push register value onto the stack
push    9  ; Push register value onto the stack
lea     eax, [esp+68Ch+var_634]  ; Unrecognized or less common instruction
push    offset aAZaZAZaZ09_0  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    4  ; Push register value onto the stack
lea     ecx, [esp+65Ch+var_634]  ; Unrecognized or less common instruction
push    offset a09  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4C0680  ; Call a procedure
mov     edx, [esp+664h+var_5C8]  ; Move data between registers or between register and memory
lea     eax, [esp+664h+var_574]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4BF1C0  ; Call a procedure
lea     ecx, [esp+670h+var_574]  ; Unrecognized or less common instruction
lea     edx, [esp+670h+var_634]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
lea     eax, [esp+674h+var_588]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4C0720  ; Call a procedure
mov     ecx, 14h  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edi, [esp+67Ch+var_620]  ; Unrecognized or less common instruction
lea     edx, [esp+67Ch+var_450]  ; Unrecognized or less common instruction
rep stosd  ; Unrecognized or less common instruction
lea     ecx, [esp+67Ch+var_588]  ; Unrecognized or less common instruction
lea     eax, [esp+67Ch+var_5FC]  ; Unrecognized or less common instruction
mov     [esp+67Ch+var_608], ecx  ; Move data between registers or between register and memory
lea     ecx, [esp+67Ch+var_600]  ; Unrecognized or less common instruction
mov     [esp+67Ch+var_60C], edx  ; Move data between registers or between register and memory
mov     [esp+67Ch+var_600], eax  ; Move data between registers or between register and memory
mov     [esp+67Ch+var_5F8], ecx  ; Move data between registers or between register and memory
lea     edx, [esp+67Ch+var_5E4]  ; Unrecognized or less common instruction
lea     eax, [esp+67Ch+var_5E8]  ; Unrecognized or less common instruction
lea     ecx, [esp+67Ch+var_5F0]  ; Unrecognized or less common instruction
mov     [esp+67Ch+var_5E8], edx  ; Move data between registers or between register and memory
mov     [esp+67Ch+var_5E0], eax  ; Move data between registers or between register and memory
mov     [esp+67Ch+var_5F4], ecx  ; Move data between registers or between register and memory
lea     edx, [esp+67Ch+var_5F4]  ; Unrecognized or less common instruction
lea     eax, [esp+67Ch+var_5D8]  ; Unrecognized or less common instruction
lea     ecx, [esp+67Ch+var_5DC]  ; Unrecognized or less common instruction
push    12CCBh  ; Push register value onto the stack
mov     [esp+680h+var_638], ebp  ; Move data between registers or between register and memory
mov     [esp+680h+var_610], ebx  ; Move data between registers or between register and memory
mov     [esp+680h+var_620], ebp  ; Move data between registers or between register and memory
mov     [esp+680h+var_5FC], ebp  ; Move data between registers or between register and memory
mov     [esp+680h+var_5E4], ebp  ; Move data between registers or between register and memory
mov     [esp+680h+var_5EC], edx  ; Move data between registers or between register and memory
mov     [esp+680h+var_5F0], ebp  ; Move data between registers or between register and memory
mov     [esp+680h+var_5DC], eax  ; Move data between registers or between register and memory
mov     [esp+680h+var_5D4], ecx  ; Move data between registers or between register and memory
mov     [esp+680h+var_5D8], ebp  ; Move data between registers or between register and memory
call    sub_4C0360  ; Call a procedure
add     esp, 2Ch  ; Unrecognized or less common instruction
mov     [esp+654h+var_604], eax  ; Move data between registers or between register and memory
lea     ebx, [esp+654h+var_188]  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_628]  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4BD3F0  ; Call a procedure
lea     edi, [esp+664h+var_628]  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
add     esp, 10h  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
add     ebx, 8  ; Unrecognized or less common instruction
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
inc     ebp  ; Unrecognized or less common instruction
cmp     ebp, 31h  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
jl      short loc_4BB542  ; Unrecognized or less common instruction
lea     ecx, [esp+654h+Str1]  ; Unrecognized or less common instruction
push    offset aW  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QFileOpen  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
mov     [esp+654h+var_640], esi  ; Move data between registers or between register and memory
jz      loc_4BBA84  ; Unrecognized or less common instruction
push    offset aAssembling  ; Push register value onto the stack
call    LogAdd  ; Call a procedure
lea     edx, [esp+658h+var_588]  ; Unrecognized or less common instruction
lea     eax, [esp+658h+var_450]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
mov     [esp+660h+var_614], 2  ; Move data between registers or between register and memory
mov     [esp+660h+var_610], esi  ; Move data between registers or between register and memory
call    sub_4BB240  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4BB6E4  ; Unrecognized or less common instruction
mov     ebx, 1  ; Move data between registers or between register and memory
mov     eax, [esp+654h+var_61C]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jnz     loc_4BB6E4  ; Unrecognized or less common instruction
mov     eax, [esp+654h+var_18C]  ; Move data between registers or between register and memory
cmp     eax, 0Ah  ; Unrecognized or less common instruction
jnz     short loc_4BB620  ; Unrecognized or less common instruction
lea     ecx, [esp+654h+ArgList]  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_620]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4BAE00  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4BB6C4  ; Unrecognized or less common instruction
mov     ecx, [esp+654h+var_638]  ; Move data between registers or between register and memory
mov     [eax+14h], ebx  ; Move data between registers or between register and memory
mov     [eax+18h], ecx  ; Move data between registers or between register and memory
jmp     loc_4BB6C4  ; Unconditional jump to a label or address
cmp     eax, 0Bh  ; Unrecognized or less common instruction
jz      loc_4BB6C4  ; Unrecognized or less common instruction
cmp     eax, 9  ; Unrecognized or less common instruction
jnz     loc_4BB6C4  ; Unrecognized or less common instruction
mov     al, [esp+654h+ArgList]  ; Move data between registers or between register and memory
test    al, al  ; Unrecognized or less common instruction
jz      short loc_4BB65A  ; Unrecognized or less common instruction
lea     esi, [esp+654h+ArgList]  ; Unrecognized or less common instruction
movsx   edx, al  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    _toupper  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
mov     [esi], al  ; Move data between registers or between register and memory
mov     al, [esi+1]  ; Move data between registers or between register and memory
inc     esi  ; Unrecognized or less common instruction
test    al, al  ; Unrecognized or less common instruction
jnz     short loc_4BB644  ; Unrecognized or less common instruction
xor     edi, edi  ; XOR operation, usually for zeroing a register
lea     ebp, [esp+654h+var_188]  ; Unrecognized or less common instruction
mov     esi, ebp  ; Move data between registers or between register and memory
lea     eax, [esp+654h+ArgList]  ; Unrecognized or less common instruction
mov     dl, [eax]  ; Move data between registers or between register and memory
mov     cl, dl  ; Move data between registers or between register and memory
cmp     dl, [esi]  ; Unrecognized or less common instruction
jnz     short loc_4BB690  ; Unrecognized or less common instruction
test    cl, cl  ; Unrecognized or less common instruction
jz      short loc_4BB68C  ; Unrecognized or less common instruction
mov     dl, [eax+1]  ; Move data between registers or between register and memory
mov     cl, dl  ; Move data between registers or between register and memory
cmp     dl, [esi+1]  ; Unrecognized or less common instruction
jnz     short loc_4BB690  ; Unrecognized or less common instruction
add     eax, 2  ; Unrecognized or less common instruction
add     esi, 2  ; Unrecognized or less common instruction
test    cl, cl  ; Unrecognized or less common instruction
jnz     short loc_4BB66C  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
jmp     short loc_4BB695  ; Unconditional jump to a label or address
sbb     eax, eax  ; Unrecognized or less common instruction
sbb     eax, 0FFFFFFFFh  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4BB741  ; Unrecognized or less common instruction
inc     edi  ; Unrecognized or less common instruction
add     ebp, 8  ; Unrecognized or less common instruction
cmp     edi, 31h  ; Unrecognized or less common instruction
jl      short loc_4BB663  ; Unrecognized or less common instruction
lea     eax, [esp+654h+ArgList]  ; Unrecognized or less common instruction
lea     ecx, [esp+654h+var_620]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    offset aUnknownOpcodeS  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
mov     [esp+660h+var_61C], ebx  ; Move data between registers or between register and memory
call    sub_4BAF30  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_588]  ; Unrecognized or less common instruction
lea     eax, [esp+654h+var_450]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4BB240  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     loc_4BB5DC  ; Unrecognized or less common instruction
mov     ecx, [esp+654h+var_640]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
mov     eax, [esp+658h+var_61C]  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     loc_4BBA9E  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_5CC]  ; Unrecognized or less common instruction
lea     eax, [esp+654h+Str1]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    ResourcePackUnpack  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    ebx, ebx  ; Unrecognized or less common instruction
mov     dword ptr [esp+654h+var_63C], ebx  ; Move data between registers or between register and memory
jz      loc_4BBA9E  ; Unrecognized or less common instruction
mov     ecx, [esp+654h+var_638]  ; Move data between registers or between register and memory
mov     eax, [esp+654h+var_5CC]  ; Move data between registers or between register and memory
cmp     eax, ecx  ; Unrecognized or less common instruction
jz      short loc_4BB781  ; Unrecognized or less common instruction
push    offset aInternalErrorQ  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
jmp     short loc_4BB73F  ; Unconditional jump to a label or address
cmp     edi, 31h  ; Unrecognized or less common instruction
jge     loc_4BB6A6  ; Unrecognized or less common instruction
mov     edx, [esp+654h+var_614]  ; Move data between registers or between register and memory
lea     eax, [esp+654h+var_620]  ; Unrecognized or less common instruction
lea     ecx, [esp+654h+var_63C]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     dword ptr [esp+664h+var_63C], 0  ; Move data between registers or between register and memory
call    sub_4BD3F0  ; Call a procedure
mov     eax, [esp+664h+var_638]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+664h+var_63C]  ; Move data between registers or between register and memory
add     esp, 10h  ; Unrecognized or less common instruction
add     eax, ecx  ; Unrecognized or less common instruction
mov     [esp+654h+var_638], eax  ; Move data between registers or between register and memory
mov     [esp+654h+var_620], eax  ; Move data between registers or between register and memory
jmp     loc_4BB6C4  ; Unconditional jump to a label or address
push    offset aPatchingCode  ; Push register value onto the stack
call    LogAdd  ; Call a procedure
mov     edi, [esp+658h+var_600]  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     ebp, [edi]  ; Move data between registers or between register and memory
test    ebp, ebp  ; Unrecognized or less common instruction
mov     [esp+654h+var_640], ebp  ; Move data between registers or between register and memory
jz      loc_4BB83B  ; Unrecognized or less common instruction
mov     esi, [edi+8]  ; Move data between registers or between register and memory
mov     ebx, [esi]  ; Move data between registers or between register and memory
test    ebx, ebx  ; Unrecognized or less common instruction
jz      short loc_4BB809  ; Unrecognized or less common instruction
mov     eax, [edi+14h]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4BB7CA  ; Unrecognized or less common instruction
mov     edx, [esi+8]  ; Move data between registers or between register and memory
lea     eax, [edi+1Ch]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
lea     ecx, [esp+65Ch+var_620]  ; Unrecognized or less common instruction
push    offset aUnknownLabelSA  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4BAF30  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
mov     edx, [edi+18h]  ; Move data between registers or between register and memory
mov     eax, [esi+0Ch]  ; Move data between registers or between register and memory
mov     ebp, dword ptr [esp+654h+var_63C]  ; Move data between registers or between register and memory
sub     edx, eax  ; Unrecognized or less common instruction
mov     [esp+654h+var_628], edx  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     ecx, [esi+8]  ; Move data between registers or between register and memory
mov     dl, byte ptr [esp+eax+654h+var_628]  ; Move data between registers or between register and memory
add     ecx, eax  ; Unrecognized or less common instruction
inc     eax  ; Unrecognized or less common instruction
cmp     eax, 4  ; Unrecognized or less common instruction
mov     [ecx+ebp], dl  ; Move data between registers or between register and memory
jb      short loc_4BB7DC  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     esi, ebx  ; Move data between registers or between register and memory
mov     ebx, [ebx]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    ebx, ebx  ; Unrecognized or less common instruction
jnz     short loc_4BB7A9  ; Unrecognized or less common instruction
mov     ebp, [esp+654h+var_640]  ; Move data between registers or between register and memory
mov     ecx, [esp+654h+var_604]  ; Move data between registers or between register and memory
lea     eax, [edi+1Ch]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    SymbolRemove  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     edi, ebp  ; Move data between registers or between register and memory
mov     ebp, [ebp+0]  ; Move data between registers or between register and memory
add     esp, 10h  ; Unrecognized or less common instruction
mov     [esp+654h+var_640], ebp  ; Move data between registers or between register and memory
test    ebp, ebp  ; Unrecognized or less common instruction
jnz     loc_4BB7A0  ; Unrecognized or less common instruction
mov     ebx, dword ptr [esp+654h+var_63C]  ; Move data between registers or between register and memory
mov     esi, [esp+654h+var_5DC]  ; Move data between registers or between register and memory
mov     edi, [esi]  ; Move data between registers or between register and memory
test    edi, edi  ; Unrecognized or less common instruction
jz      short loc_4BB877  ; Unrecognized or less common instruction
mov     edx, [esi+0Ch]  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     [esp+654h+var_628], edx  ; Move data between registers or between register and memory
mov     ecx, [esi+8]  ; Move data between registers or between register and memory
mov     dl, byte ptr [esp+eax+654h+var_628]  ; Move data between registers or between register and memory
add     ecx, eax  ; Unrecognized or less common instruction
inc     eax  ; Unrecognized or less common instruction
cmp     eax, 4  ; Unrecognized or less common instruction
mov     [ecx+ebx], dl  ; Move data between registers or between register and memory
jb      short loc_4BB84E  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, [edi]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    edi, edi  ; Unrecognized or less common instruction
jnz     short loc_4BB845  ; Unrecognized or less common instruction
mov     al, 4Fh  ; Move data between registers or between register and memory
xor     ebp, ebp  ; XOR operation, usually for zeroing a register
mov     [esp+654h+var_5C3], al  ; Move data between registers or between register and memory
mov     [esp+654h+var_5C2], al  ; Move data between registers or between register and memory
mov     eax, [esp+654h+var_5F4]  ; Move data between registers or between register and memory
mov     [esp+654h+var_5C4], 4Ch  ; Move data between registers or between register and memory
mov     [esp+654h+var_5C1], 50h  ; Move data between registers or between register and memory
mov     [esp+654h+var_5C0], 8  ; Move data between registers or between register and memory
mov     [esp+654h+var_58C], ebp  ; Move data between registers or between register and memory
mov     [esp+654h+var_590], ebp  ; Move data between registers or between register and memory
mov     [esp+654h+var_5BC], 5  ; Move data between registers or between register and memory
mov     edx, [eax]  ; Move data between registers or between register and memory
xor     esi, esi  ; XOR operation, usually for zeroing a register
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
cmp     edx, ebp  ; Unrecognized or less common instruction
jz      short loc_4BB8E5  ; Unrecognized or less common instruction
lea     edi, [eax+8]  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
mov     eax, edx  ; Move data between registers or between register and memory
mov     edx, [edx]  ; Move data between registers or between register and memory
dec     ecx  ; Unrecognized or less common instruction
inc     ebx  ; Unrecognized or less common instruction
cmp     edx, ebp  ; Unrecognized or less common instruction
lea     esi, [esi+ecx+1]  ; Unrecognized or less common instruction
jnz     short loc_4BB8CB  ; Unrecognized or less common instruction
mov     eax, [esp+654h+var_5E8]  ; Move data between registers or between register and memory
lea     edx, ds:0[ebx*4]  ; Unrecognized or less common instruction
mov     [esp+654h+var_5B0], edx  ; Move data between registers or between register and memory
add     edx, 3Ch  ; Unrecognized or less common instruction
mov     [esp+654h+var_5B4], edx  ; Move data between registers or between register and memory
mov     [esp+654h+var_5B8], 3Ch  ; Move data between registers or between register and memory
mov     [esp+654h+var_5AC], esi  ; Move data between registers or between register and memory
add     edx, esi  ; Unrecognized or less common instruction
mov     esi, [eax]  ; Move data between registers or between register and memory
xor     ebp, ebp  ; XOR operation, usually for zeroing a register
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BB939  ; Unrecognized or less common instruction
lea     edi, [eax+8]  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
mov     eax, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
dec     ecx  ; Unrecognized or less common instruction
inc     ebx  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
lea     ebp, [ecx+ebp+1]  ; Unrecognized or less common instruction
jnz     short loc_4BB91F  ; Unrecognized or less common instruction
lea     eax, ds:0[ebx*4]  ; Unrecognized or less common instruction
mov     [esp+654h+var_5A8], edx  ; Move data between registers or between register and memory
add     edx, eax  ; Unrecognized or less common instruction
mov     [esp+654h+var_59C], ebp  ; Move data between registers or between register and memory
add     ebp, edx  ; Unrecognized or less common instruction
lea     ecx, [esp+654h+var_5C4]  ; Unrecognized or less common instruction
mov     [esp+654h+var_598], ebp  ; Move data between registers or between register and memory
mov     ebp, [esp+654h+var_644]  ; Move data between registers or between register and memory
mov     [esp+654h+var_5A0], eax  ; Move data between registers or between register and memory
mov     eax, [esp+654h+var_638]  ; Move data between registers or between register and memory
push    3Ch  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
mov     [esp+660h+var_5A4], edx  ; Move data between registers or between register and memory
mov     [esp+660h+var_594], eax  ; Move data between registers or between register and memory
call    sub_4B1700  ; Call a procedure
mov     edi, [esp+660h+var_5F4]  ; Move data between registers or between register and memory
mov     [esp+660h+var_644], 0  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     esi, [edi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BB9D0  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_644]  ; Unrecognized or less common instruction
push    4  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B1700  ; Call a procedure
add     edi, 8  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
add     esp, 0Ch  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
mov     eax, [esp+654h+var_644]  ; Move data between registers or between register and memory
mov     edi, esi  ; Move data between registers or between register and memory
not     ecx  ; Unrecognized or less common instruction
dec     ecx  ; Unrecognized or less common instruction
lea     ecx, [eax+ecx+1]  ; Unrecognized or less common instruction
mov     [esp+654h+var_644], ecx  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BB99B  ; Unrecognized or less common instruction
mov     edi, [esp+654h+var_5F4]  ; Move data between registers or between register and memory
mov     esi, [edi]  ; Move data between registers or between register and memory
mov     edx, edi  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BB9F9  ; Unrecognized or less common instruction
add     edx, 8  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
mov     edi, edx  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B1700  ; Call a procedure
mov     edx, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BB9D8  ; Unrecognized or less common instruction
mov     edx, [esp+654h+var_5E8]  ; Move data between registers or between register and memory
mov     [esp+654h+var_644], 0  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
mov     esi, [edx]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BBA42  ; Unrecognized or less common instruction
lea     edx, [esp+654h+var_644]  ; Unrecognized or less common instruction
push    4  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B1700  ; Call a procedure
add     edi, 8  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
add     esp, 0Ch  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
mov     eax, [esp+654h+var_644]  ; Move data between registers or between register and memory
mov     edi, esi  ; Move data between registers or between register and memory
not     ecx  ; Unrecognized or less common instruction
dec     ecx  ; Unrecognized or less common instruction
lea     ecx, [eax+ecx+1]  ; Unrecognized or less common instruction
mov     [esp+654h+var_644], ecx  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BBA0D  ; Unrecognized or less common instruction
mov     edx, [esp+654h+var_5E8]  ; Move data between registers or between register and memory
mov     esi, [edx]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BBA69  ; Unrecognized or less common instruction
add     edx, 8  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
mov     edi, edx  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B1700  ; Call a procedure
mov     edx, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BBA48  ; Unrecognized or less common instruction
mov     edx, [esp+654h+var_638]  ; Move data between registers or between register and memory
mov     esi, dword ptr [esp+654h+var_63C]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B1700  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4B1A30  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
jmp     short loc_4BBAA2  ; Unconditional jump to a label or address
lea     eax, [esp+654h+Str1]  ; Unrecognized or less common instruction
lea     ecx, [esp+654h+var_620]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    offset aFailedToCreate  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4BAF30  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     ebp, [esp+654h+var_644]  ; Move data between registers or between register and memory
push    offset aCleaningUp  ; Push register value onto the stack
call    LogAdd  ; Call a procedure
mov     edi, [esp+658h+var_5F4]  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     esi, [edi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BBAD0  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     edi, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BBAB9  ; Unrecognized or less common instruction
mov     edi, [esp+654h+var_5E8]  ; Move data between registers or between register and memory
mov     esi, [edi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BBAF1  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     edi, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BBADA  ; Unrecognized or less common instruction
mov     edi, [esp+654h+var_5DC]  ; Move data between registers or between register and memory
mov     esi, [edi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BBB12  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     edi, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BBAFB  ; Unrecognized or less common instruction
mov     ebx, [esp+654h+var_600]  ; Move data between registers or between register and memory
mov     eax, [ebx]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
mov     [esp+654h+var_640], eax  ; Move data between registers or between register and memory
jz      short loc_4BBB6B  ; Unrecognized or less common instruction
mov     edi, [ebx+8]  ; Move data between registers or between register and memory
mov     esi, [edi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4BBB40  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     edi, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_4BBB29  ; Unrecognized or less common instruction
mov     eax, [esp+654h+var_604]  ; Move data between registers or between register and memory
lea     edx, [ebx+1Ch]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    SymbolRemove  ; Call a procedure
push    ebx  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    ebx  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
mov     ebx, [esp+664h+var_640]  ; Move data between registers or between register and memory
add     esp, 10h  ; Unrecognized or less common instruction
mov     eax, [ebx]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
mov     [esp+654h+var_640], eax  ; Move data between registers or between register and memory
jnz     short loc_4BBB20  ; Unrecognized or less common instruction
mov     ecx, [esp+654h+var_604]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    sub_4C03C0  ; Call a procedure
lea     edx, [esp+658h+Str1]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
lea     eax, [esp+65Ch+var_574]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4BEFC0  ; Call a procedure
lea     ecx, [esp+660h+var_588]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4C0750  ; Call a procedure
lea     edx, [esp+664h+var_634]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_4F1D80  ; Call a procedure
mov     eax, dword ptr [esp+668h+var_5D0]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    ResourceFlush  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
mov     eax, dword_A43ED0  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
add     esp, 644h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
lea     ecx, [esp+658h+var_620]  ; Unrecognized or less common instruction
push    offset aFailedToLoadAs  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4BAF30  ; Call a procedure
mov     ebp, [esp+660h+var_644]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
mov     eax, dword_A43ED0  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
add     esp, 644h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
lea     edx, [esp+654h+var_620]  ; Unrecognized or less common instruction
push    offset aFailedToOpenFi  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_4BAF30  ; Call a procedure
mov     eax, dword_A43ED0  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
pop     ebx  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
add     esp, 644h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === QvmCompile_004B85B0.asm ===
; This is an assembly file for QvmCompile located at address 004B85B0
; Assembly for QvmCompile
; Address: 004B85B0
sub     esp, 854h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+858h+ArgList]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
xor     edi, edi  ; XOR operation, usually for zeroing a register
mov     dword_A965A4, edi  ; Move data between registers or between register and memory
mov     dword_A965A8, edi  ; Move data between registers or between register and memory
mov     eax, [esi+8Ch]  ; Move data between registers or between register and memory
cmp     eax, edi  ; Unrecognized or less common instruction
jz      short loc_4B8611  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4BD080  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4B86CE  ; Unrecognized or less common instruction
mov     eax, [esi+8Ch]  ; Move data between registers or between register and memory
add     eax, 268h  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    offset aErrorInQvmProg  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     dword_A965A4, edi  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 854h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
lea     ecx, [esp+85Ch+var_800]  ; Unrecognized or less common instruction
push    800h  ; Push register value onto the stack
lea     edx, [esp+860h+var_850]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
lea     eax, [esp+864h+var_830]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    ScriptBufInit  ; Call a procedure
mov     ecx, [esi+84h]  ; Move data between registers or between register and memory
mov     edx, [esi+80h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
lea     eax, [esp+870h+var_850]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4BF1C0  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
cmp     dword_A965A0, edi  ; Unrecognized or less common instruction
jz      short loc_4B8655  ; Unrecognized or less common instruction
cmp     dword_A965A4, edi  ; Unrecognized or less common instruction
jnz     short loc_4B86C1  ; Unrecognized or less common instruction
lea     ecx, [esp+85Ch+var_828]  ; Unrecognized or less common instruction
lea     edx, [esp+85Ch+var_830]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
mov     dword ptr [esp+864h+var_854], edi  ; Move data between registers or between register and memory
call    sub_4BFC70  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B86C1  ; Unrecognized or less common instruction
lea     eax, [esp+85Ch+var_854]  ; Unrecognized or less common instruction
lea     ecx, [esp+85Ch+var_830]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4BF1F0  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B86A5  ; Unrecognized or less common instruction
mov     edx, dword ptr [esp+85Ch+var_854]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    sub_4BFA80  ; Call a procedure
mov     eax, dword ptr [esp+860h+var_854]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4BF8F0  ; Call a procedure
mov     eax, dword_A965A8  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
cmp     eax, edi  ; Unrecognized or less common instruction
jz      short loc_4B8645  ; Unrecognized or less common instruction
cmp     dword_A96598, edi  ; Unrecognized or less common instruction
jz      short loc_4B86BB  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset aAnErrorOccured_0  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
mov     dword_A965A8, edi  ; Move data between registers or between register and memory
lea     ecx, [esp+85Ch+var_850]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4BEFC0  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
mov     dword_A965A4, edi  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 854h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === QvmLoad_004B80B0.asm ===
; This is an assembly file for QvmLoad located at address 004B80B0
; Assembly for QvmLoad
; Address: 004B80B0
sub     esp, 11Ch  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
push    edi  ; Push register value onto the stack
mov     [esp+12Ch+var_118], ebx  ; Move data between registers or between register and memory
mov     [esp+12Ch+var_11C], ebx  ; Move data between registers or between register and memory
call    sub_48F1D0  ; Call a procedure
mov     ebp, [esp+12Ch+arg_0]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4B81B9  ; Unrecognized or less common instruction
mov     edi, ebp  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edx, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_4B1E90  ; Call a procedure
mov     edx, dword_547290  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     [eax], edx  ; Move data between registers or between register and memory
mov     cl, byte_547294  ; Move data between registers or between register and memory
mov     [eax+4], cl  ; Move data between registers or between register and memory
call    sub_48F340  ; Call a procedure
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B8161  ; Unrecognized or less common instruction
lea     edx, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_4B5B60  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4B81DC  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
lea     eax, [esp+130h+Str1]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4BD220  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
cmp     eax, ebx  ; Unrecognized or less common instruction
mov     [esp+12Ch+var_11C], eax  ; Move data between registers or between register and memory
jnz     loc_4B81E9  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     ebx  ; Pop value from stack into register
add     esp, 11Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
lea     ecx, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4B5B60  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B81B9  ; Unrecognized or less common instruction
lea     edx, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
lea     eax, [esp+12Ch+Frequency]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B6440  ; Call a procedure
lea     ecx, [esp+134h+Duration]  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4B6440  ; Call a procedure
lea     edx, [esp+13Ch+Duration]  ; Unrecognized or less common instruction
lea     eax, [esp+13Ch+Frequency]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B6490  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jl      short loc_4B81B9  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
lea     ecx, [esp+130h+Str1]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4BD220  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
cmp     eax, ebx  ; Unrecognized or less common instruction
mov     [esp+12Ch+var_11C], eax  ; Move data between registers or between register and memory
jnz     short loc_4B81E9  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
call    sub_4B5B60  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B81DC  ; Unrecognized or less common instruction
lea     edx, [esp+12Ch+var_114]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    ResourceLoad  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
cmp     eax, ebx  ; Unrecognized or less common instruction
mov     [esp+12Ch+var_118], eax  ; Move data between registers or between register and memory
jnz     short loc_4B81E9  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     ebx  ; Pop value from stack into register
add     esp, 11Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    4  ; Push register value onto the stack
push    94h  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
mov     ecx, 25h  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     edi, ebx  ; Move data between registers or between register and memory
rep stosd  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4B8A10  ; Call a procedure
mov     eax, [esp+138h+var_11C]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     loc_4B838C  ; Unrecognized or less common instruction
mov     ecx, [esp+12Ch+var_118]  ; Move data between registers or between register and memory
mov     edi, ebp  ; Move data between registers or between register and memory
mov     [ebx+80h], ecx  ; Move data between registers or between register and memory
mov     edx, [esp+12Ch+var_114]  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
mov     [ebx+84h], edx  ; Move data between registers or between register and memory
mov     [ebx+88h], eax  ; Move data between registers or between register and memory
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
call    sub_48F1D0  ; Call a procedure
test    eax, eax  ; Unrecognized or less common instruction
jz      loc_4B83BA  ; Unrecognized or less common instruction
mov     edi, ebp  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
lea     edx, [esp+12Ch+var_80]  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
lea     ecx, [esp+12Ch+var_80]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
call    sub_4B1E90  ; Call a procedure
mov     edx, dword_547288  ; Move data between registers or between register and memory
mov     [eax], edx  ; Move data between registers or between register and memory
mov     cl, byte_54728C  ; Move data between registers or between register and memory
lea     edx, [esp+138h+Str1]  ; Unrecognized or less common instruction
mov     [eax+4], cl  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
lea     eax, [esp+13Ch+var_80]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
lea     ecx, [esp+140h+var_80]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QvmParse  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     loc_4B836B  ; Unrecognized or less common instruction
lea     edx, [esp+12Ch+var_80]  ; Unrecognized or less common instruction
lea     eax, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    QvmAssemble  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B8350  ; Unrecognized or less common instruction
lea     ecx, [esp+12Ch+var_80]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
push    ebx  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
push    4  ; Push register value onto the stack
push    94h  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     ecx, 25h  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
lea     edx, [esp+140h+Str1]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
rep stosd  ; Unrecognized or less common instruction
call    sub_4BD220  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B838C  ; Unrecognized or less common instruction
lea     ecx, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    offset aFailedToLoadQv  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
push    ebx  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 11Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    ebp  ; Push register value onto the stack
push    offset aAnErrorOccured  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
mov     eax, ebx  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 11Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
push    ebp  ; Push register value onto the stack
push    offset aAnErrorOccured  ; Push register value onto the stack
call    sub_4B7E10  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 11Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
mov     byte ptr [ebx+90h], 1  ; Move data between registers or between register and memory
mov     [ebx+8Ch], eax  ; Move data between registers or between register and memory
lea     edi, [esp+12Ch+Str1]  ; Unrecognized or less common instruction
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
mov     eax, ebx  ; Move data between registers or between register and memory
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 11Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === QvmParse_004BBCB0.asm ===
; This is an assembly file for QvmParse located at address 004BBCB0
; Assembly for QvmParse
; Address: 004BBCB0
sub     esp, 864h  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
mov     ebp, dword ptr [esp+86Ch+ArgList]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4B1AC0  ; Call a procedure
mov     edx, 20202020h  ; Move data between registers or between register and memory
lea     eax, [esp+878h+var_858]  ; Unrecognized or less common instruction
mov     dword_A442D0, edx  ; Move data between registers or between register and memory
lea     ecx, [esp+878h+var_85C]  ; Unrecognized or less common instruction
mov     dword_A442D4, edx  ; Move data between registers or between register and memory
xor     ebx, ebx  ; XOR operation, usually for zeroing a register
mov     dword_A442D8, edx  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     dword_A442DC, edx  ; Move data between registers or between register and memory
mov     [esp+874h+var_85C], eax  ; Move data between registers or between register and memory
mov     dword_A442E0, edx  ; Move data between registers or between register and memory
mov     [esp+874h+var_854], ecx  ; Move data between registers or between register and memory
mov     byte_A442E4, dl  ; Move data between registers or between register and memory
mov     [esp+874h+var_858], ebx  ; Move data between registers or between register and memory
mov     dword_A442C8, ebx  ; Move data between registers or between register and memory
mov     byte_A442E4, bl  ; Move data between registers or between register and memory
xor     edi, edi  ; XOR operation, usually for zeroing a register
mov     esi, offset unk_A43EE0  ; Move data between registers or between register and memory
lea     eax, [esp+874h+var_864]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    sub_4BD3F0  ; Call a procedure
mov     edx, esi  ; Move data between registers or between register and memory
mov     ecx, 20202020h  ; Move data between registers or between register and memory
mov     al, byte ptr [esp+884h+var_864]  ; Move data between registers or between register and memory
add     esp, 10h  ; Unrecognized or less common instruction
mov     [edx], ecx  ; Move data between registers or between register and memory
cmp     al, bl  ; Unrecognized or less common instruction
mov     [edx+4], ecx  ; Move data between registers or between register and memory
mov     [edx+8], ecx  ; Move data between registers or between register and memory
mov     [edx+0Ch], ecx  ; Move data between registers or between register and memory
mov     [edx+10h], cx  ; Move data between registers or between register and memory
mov     [edx+12h], cl  ; Move data between registers or between register and memory
mov     [esi+13h], bl  ; Move data between registers or between register and memory
jz      short loc_4BBD63  ; Unrecognized or less common instruction
lea     edx, [esp+874h+var_864]  ; Unrecognized or less common instruction
lea     ecx, [esi+0Bh]  ; Unrecognized or less common instruction
mov     [ecx], al  ; Move data between registers or between register and memory
mov     al, [edx+1]  ; Move data between registers or between register and memory
inc     ecx  ; Unrecognized or less common instruction
inc     edx  ; Unrecognized or less common instruction
cmp     al, bl  ; Unrecognized or less common instruction
jnz     short loc_4BBD58  ; Unrecognized or less common instruction
add     esi, 14h  ; Unrecognized or less common instruction
inc     edi  ; Unrecognized or less common instruction
cmp     esi, offset dword_A442B4  ; Unrecognized or less common instruction
jl      short loc_4BBD1C  ; Unrecognized or less common instruction
lea     eax, [esp+874h+var_800]  ; Unrecognized or less common instruction
push    800h  ; Push register value onto the stack
lea     ecx, [esp+878h+var_850]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
lea     edx, [esp+87Ch+var_830]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
mov     dword_A965A8, ebx  ; Move data between registers or between register and memory
call    ScriptBufInit  ; Call a procedure
mov     eax, [esp+884h+arg_4]  ; Move data between registers or between register and memory
mov     ecx, [eax+84h]  ; Move data between registers or between register and memory
mov     edx, [eax+80h]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
lea     eax, [esp+888h+var_850]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4BF1C0  ; Call a procedure
push    offset aW  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    QFileOpen  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 24h  ; Unrecognized or less common instruction
cmp     esi, ebx  ; Unrecognized or less common instruction
jz      short loc_4BBE3B  ; Unrecognized or less common instruction
push    offset aParsingScriptA  ; Push register value onto the stack
call    sub_4BBEF0  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
lea     ecx, [esp+874h+var_828]  ; Unrecognized or less common instruction
lea     edx, [esp+874h+var_830]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
mov     [esp+87Ch+var_864], ebx  ; Move data between registers or between register and memory
call    sub_4BFC70  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4BBE23  ; Unrecognized or less common instruction
lea     eax, [esp+874h+var_864]  ; Unrecognized or less common instruction
lea     ecx, [esp+874h+var_830]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4BF1F0  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4BBE1D  ; Unrecognized or less common instruction
mov     edx, [esp+874h+var_864]  ; Move data between registers or between register and memory
lea     eax, [esp+874h+var_85C]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4AF8F0  ; Call a procedure
mov     ecx, [esp+87Ch+var_864]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_4BBF80  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
jmp     short loc_4BBDCE  ; Unconditional jump to a label or address
inc     dword_A442C8  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_4BBF40  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4BBF60  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
jmp     short loc_4BBE49  ; Unconditional jump to a label or address
push    ebp  ; Push register value onto the stack
push    offset aFailedToOpenFi  ; Push register value onto the stack
call    sub_4BBE90  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
mov     edi, [esp+874h+var_85C]  ; Move data between registers or between register and memory
mov     esi, [edi]  ; Move data between registers or between register and memory
cmp     esi, ebx  ; Unrecognized or less common instruction
jz      short loc_4BBE6A  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
push    edi  ; Push register value onto the stack
call    sub_4BF8F0  ; Call a procedure
mov     edi, esi  ; Move data between registers or between register and memory
mov     esi, [esi]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
cmp     esi, ebx  ; Unrecognized or less common instruction
jnz     short loc_4BBE53  ; Unrecognized or less common instruction
lea     edx, [esp+874h+var_850]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
call    sub_4BEFC0  ; Call a procedure
mov     eax, dword_A442C8  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
add     esp, 864h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === ResourceFlush_004B63D0.asm ===
; This is an assembly file for ResourceFlush located at address 004B63D0
; Assembly for ResourceFlush
; Address: 004B63D0
mov     ecx, dword_943E38  ; Move data between registers or between register and memory
mov     edx, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
mov     eax, [ecx]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B63ED  ; Unrecognized or less common instruction
cmp     [ecx+34h], edx  ; Unrecognized or less common instruction
jz      short loc_4B63FD  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
mov     eax, [eax]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B63E0  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    offset aResourceFlushC  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4B63FB  ; Unconditional jump to a label or address
mov     eax, [ecx+24h]  ; Move data between registers or between register and memory
cmp     eax, 3  ; Unrecognized or less common instruction
jz      short locret_4B6413  ; Unrecognized or less common instruction
cmp     eax, 1  ; Unrecognized or less common instruction
jz      short locret_4B6413  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4B5C90  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === ResourceLoad_004B5F00.asm ===
; This is an assembly file for ResourceLoad located at address 004B5F00
; Assembly for ResourceLoad
; Address: 004B5F00
push    ecx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+8+ArgList]  ; Move data between registers or between register and memory
lea     eax, [esp+8+ArgList]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    IsResourceLoaded  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B5F3A  ; Unrecognized or less common instruction
mov     eax, [esp+8+arg_4]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+8+ArgList]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B5F29  ; Unrecognized or less common instruction
mov     edx, [ecx+28h]  ; Move data between registers or between register and memory
mov     [eax], edx  ; Move data between registers or between register and memory
mov     dword ptr [ecx+2Ch], 1  ; Move data between registers or between register and memory
mov     eax, dword ptr [esp+8+ArgList]  ; Move data between registers or between register and memory
pop     esi  ; Pop value from stack into register
mov     eax, [eax+34h]  ; Move data between registers or between register and memory
pop     ecx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
lea     ecx, [esp+8+var_4]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    ResourcePackUnpack  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B5F5C  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset aFailedToLoadRe  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4B5F5A  ; Unconditional jump to a label or address
mov     ecx, [esp+8+arg_4]  ; Move data between registers or between register and memory
mov     edx, [esp+8+var_4]  ; Move data between registers or between register and memory
test    ecx, ecx  ; Unrecognized or less common instruction
jz      short loc_4B5F6A  ; Unrecognized or less common instruction
mov     [ecx], edx  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B1FB0  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4B5F80  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
pop     ecx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === ResourcePackUnpack_004B18B0.asm ===
; This is an assembly file for ResourcePackUnpack located at address 004B18B0
; Assembly for ResourcePackUnpack
; Address: 004B18B0
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, [esp+10h+ArgList]  ; Move data between registers or between register and memory
push    offset aR  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    QFileOpen  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      loc_4B19B0  ; Unrecognized or less common instruction
mov     ecx, [esi]  ; Move data between registers or between register and memory
lea     eax, ds:0[ecx*8]  ; Unrecognized or less common instruction
sub     eax, ecx  ; Unrecognized or less common instruction
lea     eax, [eax+eax*4]  ; Unrecognized or less common instruction
mov     ecx, dword_9436E8[eax*4]  ; Move data between registers or between register and memory
test    ecx, ecx  ; Unrecognized or less common instruction
jz      short loc_4B1931  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4B19C0  ; Call a procedure
mov     ecx, [esi]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
mov     [eax+0Ch], ecx  ; Move data between registers or between register and memory
mov     edx, [esi]  ; Move data between registers or between register and memory
lea     eax, [esp+18h+ArgList]  ; Unrecognized or less common instruction
lea     ecx, ds:0[edx*8]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
sub     ecx, edx  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
lea     ecx, [ecx+ecx*4]  ; Unrecognized or less common instruction
call    dword_9436E8[ecx*4]  ; Call a procedure
push    esi  ; Push register value onto the stack
mov     edi, eax  ; Move data between registers or between register and memory
call    sub_4B1690  ; Call a procedure
mov     eax, [esp+28h+arg_4]  ; Move data between registers or between register and memory
add     esp, 18h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B192A  ; Unrecognized or less common instruction
mov     ecx, [esp+10h+ArgList]  ; Move data between registers or between register and memory
mov     [eax], ecx  ; Move data between registers or between register and memory
mov     eax, edi  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4B1780  ; Call a procedure
mov     ebx, eax  ; Move data between registers or between register and memory
push    4  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
push    edi  ; Push register value onto the stack
mov     ebp, eax  ; Move data between registers or between register and memory
call    sub_4B19C0  ; Call a procedure
mov     edx, [esi]  ; Move data between registers or between register and memory
mov     edi, eax  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     [edi+0Ch], edx  ; Move data between registers or between register and memory
mov     [edi+18h], ebp  ; Move data between registers or between register and memory
mov     [edi+10h], ebx  ; Move data between registers or between register and memory
call    ResourceUnpack  ; Call a procedure
push    0  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_4B17F0  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4B17A0  ; Call a procedure
add     esp, 28h  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4B198D  ; Unrecognized or less common instruction
mov     eax, [esp+10h+arg_4]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B197D  ; Unrecognized or less common instruction
mov     [eax], ebx  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
mov     eax, ebp  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    sub_4BADA0  ; Call a procedure
push    ebp  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4B1690  ; Call a procedure
mov     eax, [esp+1Ch+arg_4]  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B19B0  ; Unrecognized or less common instruction
mov     dword ptr [eax], 0  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
xor     eax, eax  ; XOR operation, usually for zeroing a register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === ResourceUnload_004B6380.asm ===
; This is an assembly file for ResourceUnload located at address 004B6380
; Assembly for ResourceUnload
; Address: 004B6380
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
lea     eax, [esp+4+ArgList]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    IsResourceLoaded  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B63B3  ; Unrecognized or less common instruction
mov     ecx, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
pop     esi  ; Pop value from stack into register
mov     eax, [ecx+24h]  ; Move data between registers or between register and memory
cmp     eax, 3  ; Unrecognized or less common instruction
jz      short locret_4B63B2  ; Unrecognized or less common instruction
cmp     eax, 1  ; Unrecognized or less common instruction
jz      short locret_4B63B2  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4B5C90  ; Call a procedure
add     esp, 4  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset aResourceUnload  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4B63C1  ; Unconditional jump to a label or address


; === ResourceUnpack_004B16D0.asm ===
; This is an assembly file for ResourceUnpack located at address 004B16D0
; Assembly for ResourceUnpack
; Address: 004B16D0
mov     edx, [esp+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
mov     esi, [esp+4+arg_8]  ; Move data between registers or between register and memory
mov     ecx, [edx]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
mov     esi, [esp+8+arg_4]  ; Move data between registers or between register and memory
lea     eax, ds:0[ecx*8]  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
sub     eax, ecx  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
lea     eax, [eax+eax*4]  ; Unrecognized or less common instruction
call    dword_9436C0[eax*4]  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === RigidDyncubeObjRead_004C48E0.asm ===
; This is an assembly file for RigidDyncubeObjRead located at address 004C48E0
; Assembly for RigidDyncubeObjRead
; Address: 004C48E0
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, [esp+8+Str]  ; Move data between registers or between register and memory
push    offset SubStr  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    _strstr  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jnz     short loc_4C4916  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
call    QvmLoad  ; Call a procedure
mov     esi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_4C4919  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    QvmCompile  ; Call a procedure
push    esi  ; Push register value onto the stack
call    CompilerCleanup  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aRigiddyncubeob_0  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4C4927  ; Unconditional jump to a label or address


; === ScriptBufInit_004C0200.asm ===
; This is an assembly file for ScriptBufInit located at address 004C0200
; Assembly for ScriptBufInit
; Address: 004C0200
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
mov     ecx, [esp+arg_4]  ; Move data between registers or between register and memory
mov     edx, [esp+arg_8]  ; Move data between registers or between register and memory
mov     [eax], ecx  ; Move data between registers or between register and memory
mov     ecx, [esp+arg_C]  ; Move data between registers or between register and memory
mov     [eax+1Ch], edx  ; Move data between registers or between register and memory
mov     [eax+2Ch], ecx  ; Move data between registers or between register and memory
lea     ecx, [eax+0Ch]  ; Unrecognized or less common instruction
lea     edx, [eax+8]  ; Unrecognized or less common instruction
mov     [eax+10h], edx  ; Move data between registers or between register and memory
mov     [edx], ecx  ; Move data between registers or between register and memory
mov     dword ptr [ecx], 0  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === ScriptInit_004F0E50.asm ===
; This is an assembly file for ScriptInit located at address 004F0E50
; Assembly for ScriptInit
; Address: 004F0E50
mov     eax, [esp+arg_0]  ; Move data between registers or between register and memory
mov     cl, [esp+arg_4]  ; Move data between registers or between register and memory
mov     edx, [esp+arg_8]  ; Move data between registers or between register and memory
mov     dword_A70C98, eax  ; Move data between registers or between register and memory
mov     al, [esp+arg_C]  ; Move data between registers or between register and memory
mov     byte_54DD16, cl  ; Move data between registers or between register and memory
mov     dword_A70C74, edx  ; Move data between registers or between register and memory
mov     byte_A758BC, al  ; Move data between registers or between register and memory
mov     dword_A758A8, 0  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


; === ScriptSetsymbolCxt_004B8930.asm ===
; This is an assembly file for ScriptSetsymbolCxt located at address 004B8930
; Assembly for ScriptSetsymbolCxt
; Address: 004B8930
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
lea     eax, [esp+4+ArgList]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_4BAB80  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_4B8954  ; Unrecognized or less common instruction
mov     edx, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
mov     ecx, [esp+4+arg_4]  ; Move data between registers or between register and memory
pop     esi  ; Pop value from stack into register
mov     [edx+18h], ecx  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset aScriptSetsymbo  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4B8962  ; Unconditional jump to a label or address


; === SoldierExecute_0045C440.asm ===
; This is an assembly file for SoldierExecute located at address 0045C440
; Assembly for SoldierExecute
; Address: 0045C440
sub     esp, 8  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
mov     esi, [esp+14h+arg_4]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
push    0  ; Push register value onto the stack
mov     ebp, [esi+800h]  ; Move data between registers or between register and memory
lea     ebx, [esi+4C4h]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
lea     edi, [esi+254h]  ; Unrecognized or less common instruction
mov     [esp+20h+var_8], 17h  ; Move data between registers or between register and memory
mov     [esp+20h+var_4], 16h  ; Move data between registers or between register and memory
mov     [esp+20h+arg_4], 0FFFFFFFFh  ; Move data between registers or between register and memory
call    sub_4F2060  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_45C497  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
call    sub_4F2390  ; Call a procedure
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_4F2070  ; Call a procedure
add     esp, 10h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_4F2290  ; Call a procedure
mov     byte ptr [esi+33Dh], 0  ; Move data between registers or between register and memory
mov     byte ptr [esi+696h], 1  ; Move data between registers or between register and memory
mov     ebx, [edi+94h]  ; Move data between registers or between register and memory
push    ebx  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    sub_489E10  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
test    ebp, ebp  ; Unrecognized or less common instruction
jz      short loc_45C4D2  ; Unrecognized or less common instruction
mov     ebp, [ebp+3AD0h]  ; Move data between registers or between register and memory
cmp     ebp, 0FFFFFFFFh  ; Unrecognized or less common instruction
jz      short loc_45C4D2  ; Unrecognized or less common instruction
mov     [esp+18h+arg_4], ebp  ; Move data between registers or between register and memory
jnz     short loc_45C52D  ; Unrecognized or less common instruction
push    2  ; Push register value onto the stack
call    sub_416D20  ; Call a procedure
push    eax  ; Push register value onto the stack
call    sub_4B47C0  ; Call a procedure
mov     ecx, [esi+0D1Ch]  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
test    ecx, ecx  ; Unrecognized or less common instruction
jl      short loc_45C52D  ; Unrecognized or less common instruction
cmp     ecx, 1  ; Unrecognized or less common instruction
jle     short loc_45C510  ; Unrecognized or less common instruction
cmp     ecx, 2  ; Unrecognized or less common instruction
jnz     short loc_45C52D  ; Unrecognized or less common instruction
cmp     ebx, 0Fh  ; Unrecognized or less common instruction
jz      short loc_45C506  ; Unrecognized or less common instruction
cmp     ebx, 10h  ; Unrecognized or less common instruction
jz      short loc_45C506  ; Unrecognized or less common instruction
mov     eax, [esp+eax*4+18h+var_8]  ; Move data between registers or between register and memory
jmp     short loc_45C529  ; Unconditional jump to a label or address
mov     ecx, [edi+eax*4+8]  ; Move data between registers or between register and memory
mov     [esp+18h+arg_4], ecx  ; Move data between registers or between register and memory
jmp     short loc_45C52D  ; Unconditional jump to a label or address
lea     edx, [esi+0D20h]  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_45DAA0  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
neg     al  ; Unrecognized or less common instruction
sbb     eax, eax  ; Unrecognized or less common instruction
and     al, 0D5h  ; Unrecognized or less common instruction
add     eax, 47h  ; Unrecognized or less common instruction
mov     [esp+18h+arg_4], eax  ; Move data between registers or between register and memory
mov     edi, [esp+18h+arg_4]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
lea     eax, [esi+68h]  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4D61D0  ; Call a procedure
mov     ecx, [esi+0CF8h]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
lea     edx, [esi+0D38h]  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
call    sub_45D5B0  ; Call a procedure
push    3  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    HumanViewCam  ; Call a procedure
mov     eax, [esi+4ECh]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_464700  ; Call a procedure
push    esi  ; Push register value onto the stack
call    sub_4635F0  ; Call a procedure
push    4  ; Push register value onto the stack
push    offset aAiDeath  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
call    sub_4638A0  ; Call a procedure
add     esp, 40h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
call    sub_48A330  ; Call a procedure
mov     ecx, [esp+1Ch+arg_0]  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
mov     dword ptr [ecx+14h], offset sub_45C700  ; Move data between registers or between register and memory
pop     ebx  ; Pop value from stack into register
add     esp, 8  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === SoundLoad_004E68D0.asm ===
; This is an assembly file for SoundLoad located at address 004E68D0
; Assembly for SoundLoad
; Address: 004E68D0
mov     eax, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    offset sub_4E68F0  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
call    sub_4B1420  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === StatusMessageClear_00485AD0.asm ===
; This is an assembly file for StatusMessageClear located at address 00485AD0
; Assembly for StatusMessageClear
; Address: 00485AD0
sub     esp, 18h  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
call    sub_487180  ; Call a procedure
mov     eax, [eax+4E4h]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4868D0  ; Call a procedure
mov     eax, [esp+24h+arg_0]  ; Move data between registers or between register and memory
mov     ecx, 6  ; Move data between registers or between register and memory
lea     esi, [esp+24h+var_18]  ; Unrecognized or less common instruction
mov     edi, eax  ; Move data between registers or between register and memory
add     esp, 4  ; Unrecognized or less common instruction
mov     [esp+20h+var_18], 1  ; Move data between registers or between register and memory
mov     [esp+20h+var_10], 0  ; Move data between registers or between register and memory
mov     [esp+20h+var_C], 3FF00000h  ; Move data between registers or between register and memory
mov     [esp+20h+var_8], offset byte_567C74  ; Move data between registers or between register and memory
rep movsd  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
add     esp, 18h  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === StatusMessageShow_00485970.asm ===
; This is an assembly file for StatusMessageShow located at address 00485970
; Assembly for StatusMessageShow
; Address: 00485970
push    ebp  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
push    1  ; Push register value onto the stack
call    QhashInit  ; Call a procedure
mov     ax, word_540A8C  ; Move data between registers or between register and memory
mov     ecx, [esp+10h+arg_0]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4012A0  ; Call a procedure
mov     esi, [esp+1Ch+arg_4]  ; Move data between registers or between register and memory
mov     ebp, eax  ; Move data between registers or between register and memory
mov     edi, esi  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
push    4  ; Push register value onto the stack
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
mov     edx, eax  ; Move data between registers or between register and memory
mov     edi, esi  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     [ebp+0B0h], edx  ; Move data between registers or between register and memory
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
lea     edx, [ebp+0B4h]  ; Unrecognized or less common instruction
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
mov     edi, [esp+24h+arg_8]  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
lea     edx, [ebp+1B4h]  ; Unrecognized or less common instruction
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
xor     eax, eax  ; XOR operation, usually for zeroing a register
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
mov     edi, [esp+24h+arg_C]  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, edx  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
mov     byte ptr [ebp+1C4h], 1  ; Move data between registers or between register and memory
mov     byte ptr [ebp+1C5h], 1  ; Move data between registers or between register and memory
call    QhashReset  ; Call a procedure
push    0  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_485750  ; Call a procedure
add     esp, 20h  ; Unrecognized or less common instruction
mov     eax, ebp  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === SymbolCheck_004C0560.asm ===
; This is an assembly file for SymbolCheck located at address 004C0560
; Assembly for SymbolCheck
; Address: 004C0560
push    ebx  ; Push register value onto the stack
mov     ebx, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
push    ebp  ; Push register value onto the stack
mov     ebp, [esp+8+arg_0]  ; Move data between registers or between register and memory
lea     eax, [esp+8+ArgList]  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    ebp  ; Push register value onto the stack
call    sub_4C04B0  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
test    al, al  ; Unrecognized or less common instruction
jz      short loc_4C058D  ; Unrecognized or less common instruction
push    ebx  ; Push register value onto the stack
push    offset aSymbolSAlready  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4C058B  ; Unconditional jump to a label or address
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, ebx  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
push    4  ; Push register value onto the stack
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
add     ecx, 10h  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    MemoryAlloc  ; Call a procedure
lea     ecx, [eax+10h]  ; Unrecognized or less common instruction
mov     dword ptr [esp+18h+ArgList], eax  ; Move data between registers or between register and memory
mov     [eax+8], ecx  ; Move data between registers or between register and memory
mov     edx, dword ptr [esp+18h+ArgList]  ; Move data between registers or between register and memory
mov     eax, [esp+18h+arg_8]  ; Move data between registers or between register and memory
mov     edi, ebx  ; Move data between registers or between register and memory
mov     [edx+0Ch], eax  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
mov     eax, dword ptr [esp+18h+ArgList]  ; Move data between registers or between register and memory
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
mov     edx, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, [eax+8]  ; Move data between registers or between register and memory
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, edx  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
mov     ecx, dword ptr [esp+18h+ArgList]  ; Move data between registers or between register and memory
mov     dword ptr [ecx+4], 0  ; Move data between registers or between register and memory
mov     edx, dword ptr [esp+18h+ArgList]  ; Move data between registers or between register and memory
mov     dword ptr [edx], 0  ; Move data between registers or between register and memory
mov     eax, [ebp+4]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_4C0530  ; Call a procedure
mov     ecx, dword ptr [esp+20h+ArgList]  ; Move data between registers or between register and memory
lea     edx, [eax+eax*2]  ; Unrecognized or less common instruction
mov     eax, [ebp+0]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
lea     ecx, [eax+edx*4]  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    sub_4AF910  ; Call a procedure
mov     edx, dword ptr [esp+28h+ArgList]  ; Move data between registers or between register and memory
add     esp, 18h  ; Unrecognized or less common instruction
mov     eax, [edx+8]  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebp  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === SymbolRegisterBool8_004B7EE0.asm ===
; This is an assembly file for SymbolRegisterBool8 located at address 004B7EE0
; Assembly for SymbolRegisterBool8
; Address: 004B7EE0
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    offset sub_4B7F00  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QTaskHashTableSet  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === SymbolRegisterInt16_004B7E80.asm ===
; This is an assembly file for SymbolRegisterInt16 located at address 004B7E80
; Assembly for SymbolRegisterInt16
; Address: 004B7E80
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    4  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    offset sub_4B7EA0  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QTaskHashTableSet  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === SymbolRegisterInt32_004B7FA0.asm ===
; This is an assembly file for SymbolRegisterInt32 located at address 004B7FA0
; Assembly for SymbolRegisterInt32
; Address: 004B7FA0
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    4  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    offset sub_4B7EA0  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QTaskHashTableSet  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === SymbolRegisterReal32_004B7FC0.asm ===
; This is an assembly file for SymbolRegisterReal32 located at address 004B7FC0
; Assembly for SymbolRegisterReal32
; Address: 004B7FC0
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    2  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    8  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    offset sub_4B7FE0  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QTaskHashTableSet  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === SymbolRemove_004C0460.asm ===
; This is an assembly file for SymbolRemove located at address 004C0460
; Assembly for SymbolRemove
; Address: 004C0460
mov     ecx, [esp+arg_0]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
mov     esi, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
lea     eax, [esp+4+ArgList]  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    sub_4C04B0  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
test    al, al  ; Unrecognized or less common instruction
jz      short loc_4C0495  ; Unrecognized or less common instruction
mov     edx, dword ptr [esp+4+ArgList]  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
call    sub_4AF960  ; Call a procedure
mov     eax, dword ptr [esp+8+ArgList]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_4B0D10  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
push    offset aUnableToRemove  ; Push register value onto the stack
call    ErrorShow  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
jmp     short loc_4C04A3  ; Unconditional jump to a label or address


; === TasktypeSet_004B8810.asm ===
; This is an assembly file for TasktypeSet located at address 004B8810
; Assembly for TasktypeSet
; Address: 004B8810
mov     eax, [esp+arg_4]  ; Move data between registers or between register and memory
mov     ecx, dword ptr [esp+ArgList]  ; Move data between registers or between register and memory
push    0  ; Push register value onto the stack
push    1  ; Push register value onto the stack
push    2  ; Push register value onto the stack
push    4  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    offset sub_4B8830  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
call    QTaskHashTableSet  ; Call a procedure
add     esp, 1Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === WarningShow_004AF810.asm ===
; This is an assembly file for WarningShow located at address 004AF810
; Assembly for WarningShow
; Address: 004AF810
mov     eax, dword_936274  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short locret_4AF85D  ; Unrecognized or less common instruction
push    edi  ; Push register value onto the stack
push    offset aWarning  ; Push register value onto the stack
push    offset byte_A84640  ; Push register value onto the stack
call    GameDataSymbolLoad  ; Call a procedure
mov     ecx, [esp+0Ch+Format]  ; Move data between registers or between register and memory
lea     eax, [esp+0Ch+ArgList]  ; Unrecognized or less common instruction
push    eax  ; Push register value onto the stack
push    ecx  ; Push register value onto the stack
mov     edi, offset byte_A84640  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
dec     ecx  ; Unrecognized or less common instruction
add     ecx, offset byte_A84640  ; Unrecognized or less common instruction
push    ecx  ; Push register value onto the stack
call    _vsprintf  ; Call a procedure
push    offset byte_A84640  ; Push register value onto the stack
call    dword_936274  ; Call a procedure
add     esp, 18h  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === WeaponConfigRead_004071E0.asm ===
; This is an assembly file for WeaponConfigRead located at address 004071E0
; Assembly for WeaponConfigRead
; Address: 004071E0
mov     edx, [esp+arg_4]  ; Move data between registers or between register and memory
push    esi  ; Push register value onto the stack
push    edi  ; Push register value onto the stack
mov     edi, edx  ; Move data between registers or between register and memory
or      ecx, 0FFFFFFFFh  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
repne scasb  ; Unrecognized or less common instruction
not     ecx  ; Unrecognized or less common instruction
sub     edi, ecx  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
mov     eax, ecx  ; Move data between registers or between register and memory
mov     esi, edi  ; Move data between registers or between register and memory
mov     edi, offset unk_5690F0  ; Move data between registers or between register and memory
push    edx  ; Push register value onto the stack
shr     ecx, 2  ; Unrecognized or less common instruction
rep movsd  ; Unrecognized or less common instruction
mov     ecx, eax  ; Move data between registers or between register and memory
and     ecx, 3  ; Unrecognized or less common instruction
rep movsb  ; Unrecognized or less common instruction
mov     ecx, [esp+10h+arg_0]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
call    ConfigCompile  ; Call a procedure
mov     edi, eax  ; Move data between registers or between register and memory
add     esp, 0Ch  ; Unrecognized or less common instruction
test    edi, edi  ; Unrecognized or less common instruction
jz      short loc_40728B  ; Unrecognized or less common instruction
mov     esi, [edi+8]  ; Move data between registers or between register and memory
cmp     dword ptr [esi], 0  ; Unrecognized or less common instruction
jz      short loc_40728B  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_40728B  ; Unrecognized or less common instruction
mov     eax, dword_AFA7E0  ; Move data between registers or between register and memory
mov     edx, [esi]  ; Move data between registers or between register and memory
test    edx, edx  ; Unrecognized or less common instruction
jz      short loc_40723F  ; Unrecognized or less common instruction
mov     ecx, [edx]  ; Move data between registers or between register and memory
neg     ecx  ; Unrecognized or less common instruction
sbb     ecx, ecx  ; Unrecognized or less common instruction
and     ecx, edx  ; Unrecognized or less common instruction
jmp     short loc_407241  ; Unconditional jump to a label or address
xor     ecx, ecx  ; XOR operation, usually for zeroing a register
mov     dword_AFA6E0[eax*4], ecx  ; Move data between registers or between register and memory
inc     eax  ; Unrecognized or less common instruction
mov     dword_AFA7E0, eax  ; Move data between registers or between register and memory
call    sub_4F1A70  ; Call a procedure
and     eax, 0FFh  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    esi  ; Push register value onto the stack
lea     edx, [eax+eax*2]  ; Unrecognized or less common instruction
xor     eax, eax  ; XOR operation, usually for zeroing a register
mov     ax, [esi+1Ch]  ; Move data between registers or between register and memory
shl     edx, 7  ; Unrecognized or less common instruction
add     edx, eax  ; Unrecognized or less common instruction
mov     eax, dword_A96AE0[edx*4]  ; Move data between registers or between register and memory
call    eax  ; Call a procedure
mov     eax, dword_AFA7E0  ; Move data between registers or between register and memory
add     esp, 8  ; Unrecognized or less common instruction
dec     eax  ; Unrecognized or less common instruction
mov     dword_AFA7E0, eax  ; Move data between registers or between register and memory
mov     esi, dword_AFA6E0[eax*4]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_40722F  ; Unrecognized or less common instruction
mov     eax, edi  ; Move data between registers or between register and memory
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === WeaponGunPickup_0045FFC0.asm ===
; This is an assembly file for WeaponGunPickup located at address 0045FFC0
; Assembly for WeaponGunPickup
; Address: 0045FFC0
push    ebx  ; Push register value onto the stack
mov     ebx, [esp+4+arg_0]  ; Move data between registers or between register and memory
mov     al, [ebx+0CF5h]  ; Move data between registers or between register and memory
test    al, al  ; Unrecognized or less common instruction
jnz     loc_460066  ; Unrecognized or less common instruction
push    esi  ; Push register value onto the stack
mov     esi, [ebx+8]  ; Move data between registers or between register and memory
push    edi  ; Push register value onto the stack
mov     edi, [esp+0Ch+arg_4]  ; Move data between registers or between register and memory
cmp     dword ptr [esi], 0  ; Unrecognized or less common instruction
jz      short loc_46001D  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_46001D  ; Unrecognized or less common instruction
call    sub_477BF0  ; Call a procedure
push    eax  ; Push register value onto the stack
mov     ax, [esi+1Ch]  ; Move data between registers or between register and memory
push    eax  ; Push register value onto the stack
call    sub_401CF0  ; Call a procedure
add     esp, 8  ; Unrecognized or less common instruction
test    al, al  ; Unrecognized or less common instruction
jz      short loc_46000E  ; Unrecognized or less common instruction
mov     eax, [esi+128h]  ; Move data between registers or between register and memory
test    eax, eax  ; Unrecognized or less common instruction
jz      short loc_46000E  ; Unrecognized or less common instruction
mov     ecx, [eax]  ; Move data between registers or between register and memory
mov     eax, [edi]  ; Move data between registers or between register and memory
cmp     ecx, eax  ; Unrecognized or less common instruction
jz      short loc_460033  ; Unrecognized or less common instruction
mov     esi, [esi]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_46001D  ; Unrecognized or less common instruction
cmp     dword ptr [esi], 0  ; Unrecognized or less common instruction
jz      short loc_46001D  ; Unrecognized or less common instruction
test    esi, esi  ; Unrecognized or less common instruction
jnz     short loc_45FFE5  ; Unrecognized or less common instruction
mov     edx, [edi+4]  ; Move data between registers or between register and memory
mov     eax, [edi]  ; Move data between registers or between register and memory
push    1  ; Push register value onto the stack
push    edx  ; Push register value onto the stack
push    eax  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_477C50  ; Call a procedure
add     esp, 14h  ; Unrecognized or less common instruction
jmp     short loc_460053  ; Unconditional jump to a label or address
mov     esi, [esi+12Ch]  ; Move data between registers or between register and memory
test    esi, esi  ; Unrecognized or less common instruction
jz      short loc_460053  ; Unrecognized or less common instruction
mov     ecx, [edi+4]  ; Move data between registers or between register and memory
mov     edx, [esi]  ; Move data between registers or between register and memory
push    ecx  ; Push register value onto the stack
add     ebx, 340h  ; Unrecognized or less common instruction
push    edx  ; Push register value onto the stack
push    ebx  ; Push register value onto the stack
call    sub_47CE00  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
push    0  ; Push register value onto the stack
push    0  ; Push register value onto the stack
push    offset aWeaponpickup1  ; Push register value onto the stack
call    sub_4E7200  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
pop     edi  ; Pop value from stack into register
pop     esi  ; Pop value from stack into register
pop     ebx  ; Pop value from stack into register
retn  ; Unrecognized or less common instruction


; === WeaponTypeOpen_00413B70.asm ===
; This is an assembly file for WeaponTypeOpen located at address 00413B70
; Assembly for WeaponTypeOpen
; Address: 00413B70
push    0  ; Push register value onto the stack
push    offset sub_413A90  ; Push register value onto the stack
push    offset aLocalWeapons  ; Push register value onto the stack
mov     dword_57B18C, 0  ; Move data between registers or between register and memory
call    sub_4B1420  ; Call a procedure
add     esp, 0Ch  ; Unrecognized or less common instruction
retn  ; Unrecognized or less common instruction


; === WeaponsCountGet_00413BB0.asm ===
; This is an assembly file for WeaponsCountGet located at address 00413BB0
; Assembly for WeaponsCountGet
; Address: 00413BB0
mov     eax, dword_57B18C  ; Move data between registers or between register and memory
retn  ; Unrecognized or less common instruction


