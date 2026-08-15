// IGI 1 Native Function Decompiled C Code
// Consolidated from 49 files

// === AnimTriggerLoad.c ===
int __cdecl AnimTriggerLoad(char ArgList)  // Function to load animation trigger
{
  // Call to sub_4B1420 function with ArgList, address of sub_4EBDF0 and 0 as arguments
  return sub_4B1420(ArgList, (int)sub_4EBDF0, 0);
}

// === CompareFunction.c ===
int __cdecl CompareFunction(float *a1, float *a2)
{
  if ( *a1 <= (double)*a2 )
    return *a1 < (double)*a2;
  else
    return -1;
}

// === CompilerCleanup.c ===
int __cdecl CompilerCleanup(int ArgList)  // Function to clean up the compiler
{
  if ( *(_DWORD *)(ArgList + 140) )  // If the value at the memory location (ArgList + 140) is not null
    sub_4BD380(*(_DWORD *)(ArgList + 140));  // Call the function sub_4BD380 with the value at the memory location (ArgList + 140) as argument
  else
    ResourceUnload((char *)ArgList);  // If the value at the memory location (ArgList + 140) is null, unload the resource
  return sub_4B0D10(ArgList);  // Return the result of the function sub_4B0D10 with ArgList as argument
}

// === ConfigCompile.c ===
// Compile the configuration
int __cdecl ConfigCompile(int a1, char *a2, char a3)
{
  _DWORD *v3; // esi

  // Set the symbol context for the script
  ScriptSetsymbolCxt((char)aTaskNew, a1);

  // Load the QVM file
  v3 = (_DWORD *)QvmLoad(a2);
  if (!v3)
    return 0;

  // Initialize the script
  ScriptInit(a2, 1, 0, a3);

  // Compile the QVM
  QvmCompile(v3);

  // Clean up the compiler
  CompilerCleanup((int)v3);

  return dword_A758A8;
}

// === ConfigRead.c ===
// Read the configuration file
int __cdecl ConfigRead(char *a1)
{
  _DWORD *v1; // Pointer to the loaded QVM file

  // Load the QVM file
  v1 = (_DWORD *)QvmLoad(a1);

  // Check if the QVM file was loaded successfully
  if (v1)
  {
    // Compile the QVM file
    QvmCompile(v1);

    // Clean up the compiler
    CompilerCleanup((int)v1);
  }
  else
  {
    // Handle the case when the QVM file failed to load
    sub_405300();
  }

  // Perform additional tasks after reading the configuration
  sub_4058A0();
  sub_405980();

  // Return the result of sub_405B30
  return sub_405B30();
}

// === ConfigWrite.c ===
int __cdecl ConfigWrite(char *ArgList)
{
  int v1; // eax
  int v2; // esi
  int i; // edi
  int result; // eax

  // Open the config file
  v1 = QFileOpen((char)ArgList, (int)aW);
  v2 = v1;
  if ( !v1 )
  {
    // If the file failed to open, show an error message and exit the function
    ErrorShow("Could not create config file %s.", ArgList);
    while ( 1 )
      ;
  }
  // Perform some operations on v1
  sub_405C50(v1);
  sub_406170(v2);
  // Iterate over a range and perform an operation on v2 and i
  for ( i = 0; i < dword_BC2380; ++i )
    sub_405C90(v2, i);
  // Perform some final operations on v2
  sub_4B1690(v2);
  // Call a function and store the result in result
  result = sub_48F340();
  if ( result )
  {
    // If the result is non-zero, compile the config file and return the result of another function
    QscCompile((char)ArgList);
    return sub_4B1AC0(ArgList);
  }
  // Otherwise, return the result
  return result;
}

// === EnemyDetectorOverlay.c ===
/*
 * Reverse-engineered version of FUN_00471f60 with renamed variables and detailed comments.
 * This is likely from a C++ game from around the 2000s, and we're analyzing compiled binary behavior.
 * 
 * Assumptions:
 * - The contextBase points to a large structure, likely "GameContext".
 * - At offset 0x2C44 begins an array of 10 overlay slots, each 0x2C (44 bytes) in size.
 * - Each slot corresponds to one AI target being tracked for drawing overlays (e.g., binocular HUD).
 */

uint32_t EnemyDetectorOverlay_00471F60(int contextBase, int targetID, float sortingDistance, int configFlag, int *screenPosition, int eventParam, int extraParam1, int extraParam2) {
    unsigned int slotIndex       /* old: uVar1 */ = 0;
    int          currentTimer    /* old: iVar2 */;
    int         *scanPtr         /* old: piVar3 */;
    int         *slotPtr         /* old: piVar4 */;
    float       *distanceScanPtr /* old: pfVar5 */;

    // Each overlay slot is 0x2C (44 bytes), i.e., 11 integers (4 bytes each).
    // Overlay slot table starts at offset 0x2C44 inside the GameContext structure.
    scanPtr = (int *)(contextBase + 0x2C44);  
    slotPtr = scanPtr;

    // 1) Try to find an existing slot for this targetID
    do {
        if (*slotPtr == targetID) {
            // Found matching ID, point slotPtr directly to that slot's memory
            slotPtr = (int *)(contextBase + 0x2C44 + slotIndex * 0x2C);
            if (slotPtr != NULL) 
                goto InitializeSlot;
            break;
        }
        slotIndex++;
        slotPtr += 11;  // Move to next slot (11 ints = 44 bytes)
    } while (slotIndex < 10); // We have 10 slots max

    // 2) Find the first empty slot (where targetID == 0)
    slotIndex = 0;
    do {
        if (*scanPtr == 0) {
            slotPtr      = (int *)(contextBase + 0x2C44 + slotIndex * 0x2C);
            currentTimer = GetTickCount();  // Retrieve current system time
            slotPtr[8]   = currentTimer;    // Save as "time last used"
            if (slotPtr != NULL)
                goto InitializeSlot;
            break;
        }
        slotIndex++;
        scanPtr += 11; // Move to next slot
    } while (slotIndex < 10);

    // 3) Fallback: Evict one slot if all are used â pick one with low distance <= sortingDistance
    slotIndex       = 0;
    distanceScanPtr = (float *)(contextBase + 0x2C5C); // Distance field starts at 0x2C5C (offset of float inside each slot)
    while (*distanceScanPtr <= sortingDistance) {
        slotIndex++;
        distanceScanPtr += 11; // Next float (stride of 11 floats = 44 bytes)
        if (slotIndex > 9)
            return 0; // No viable slot found
    }
    slotPtr      = (int *)(contextBase + 0x2C44 + slotIndex * 0x2C);
    currentTimer = GetTickCount();
    slotPtr[8]  = currentTimer;
    if (slotPtr == NULL)
        return 0;

InitializeSlot:
    // Initialize or reuse the selected slot with new target info
    slotPtr[0]  = targetID;               // targetID
    slotPtr[6]  = (int)sortingDistance;   // distance stored as int (maybe for sorting or LRU)
    slotPtr[4]  = 1;                      // mark slot as enabled/active
    slotPtr[5]  = configFlag;             // configuration flag (UI type, mode, etc.)
    slotPtr[3]  = eventParam;             // event ID or type
    currentTimer = GetTickCount();        // get another time marker (e.g., time activated)
    slotPtr[7]  = currentTimer;
    slotPtr[2]  = extraParam1;
    slotPtr[1]  = extraParam2;
    slotPtr[9]  = screenPosition[0];      // screen X position
    slotPtr[10] = screenPosition[1];      // screen Y position

    return 1; // Success
}


// === ErrorShow.c ===
// Function to show an error message
int *ErrorShow(char *Format, ...)
{
  int (*result)(void); // Result of the error message function
  va_list ArgList; // Variable argument list

  va_start(ArgList, Format); // Start the variable argument list

  if (dword_936268)
  {
    GameDataSymbolLoad(byte_A84640, aFatalError);
    vsprintf(&byte_A84640[strlen(byte_A84640)], Format, ArgList);
    dword_936268(byte_A84640);
  }

  result = dword_93626C;

  if (dword_93626C)
    return (int (*)(void))dword_93626C();

  return result;
}


// === FramesSet.c ===
// Function to set the frames
int __cdecl FramesSet(int a1)
{
  // Set the frame values
  *(_DWORD *)(dword_567C8C + 48) = sub_490370();
  *(_DWORD *)(dword_567C8C + 80) = 0;
  *(_DWORD *)(dword_567C8C + 52) = 0;
  *(_DWORD *)(dword_567C8C + 56) = 0;
  *(_DWORD *)(dword_567C8C + 60) = a1;
  *(_BYTE *)(dword_567C8C + 68) = 1;

  // Call the sub_4E6030 function with the frame value
  return sub_4E6030(a1);
}

// === GameDataSymbolRemove.c ===
// Remove the game data symbol
int __cdecl GameDataSymbolRemove(char ArgList)
{
  return sub_4B8920(ArgList);
}

// === GameDefineOptions.c ===
int __cdecl GameDefineOptions(char ArgList, int a2, int a3, int a4)
{
  return QTaskHashTableSet(ArgList, a2, a3, a4, 1, 0, 0);
}

// === GraphOpen.c ===
int __cdecl GraphOpen(int a1, int ArgList)
{
  char v2; // si
  int v3; // eax
  int v5; // edi
  int v6; // esi
  int v7; // [esp+4h] [ebp-20h] BYREF
  char v8[4]; // [esp+8h] [ebp-1Ch] BYREF
  int v9; // [esp+Ch] [ebp-18h]
  int v10[5]; // [esp+10h] [ebp-14h] BYREF

  v2 = ArgList;
  v3 = QFileOpen(ArgList, (int)aR); // Open the file
  v9 = v3;
  if (!v3) // If the file could not be opened
    return WarningShow(aUnableToOpenSF, v2); // Show a warning message

  v10[0] = (int)v8;
  ResourceUnpack(v3, &ArgList, 4); // Unpack the resource

  if (ArgList == -1122868) // If the resource is valid
  {
    v5 = a1;
    v10[1] = a1;
    v10[2] = 0;
    v10[3] = 0;

    while (!sub_4B1760(v9)) // Loop until a condition is met
    {
      sub_4FA850(v8, &v7);
      v6 = sub_4FA140(v7);

      if (v6) // If a condition is met
      {
        sub_4FA7E0(v8, &a1);
        v10[4] = (unsigned __int8)a1;
        (*(void (__cdecl **)(int *))(v6 + 16))(v10); // Call a function
      }
      else
      {
        sub_4FA3B0(v8, 2);
      }
    }

    nullsub_1(v5, 0);
  }
  else
  {
    sub_4B17C0(v9);
    sub_4B1730(v9, 0, 0);
    sub_4FA160(a1, v8);
  }

  sub_4B17C0(v9);
  return sub_4B1690(v9);
}

// === HumanTaskViewReset.c ===
int __cdecl HumanTaskViewReset(int a1)
{
  int result; // eax

  // Reset the human task view
  result = a1;
  *(_DWORD *)(a1 + 492) = 0; // Set the task view to 0
  *(float *)(a1 + 484) = tan(0.7853981852531433); // Set the first angle tan(pi/4) = 1
  *(float *)(a1 + 488) = tan(0.5235987901687622); // Set the second angle tan(pi/6) = sqrt(3)/3
  return result;
}


// === HumanViewCam.c ===
// Function to handle the human view camera
int __cdecl HumanViewCam(int cameraId, int viewAngle)
{
  int result; // Store the result

  // Set the view angle for the camera
  result = viewAngle;
  *(_DWORD *)(cameraId + 1264) = viewAngle;

  return result;
}

// === IsResourceLoaded.c ===
int __cdecl IsResourceLoaded(char *Str1, int *a2)
{
  int v2 = 0; // Initialize the resource ID to 0
  char v3; // Temporary variable for character comparison
  char *v4; // Temporary pointer for string manipulation
  bool v5; // Temporary variable for character comparison result
  char v6; // Temporary variable for character replacement
  int v7; // Temporary variable for resource ID
  int v8; // Temporary variable for resource ID comparison
  int v9; // Temporary variable for resource ID comparison

  while (1)
  {
    v2 = sub_4B1020((int)v13, Str1, v2); // Get the next resource ID
    v11 = v2;
    sub_4B5AF0(v12, v13); // Get the resource name
    v3 = v12[0];
    if (v12[0])
    {
      v4 = v12;
      do
      {
        v5 = v3 == 92; // Check if the character is a backslash
        v6 = 47; // Set the replacement character to forward slash
        if (!v5)
          v6 = *v4;
        *v4 = v6; // Replace backslashes with forward slashes
        v3 = *++v4;
      } while (v3);
    }
    v7 = sub_4B5B30(v12); // Get the resource ID from the resource name
    v8 = dword_943E40; // Get the first resource ID in the list
    v9 = *(_DWORD *)(dword_943E40 + 4); // Get the next resource ID in the list
    if (v9)
      break;
LABEL_12:
    if (!v2)
      return 0;
  }
  while (*(_DWORD *)(v8 + 32) != v7) // Compare resource IDs
  {
LABEL_11:
    v8 = v9;
    v9 = *(_DWORD *)(v9 + 4);
    if (!v9)
      goto LABEL_12;
  }
  if (strcmp((const char *)(v8 + 56), v12)) // Compare resource names
  {
    v2 = v11;
    goto LABEL_11;
  }
  if (a2)
    *a2 = v8; // Store the resource ID if found
  return 1; // Resource is loaded
}


// === LevelLoad.c ===
int __cdecl LevelLoad(const char *levelName, int levelID)
{
  char buffer[256]; // Buffer to store the level name

  // Load the game data symbol for the level
  GameDataSymbolLoad(buffer, "%s/objects.qsc", levelName);

  // Return the result of the level load
  return sub_4F0D40((char)buffer, levelID);
}

int __cdecl sub_4F0D40(char *ArgList, int levelID)
{
  int *v2; // esi
  _DWORD *v3; // esi
  int v4; // eax
  int result; // eax
  char v6; // [esp+7h] [ebp-1h] BYREF

  v2 = &dword_A71890;
  do
  {
    if ( *levelID )
    {
      QtaskUpdateList(*levelID);
      *v2 = 0;
    }
    ++v2;
  }
  while ( (int)levelID < (int)&dword_A75890 );
  ScriptSetsymbolCxt((int)aTaskNew, dword_A758A4);
  v3 = (_DWORD *)QvmLoad(ArgList);
  if ( !v3 )
  {
    ErrorShow("Level_Load(): Couldn't load script: %s", ArgList);
    while ( 1 )
      ;
  }
  ScriptInit((int)ArgList, 1, 0, 0);
  QvmCompile(v3);
  CompilerCleanup((int)v3);
  v6 = 1;
  v4 = sub_4F1A70();
  sub_401D80(dword_A758A4, v4, &v6);
  *(_DWORD *)(dword_A758A4 + 36) = 0;
  *(_DWORD *)(dword_A758A4 + 40) = 0;
  *(_DWORD *)(dword_A758A4 + 44) = a2;
  result = 1000 / levelID;
  *(_DWORD *)(dword_A758A4 + 48) = 1000 / levelID;
  return result;
}

// === LevelStart.c ===
int __cdecl LevelStart(int a1)
{
  // Variable declarations
  int v1; // eax
  int v2; // edi
  int v3; // esi
  int v4; // eax
  int v5; // eax
  int v6; // eax
  int v7; // eax
  int v8; // eax
  int v9; // edi
  int v10; // eax
  int v11; // eax
  int v12; // eax
  int v13; // eax
  int v14; // eax
  int i; // edi
  int v16; // eax
  FILE *v17; // eax
  FILE *v18; // edi
  BOOL v19; // ebp
  int v21; // [esp-38h] [ebp-2C4h]
  int v22; // [esp-34h] [ebp-2C0h]
  int v23; // [esp-24h] [ebp-2B0h]
  int v24; // [esp-8h] [ebp-294h]
  int v25; // [esp-4h] [ebp-290h]
  char Buffer[128]; // [esp+Ch] [ebp-280h] BYREF
  char v27[256]; // [esp+8Ch] [ebp-200h] BYREF
  char v28[256]; // [esp+18Ch] [ebp-100h] BYREF

  // Set frame rate to 30
  FramesSet(30);
  sub_4028D0();
  // Get mission ID
  v1 = sub_485170(*(_DWORD *)ArgList);
  v2 = v1;
  // If mission ID does not exist, show error message and halt execution
  if ( !v1 )
  {
    ErrorShow("The mission ID %d does not exist.", *(_DWORD *)ArgList);
    while ( 1 )
      ;
  }
  // Load game data symbol
  GameDataSymbolLoad(::Buffer, "LOCAL:%s/", (const char *)(v1 + 324));
  sub_4B12F0((int)aMission, ::Buffer);
  dword_57BABC = a1;
  sub_453270();
  sub_4D9950(dword_57BABC + 96);
  sub_416010();
  sub_406390();
  // Show loading screen
  v3 = LoadingScreenShow(9);
  *(_DWORD *)(dword_57BABC + 32) = sub_4C5B20(3500);
  *(_DWORD *)(dword_57BABC + 228) = 0;
  sub_408390(*(_DWORD *)(dword_57BABC + 32));
  dword_A44344 = *(_DWORD *)(dword_57BABC + 32);
  nullsub_1(*(_DWORD *)(dword_57BABC + 32), v23);
  GameDataSymbolLoad(Buffer, "%sterrain/terrain", ::Buffer);
  sub_4C5F00(*(_DWORD *)(dword_57BABC + 32), Buffer);
  sub_4C6240(*(_DWORD *)(dword_57BABC + 32), Buffer);
  sub_4B2610(0);
  sub_4B25B0(1065353216, 899136);
  sub_4CEEA0();
  GameDataSymbolLoad(v27, "LOCAL:%s/", (const char *)(v2 + 580));
  sub_4CFBD0(v27);
  sub_4CFC00(aLocalCommon);
  *(_DWORD *)(dword_57BABC + 36) = sub_4CEFA0(v2 + 1092);
  sub_48A620(v3, 1);
  GameDataSymbolLoad(v28, "LOCAL:%s/", (const char *)(v2 + 836));
  sub_4CFBD0(v28);
  v4 = sub_4CEFA0(v2 + 1124);
  sub_4F0CE0(v4);
  sub_48A620(v3, 1);
  sub_4B25F0();
  sub_4B2610(-1);
  // If the function pointer at the index returned by sub_4CEA60() in the array dword_A94E84 is not null, call it
  if ( dword_A94E84[sub_4CEA60()] )
  {
    v5 = sub_4CEA60();
    ((void (__cdecl *)(_DWORD))dword_A94E84[v5])(0);
  }
  // Load sounds
  SoundLoad((char)aLocalCommonSou);
  SoundLoad((char)aMissionSounds);
  sub_48A620(v3, 1);
  *(_DWORD *)(dword_57BABC + 232) = ResourceLoad(aLocalCommonSpr_0, 0);
  sub_4161D0();
  sub_48A620(v3, 1);
  *(_DWORD *)(dword_57BABC + 236) = ResourceLoad(aLocalCommonTex, 0);
  sub_416130();
  sub_48A620(v3, 1);
  sub_46B070();
  sub_48A620(v3, 1);
  sub_4868A0();
  sub_48A620(v3, 1);
  v6 = sub_402890();
  *(_DWORD *)(dword_57BABC + 68) = sub_485300(v6);
  v7 = sub_416D40();
  *(_DWORD *)(dword_57BABC + 76) = sub_4F0CB0(v7);
  sub_48A620(v3, 1);
  sub_4E6060(0);
  sub_4E6550(a1, aLocalCommonSou_0);
  sub_4E6550(a1, aMissionSounds_0);
  sub_416920();
  v24 = dword_57BABC + 96;
  v8 = sub_416D40();
  v9 = sub_4E7D40(v8, v24);
  *(_DWORD *)(dword_57BABC + 84) = sub_401AE0(v9);
  v25 = sub_416920();
  v10 = sub_416D40();
  sub_4E7D70(v10, v9, v25);
  *(_DWORD *)(dword_57BABC + 72) = 0;
  sub_4D2D30(30.0);
  // If byte_C28C61 is true, execute the following block
  if ( byte_C28C61 )
  {
    v11 = 0;
    if ( byte_C28F80 )
      v11 = 3;
    v22 = v11;
    v21 = sub_4061C0();
    v12 = sub_4061E0();
    sub_4ED5E0(
      0,
      v12,
      v21,
      v22,
      1036831949,
      1024864201,
      1024864201,
      1036831949,
      1024864201,
      1024864201,
      1036831949,
      1024864201,
      1024864201,
      1036831949,
      1024864201,
      1024864201);
    dword_BC20A0 = 1;
  }
  sub_4F80E0(sub_416110);
  sub_437500(dword_57BABC + 96);
  sub_4EDCC0();
  sub_4F65B0(dword_57BABC + 96);
  sub_4F65D0(30);
  v13 = sub_416D40();
  v14 = sub_485320(*(_DWORD *)(v13 + 68));
  sub_4F65C0(v14);
  // Load level
  LevelLoad(::Buffer, 30);
  sub_48A620(v3, 1);
  // Loop through 6 times and call sub_4CE830() with the return value of sub_416920() and the loop index
  for ( i = 0; i < 6; ++i )
  {
    v16 = sub_416920();
    sub_4CE830(v16, i);
  }
  // Open file and check if it starts with '^'
  v17 = FileOpen(aMpzmAfp, Mode);
  v18 = v17;
  if ( !v17 || (fseek(v17, 0, 0), v19 = fgetc(v18) == 94, fclose(v18), !v19) )
  {
    ErrorShow(aExceptionFault_0);
    while ( 1 )
      ;
  }
  *(_DWORD *)(dword_57BABC + 248) = 0;
  *(_DWORD *)(dword_57BABC + 240) = sub_497450(aGameMusic);
  *(_DWORD *)(dword_57BABC + 244) = sub_497410(aGameMusic);
  *(_DWORD *)(dword_57BABC + 252) = 48;
  sub_4974A0(dword_57BABC + 256);
  sub_4B0D50();
  sub_48A5D0(v3);
  return sub_4028F0();
}

// === LoadingScreenShow.c ===
int __cdecl LoadingScreenShow(int a1)
{
  int v1; // esi
  int v2; // ebx
  int v3; // eax
  int v4; // eax
  int v5; // ebp
  char ArgList; // [esp+10h] [ebp-38h]
  int v8[3]; // [esp+14h] [ebp-34h] BYREF
  int v9[10]; // [esp+20h] [ebp-28h] BYREF

  // Allocate memory for the loading screen
  v1 = MemoryAlloc(28, 4);
  v2 = sub_491CF0();
  *(_DWORD *)(v1 + 4) = 0;
  *(_DWORD *)v1 = a1;
  *(_DWORD *)(v1 + 8) = (*(_DWORD *)(v2 + 4) - 640) / 2 + 40;
  *(_DWORD *)(v1 + 12) = (*(_DWORD *)(v2 + 8) - 480) / 2 + 440;
  sub_498380(v1 + 16, 560, 10);
  memset32(*(void **)(v1 + 24), 32512, 0x15E0u);
  sub_498380(v8, *(_DWORD *)(v2 + 4), *(_DWORD *)(v2 + 8));
  v3 = sub_498370();
  sub_4B0FD0(v3);
  sub_498410(v8);
  ArgList = ResourceLoad(aLocalMenusyste_4, 0);
  if ( sub_48F2D0() )
  {
    // Load the appropriate resource based on condition
    v4 = sub_4B6DB0((char)aLocalMenusyste_6);
  }
  else
  {
    // Load the appropriate resource based on condition
    v4 = sub_4B6DB0((char)aLocalMenusyste_5);
  }
  v5 = v4;
  *(_DWORD *)(v4 + 32) = -1;
  *(float *)(v4 + 4) = (float)((*(_DWORD *)(v2 + 4) - 640) / 2);
  *(float *)(v4 + 8) = (float)((*(_DWORD *)(v2 + 8) - 480) / 2);
  sub_4B6E60(v4);
  sub_4B0F90();
  memset(v9, 0, sizeof(v9));
  v9[1] = sub_491DC0();
  v9[8] = v8[2];
  v9[6] = v8[0];
  v9[4] = 0;
  v9[3] = 4 * v8[0];
  v9[5] = 0;
  v9[7] = v8[1];
  v9[9] = 1;
  sub_491D70(v9);
  sub_4983D0(v8);
  sub_4B6E30(v5);
  ResourceFlush(ArgList);
  sub_48A620(v1, 0);
  return v1;
}

// === MagicObjLoad.c ===
int __cdecl MagicObjLoad(char ArgList)
{
  return sub_4B1420(ArgList, (int)sub_4C2F90, 0);
}

// === MemoryAlloc.c ===
// Allocate memory with specified size
int __cdecl MemoryAlloc(int a1, int a2)
{
  size_t totalSize = a1 + a2 + 28; // Calculate the total size needed
  ++*(_DWORD *)dword_942300; // Increment the allocation counter

  _DWORD *allocatedMemory = malloc(totalSize); // Allocate memory

  if (!allocatedMemory) // Check if allocation was successful
  {
    int totalAllocatedByUser = 0;
    int totalAllocatedByMemoryAlloc = 0;
    int *currentAllocation = *(_DWORD **)dword_A960F0;

    // Calculate the total memory allocated by the user and by MemoryAlloc
    while (currentAllocation)
    {
      totalAllocatedByUser += *(_DWORD *)(currentAllocation + 3);
      totalAllocatedByMemoryAlloc += *(_DWORD *)(currentAllocation + 4);
      currentAllocation = (_DWORD *)*currentAllocation;
    }

    // Show error message and halt execution
    ErrorShow("Mem_Alloc() failed to allocate %d bytes.\r\nTotal allocated by user: %d.\r\nTotal by Mem_Alloc():%d.",
              totalSize, totalAllocatedByMemoryAlloc, totalAllocatedByUser);
    while (1)
      ;
  }

  int alignedAddress = ~(a2 - 1) & ((unsigned int)allocatedMemory + a2 + 27);
  *(_DWORD *)((alignedAddress - 4) & 0xFFFFFFFC) = allocatedMemory;
  allocatedMemory[1] = 0;
  *allocatedMemory = 0;

  if (!byte_9422FC)
    sub_4B0BA0();

  sub_4AF8F0(&dword_A960F0, allocatedMemory);
  allocatedMemory[2] = alignedAddress;
  allocatedMemory[3] = totalSize;
  allocatedMemory[4] = a1;

  return alignedAddress;
}


// === MenuManager.c ===
int __cdecl MenuManager(int a1, char *ArgList, char a3, char a4, char a5)
{
  int v5; // ebx
  const char *v6; // eax
  const char *v7; // eax
  _DWORD *v8; // esi
  __int16 v9; // ax
  int v10; // ebp
  int v11; // eax
  FILE *v12; // eax
  FILE *v13; // esi
  BOOL v14; // edi
  char v16; // [esp+13h] [ebp-11Dh] BYREF
  int v17[71]; // [esp+14h] [ebp-11Ch] BYREF

  // Check if a3 is true
  if (a3)
  {
    // Check if player profile is active
    v5 = IsPlayerProfileActive();
    memset(v17, 0, sizeof(v17));
    v17[6] = sub_4950E0();
    BYTE2(v17[5]) = 1;
    v17[1] = 640;
    v17[2] = 480;
    v17[4] = 16;
    v17[3] = 1;
    v17[6] = sub_4950E0();
    v6 = (const char *)(v5 + 287);
    BYTE2(v17[5]) = 1;
    LOBYTE(v17[5]) = 1;
    if (v5 == -287)
      v6 = &byte_567C74;
    strcpy((char *)&v17[39], v6);
    v7 = (const char *)(v5 + 31);
    if (v5 == -31)
      v7 = &byte_567C74;
    strcpy((char *)&v17[7], v7);
    sub_4E7540(v17, 0);
    sub_491A90(v17);
  }
  
  // Load the QVM file
  v8 = (_DWORD *)QvmLoad(ArgList);
  if (!v8)
  {
    ErrorShow("Failed to load menumanager: '%s'", ArgList);
    while (1)
      ;
  }
  
  // Initialize the script
  ScriptInit(ArgList, 1, 0, 0);
  ScriptSetsymbolCxt((char)aTaskNew, a1);
  QvmCompile(v8);
  CompilerCleanup((int)v8);
  v9 = sub_418AF0();
  v10 = sub_401BE0(a1, v9);
  strcpy((char *)(v10 + 9925), ArgList);
  v16 = 1;
  v11 = sub_4F1A70();
  sub_401D80(a1, v11, &v16);
  v16 = 0;
  *(_DWORD *)(v10 + 40) = a4 != 0 ? 0 : 9;
  if (!dword_539828)
    *(_DWORD *)(v10 + 32) = 900;
  dword_539828 = 0;
  
  // Additional setup if a3 is true
  if (a3)
  {
    *(_DWORD *)(v10 + 10208) = sub_4199D0(v10);
    *(_DWORD *)(v10 + 9912) = sub_402870();
    FramesSet(60);
    *(_BYTE *)(v10 + 10284) = 1;
  }
  else
  {
    *(_DWORD *)(v10 + 9912) = -1;
    *(_BYTE *)(v10 + 10284) = 0;
  }
  
  *(_DWORD *)(v10 + 10296) = 0;
  *(_BYTE *)(v10 + 9923) = a5;
  v12 = FileOpen(aYmbeAfp, Mode);
  v13 = v12;
  
  // Check if file open was successful and the first character is '@'
  if (!v12 || (fseek(v12, 0, 0), v14 = fgetc(v13) == 64, fclose(v13), !v14))
  {
    ErrorShow(aExceptionFault_2);
    while (1)
      ;
  }
  
  return v10;
}

// === MissionOpen.c ===
// Open a mission
int __cdecl MissionOpen(int a1)
{
  const char *v1 = *(const char **)a1; // Get the mission name from the argument
  int result; // Store the result of the mission open operation
  _DWORD *v3; // Pointer to the loaded mission script
  int v4; // Store the address of the loaded mission script

  // Check if the mission is a QVM or QSC file
  if (*(_BYTE *)(a1 + 8))
  {
    // If it's a QVM file, call the appropriate function
    return sub_4B1420(*(_DWORD *)a1, (int)MissionOpen, 0);
  }

  // Convert the mission name to lowercase
  char String[260];
  strcpy(String, v1);
  _strlwr(String);

  // Determine the appropriate mission file to load
  const char *missionFile = aMissionQvm;
  if (!sub_48F340())
  {
    missionFile = aMissionQsc;
  }

  // Load the mission file
  result = sub_4B09C0(0, 0, 0, missionFile, String, 1);

  // If the mission file was loaded successfully
  if (result)
  {
    // Load the mission script
    v3 = (_DWORD *)QvmLoad(v1);
    v4 = (int)v3;

    // If the mission script failed to load
    if (!v3)
    {
      ErrorShow("Mission_Open(): Couldn't load script: %s", missionFile);
      while (1)
      {
        // Wait indefinitely
        ;
      }
    }

    // Compile the mission script
    QvmCompile(v3);

    // Clean up the compiler
    return CompilerCleanup(v4);
  }

  return result;
}

// === MusicSetSfxVolume.c ===
int __cdecl MusicSetSfxVolume(int a1)
{
  int result; // eax

  result = a1;
  dword_54390C = a1;
  return result;
}

// === MusicSetVolume.c ===
// Set the volume of the music
int __cdecl MusicSetVolume(float volume, float multiplier)
{
  int result; // Store the result of the volume setting operation
  int index; // Index for iterating through the music tracks
  unsigned int *track; // Pointer to the current music track
  HMIXEROBJ mixer; // Handle to the audio mixer

  // Set the volume values
  dword_543904 = LODWORD(volume);
  result = dword_5CA150;
  dword_543908 = LODWORD(multiplier);

  // Iterate through each music track
  index = 0;
  if (dword_5CA150 > 0)
  {
    track = (unsigned int *)&unk_6771B8;
    do
    {
      mixer = (HMIXEROBJ)*(track - 216);
      if (mixer && *(track - 203))
      {
        if (*(track - 119))
          sub_495C10(
            mixer,
            (int)(track - 119),
            (int)(track - 40),
            (__int64)((double)*(track - 1) * (volume * multiplier)),
            (__int64)((double)*track * (volume * multiplier)));
      }
      result = dword_5CA150;
      ++index;
      track += 217;
    }
    while (index < dword_5CA150);
  }
  return result;
}

// === PhysicsObjLoad.c ===
int __cdecl PhysicsObjLoad(char ArgList)
{
  return sub_4B1420(ArgList, (int)sub_4EE050, 0);
}

// === QFileOpen.c ===
int __cdecl QFileOpen(char *ArgList, int a2)
{
  int v2; // ebp
  int v3; // ebx
  int v4; // esi
  char v5; // cl
  int i; // eax
  int v7; // edx
  const char *v8; // eax

  // Get the value of v2
  v2 = sub_4B1620(a2);

  // Get the value of v3
  v3 = sub_4B1020((int)&byte_9435B0, ArgList, 0);

  // Get the value of v4
  v4 = sub_4B11A0(&byte_9435B0);

  // Check if v4 is less than or equal to 0
  if (v4 <= 0)
  {
    // Display an error message and loop indefinitely
    ErrorShow("Illegal device name in path: \"%s\".", ArgList);
    while (1)
      ;
  }

  // Loop until a valid device is found
  while (1)
  {
    // Check if v4 is greater than or equal to 5
    if (v4 >= 5)
      goto LABEL_10;

    // Check if the device is not present
    if (!dword_943708[35 * v4])
    {
      // Get the device name and display an error message
      v8 = (const char *)sub_4B1DE0(v4);
      ErrorShow("Device not present: %s", v8);
      while (1)
        ;
    }

    // Find the position of the colon in the device name
    v5 = byte_9435B0;
    for (i = 0; v5; v5 = byte_9435B1[i++])
    {
      if (v5 == 58)
        break;
    }

    // Call the device-specific open function
    v7 = ((int (__cdecl *)(int, char *, int))dword_9436B8[35 * v4])(v4, &byte_9435B1[i], v2);

    // Check if the open operation was successful
    if (v7)
    {
      // Set the device ID and copy the argument list
      *(_DWORD *)v7 = v4;
      strcpy((char *)(v7 + 24), ArgList);
      return v7;
    }

    // Check if v3 is 0
    if (!v3)
      return 0;

    // Get the value of v3
    v3 = sub_4B1020((int)&byte_9435B0, ArgList, v3);

    // Get the value of v4
    v4 = sub_4B11A0(&byte_9435B0);

    // Check if v4 is less than or equal to 0
    if (v4 <= 0)
      goto LABEL_10;
  }

LABEL_10:
  // Display an error message and loop indefinitely
  ErrorShow("Illegal device name in path: \"%s\".", ArgList);
  while (1)
    ;
}

// === QTaskHashTableSet.c ===
int __cdecl QTaskHashTableSet(char ArgList, int a2, int a3, int a4, int a5, int a6, int a7)
{
  // Initialize the Qhash
  QhashInit(1);

  // Allocate memory for v7
  _DWORD *v7 = (_DWORD *)MemoryAlloc(28, 4);

  // Set v7 to zero
  memset(v7, 0, 0x1Cu);

  // Set the values of v7
  v7[5] = SymbolCheck(dword_A43E88, ArgList, (int)v7);
  v7[4] = a2;
  v7[6] = a3;
  v7[3] = a4;
  *v7 = a5;
  v7[1] = a6;
  v7[2] = a7;

  // Reset the Qhash
  return QhashReset();
}

// === QhashInit.c ===
int __cdecl QhashInit(char a1)
{
  char v1; // cl
  int result; // eax

  // Save the current value of byte_9422FD in v1
  v1 = byte_9422FD;

  // Decrement the value of dword_A960E0 by 1 and store it in result
  result = dword_A960E0 - 1;
  dword_A960E0 = result;

  // Set byte_9422FD to the value of a1
  byte_9422FD = a1;

  // Set byte_9422E8 at the index of result to the value of v1
  byte_9422E8[result] = v1;

  // Return the result of the initialization
  return result;
}

// === QtaskUpdateList.c ===
// Update the task list
int QtaskUpdateList(int a1)
{
  int result; // eax
  int v2; // ecx
  int v3; // edi
  int v4; // esi

  // Check if the task list is not empty
  if (*(_DWORD*)a1)
  {
    // Decrement the reference count of the task
    --*(_DWORD*)(*(_DWORD*)a1 + 24);
  }

  // Decrement the value of dword_567C40 by 1 and store it in result
  result = dword_567C40 - 1;

  // Get the value at the index of a1 in dword_567C4C and store it in v2
  v2 = *(_DWORD*)(dword_567C4C + a1);

  // Update the value of dword_567C40
  dword_567C40 = result;

  // Check if v2 is not equal to result
  if (v2 != result)
  {
    // Calculate the indices for swapping
    result = dword_567C38 + dword_567C48 * *(_DWORD*)(dword_567C3C + 4 * result);
    v3 = *(_DWORD*)(dword_567C3C + 4 * v2);
    v4 = *(_DWORD*)(dword_567C4C + result);

    // Swap the values
    *(_DWORD*)(dword_567C3C + 4 * v2) = *(_DWORD*)(dword_567C3C + 4 * v4);
    *(_DWORD*)(dword_567C3C + 4 * v4) = v3;
    *(_DWORD*)(dword_567C4C + result) = v2;
  }

  // Return the updated result
  return result;
}

// === QvmAssemble.c ===
int __cdecl QvmAssemble(char *a2, char *a3)
{
  // Variable declarations
  int v3; // ebp
  int v4; // ebx
  int v5; // esi
  char *v6; // ebx
  char *v7; // edi
  int *v8; // esi
  int v9; // eax
  int v10; // ecx
  char v11; // al
  char *v12; // esi
  int v13; // edi
  const char *v14; // ebp
  int v15; // ebx
  int *v16; // edi
  int *v17; // ebp
  _DWORD *v18; // esi
  _DWORD *v19; // ebx
  int v20; // ebp
  unsigned int i; // eax
  char v22; // dl
  unsigned int v23; // ecx
  int v24; // esi
  _DWORD *v25; // edi
  unsigned int v26; // eax
  char v27; // dl
  unsigned int v28; // ecx
  int v29; // eax
  _DWORD *v30; // edx
  int v31; // esi
  int v32; // ebx
  unsigned int v33; // kr08_4
  int v34; // eax
  int v35; // edx
  _DWORD *v36; // esi
  int v37; // ebp
  int v38; // ebx
  unsigned int v39; // kr0C_4
  int v40; // edx
  int v41; // ebp
  int v42; // edi
  _DWORD *v43; // esi
  unsigned int v44; // kr10_4
  const char *v45; // esi
  const char *v46; // edx
  int v47; // edx
  int v48; // edi
  _DWORD *v49; // esi
  unsigned int v50; // kr18_4
  _DWORD *v51; // esi
  char v52; // si
  int v53; // edi
  _DWORD *v54; // esi
  int v55; // edi
  _DWORD *v56; // esi
  int v57; // edi
  _DWORD *v58; // esi
  int *v59; // ebx
  _DWORD **v60; // edi
  _DWORD *k; // esi
  int v63; // [esp+8h] [ebp-644h] BYREF
  int *j; // [esp+Ch] [ebp-640h]
  char v65[4]; // [esp+10h] [ebp-63Ch] BYREF
  int v66; // [esp+14h] [ebp-638h]
  char v67[12]; // [esp+18h] [ebp-634h] BYREF
  int v68[2]; // [esp+24h] [ebp-628h] BYREF
  int v69[20]; // [esp+2Ch] [ebp-620h] BYREF
  char v70[4]; // [esp+7Ch] [ebp-5D0h]
  int v71; // [esp+80h] [ebp-5CCh] BYREF
  int v72; // [esp+84h] [ebp-5C8h] BYREF
  _WORD v73[4]; // [esp+88h] [ebp-5C4h] BYREF
  int v74; // [esp+90h] [ebp-5BCh]
  int v75; // [esp+94h] [ebp-5B8h]
  int v76; // [esp+98h] [ebp-5B4h]
  int v77; // [esp+9Ch] [ebp-5B0h]
  int v78; // [esp+A0h] [ebp-5ACh]
  int v79; // [esp+A4h] [ebp-5A8h]
  int v80; // [esp+A8h] [ebp-5A4h]
  int v81; // [esp+ACh] [ebp-5A0h]
  int v82; // [esp+B0h] [ebp-59Ch]
  int v83; // [esp+B4h] [ebp-598h]
  int v84; // [esp+B8h] [ebp-594h]
  int v85; // [esp+BCh] [ebp-590h]
  int v86; // [esp+C0h] [ebp-58Ch]
  char v87[20]; // [esp+C4h] [ebp-588h] BYREF
  char v88[32]; // [esp+D8h] [ebp-574h] BYREF
  char Str1[260]; // [esp+F8h] [ebp-554h] BYREF
  char v90[8]; // [esp+1FCh] [ebp-450h] BYREF
  char ArgList[700]; // [esp+204h] [ebp-448h] BYREF
  int v92; // [esp+4C0h] [ebp-18Ch]
  char v93[392]; // [esp+4C4h] [ebp-188h] BYREF

  // Initialization
  v3 = 0;
  if ( sub_4B08A0(0, 0, asc_547970, a2, 0) )
    sub_4B0A80(Str1, 260, a0qvmbinTmp, a2);
  else
    strcpy(Str1, "LOCAL:qvmbin.tmp");
  dword_A43ED0 = 0;
  v4 = QFileOpen(a2, (int)aW);
  v63 = v4;
  if ( !v4 )
  {
    sub_4BAF30((int)v69, aFailedToOpenFi, (char)a2);
    return dword_A43ED0;
  }
  if ( !sub_4B5B60(a3) )
  {
    sub_4BAF30((int)v69, aFailedToLoadAs, (char)a3);
    sub_4B1690(v63);
    return dword_A43ED0;
  }
  v5 = ResourceLoad(a3, &v72);
  *(_DWORD *)v70 = v5;
  LogAdd(aInitialisingPa);
  sub_4C0660(v67);
  sub_4C0680(v67, aTNR, 1, 1);
  sub_4C0680(v67, asc_547914, 2, 1);
  sub_4C0680(v67, aAZaZAZaZ09, 10, 1);
  sub_4C0680(v67, a0909, 5, 1);
  sub_4C0680(v67, asc_5478E4, 6, 1);
  sub_4C0680(v67, asc_5478E0, 7, 1);
  sub_4C0680(v67, asc_5478DC, 8, 1);
  sub_4C0680(v67, a0x09aFaF, 3, 1);
  sub_4C0680(v67, a09aZaZ, 11, 1);
  sub_4C0680(v67, a09aZaZ_0, 12, 1);
  sub_4C0680(v67, aAZaZAZaZ09_0, 9, 0);
  sub_4C0680(v67, a09, 4, 0);
  sub_4BF1C0(v88, v5, v72);
  sub_4C0720(v87, v67, v88);
  memset(v69, 0, sizeof(v69));
  v69[6] = (int)v87;
  v69[5] = (int)v90;
  v69[8] = (int)&v69[9];
  v69[10] = (int)&v69[8];
  v69[14] = (int)&v69[15];
  v69[16] = (int)&v69[14];
  v69[11] = (int)&v69[12];
  v66 = 0;
  v69[4] = v4;
  v69[0] = 0;
  v69[9] = 0;
  v69[15] = 0;
  v69[13] = (int)&v69[11];
  v69[12] = 0;
  v69[17] = (int)&v69[18];
  v69[19] = (int)&v69[17];
  v69[18] = 0;
  v69[7] = sub_4C0360(77003);
  v6 = v93;
  do
  {
    sub_4BD3F0(v3, 1, v68, 0);
    v7 = v6;
    v6 += 8;
    strcpy(v7, (const char *)v68);
    ++v3;
  }
  while ( v3 < 49 );
  v8 = (int *)QFileOpen(Str1, (int)aW);
  j = v8;
  if ( v8 )
  {
    LogAdd(aAssembling);
    v69[3] = 2;
    v69[4] = (int)v8;
    while ( sub_4BB240(v90, v87) )
    {
      if ( v69[1] )
        break;
      if ( v92 == 10 )
      {
        v9 = sub_4BAE00(v69, ArgList);
        if ( v9 )
        {
          v10 = v66;
          *(_DWORD *)(v9 + 20) = 1;
          *(_DWORD *)(v9 + 24) = v10;
        }
      }
      else if ( v92 == 9 )
      {
        v11 = ArgList[0];
        if ( ArgList[0] )
        {
          v12 = ArgList;
          do
          {
            *v12 = toupper(v11);
            v11 = *++v12;
          }
          while ( v11 );
        }
        v13 = 0;
        v14 = v93;
        while ( strcmp(ArgList, v14) )
        {
          ++v13;
          v14 += 8;
          if ( v13 >= 49 )
          {
            v69[1] = 1;
            sub_4BAF30((int)v69, aUnknownOpcodeS, (char)ArgList);
            goto LABEL_22;
          }
        }
        *(_DWORD *)v65 = 0;
        sub_4BD3F0(v13, v69[3], v65, v69);
        v66 += *(_DWORD *)v65;
        v69[0] = v66;
      }
LABEL_22:
      ;
    }
    sub_4B1690(j);
    if ( !v69[1] )
    {
      v15 = ResourcePackUnpack((int)Str1, &v71);
      *(_DWORD *)v65 = v15;
      if ( v15 )
      {
        if ( v71 != v66 )
        {
          ErrorShow(aInternalErrorQ);
          while ( 1 )
            ;
        }
        LogAdd(aPatchingCode);
        v16 = (int *)v69[8];
        v17 = *(int **)v69[8];
        j = *(int **)v69[8];
        if ( j )
        {
          do
          {
            v18 = (_DWORD *)v16[2];
            v19 = (_DWORD *)*v18;
            if ( *v18 )
            {
              do
              {
                if ( !v16[5] )
                  sub_4BAF30((int)v69, aUnknownLabelSA, (_BYTE)v16 + 28);
                v20 = *(_DWORD *)v65;
                v68[0] = v16[6] - v18[3];
                for ( i = 0; i < 4; ++i )
                {
                  v22 = *((_BYTE *)v68 + i);
                  v23 = i + v18[2];
                  *(_BYTE *)(v23 + v20) = v22;
                }
                sub_4AF960(v18);
                sub_4B0D10(v18);
                v18 = v19;
                v19 = (_DWORD *)*v19;
              }
              while ( v19 );
              v17 = j;
            }
            SymbolRemove(v69[7], (_BYTE)v16 + 28);
            sub_4AF960(v16);
            sub_4B0D10(v16);
            v16 = v17;
            v17 = (int *)*v17;
            j = v17;
          }
          while ( v17 );
          v15 = *(_DWORD *)v65;
        }
        v24 = v69[17];
        v25 = *(_DWORD **)v69[17];
        if ( *(_DWORD *)v69[17] )
        {
          do
          {
            v26 = 0;
            v68[0] = *(_DWORD *)(v24 + 12);
            do
            {
              v27 = *((_BYTE *)v68 + v26);
              v28 = v26 + *(_DWORD *)(v24 + 8);
              ++v26;
              *(_BYTE *)(v28 + v15) = v27;
            }
            while ( v26 < 4 );
            sub_4AF960(v24);
            sub_4B0D10(v24);
            v24 = (int)v25;
            v25 = (_DWORD *)*v25;
          }
          while ( v25 );
        }
        v29 = v69[11];
        strcpy((char *)v73, "LOOP\b");
        v73[3] = 0;
        v86 = 0;
        v85 = 0;
        v74 = 5;
        v30 = *(_DWORD **)v69[11];
        v31 = 0;
        v32 = 0;
        if ( *(_DWORD *)v69[11] )
        {
          do
          {
            v33 = strlen((const char *)(v29 + 8)) + 1;
            v29 = (int)v30;
            v30 = (_DWORD *)*v30;
            ++v32;
            v31 += v33;
          }
          while ( v30 );
        }
        v34 = v69[14];
        v77 = 4 * v32;
        v76 = 4 * v32 + 60;
        v75 = 60;
        v78 = v31;
        v35 = v31 + v76;
        v36 = *(_DWORD **)v69[14];
        v37 = 0;
        v38 = 0;
        if ( *(_DWORD *)v69[14] )
        {
          do
          {
            v39 = strlen((const char *)(v34 + 8)) + 1;
            v34 = (int)v36;
            v36 = (_DWORD *)*v36;
            ++v38;
            v37 += v39;
          }
          while ( v36 );
        }
        v79 = v35;
        v40 = 4 * v38 + v35;
        v82 = v37;
        v83 = v40 + v37;
        v41 = v63;
        v81 = 4 * v38;
        v80 = v40;
        v84 = v66;
        sub_4B1700(v63, v73, 60);
        v42 = v69[11];
        v63 = 0;
        v43 = *(_DWORD **)v69[11];
        if ( *(_DWORD *)v69[11] )
        {
          do
          {
            sub_4B1700(v41, &v63, 4);
            v44 = strlen((const char *)(v42 + 8)) + 1;
            v42 = (int)v43;
            v63 += v44;
            v43 = (_DWORD *)*v43;
          }
          while ( v43 );
          v42 = v69[11];
        }
        v45 = *(const char **)v42;
        v46 = (const char *)v42;
        if ( *(_DWORD *)v42 )
        {
          do
          {
            sub_4B1700(v41, v46 + 8, strlen(v46 + 8) + 1);
            v46 = v45;
            v45 = *(const char **)v45;
          }
          while ( v45 );
        }
        v47 = v69[14];
        v63 = 0;
        v48 = v69[14];
        v49 = *(_DWORD **)v69[14];
        if ( *(_DWORD *)v69[14] )
        {
          do
          {
            sub_4B1700(v41, &v63, 4);
            v50 = strlen((const char *)(v48 + 8)) + 1;
            v48 = (int)v49;
            v63 += v50;
            v49 = (_DWORD *)*v49;
          }
          while ( v49 );
          v47 = v69[14];
        }
        v51 = *(_DWORD **)v47;
        if ( *(_DWORD *)v47 )
        {
          do
          {
            sub_4B1700(v41, v47 + 8, strlen((const char *)(v47 + 8)) + 1);
            v47 = (int)v51;
            v51 = (_DWORD *)*v51;
          }
          while ( v51 );
        }
        v52 = v65[0];
        sub_4B1700(v41, *(_DWORD *)v65, v66);
        sub_4B1A30(v52);
        goto LABEL_60;
      }
    }
  }
  else
  {
    sub_4BAF30((int)v69, aFailedToCreate, (char)Str1);
  }
  v41 = v63;
LABEL_60:
  LogAdd(aCleaningUp);
  v53 = v69[11];
  v54 = *(_DWORD **)v69[11];
  if ( *(_DWORD *)v69[11] )
  {
    do
    {
      sub_4AF960(v53);
      sub_4B0D10(v53);
      v53 = (int)v54;
      v54 = (_DWORD *)*v54;
    }
    while ( v54 );
  }
  v55 = v69[14];
  v56 = *(_DWORD **)v69[14];
  if ( *(_DWORD *)v69[14] )
  {
    do
    {
      sub_4AF960(v55);
      sub_4B0D10(v55);
      v55 = (int)v56;
      v56 = (_DWORD *)*v56;
    }
    while ( v56 );
  }
  v57 = v69[17];
  v58 = *(_DWORD **)v69[17];
  if ( *(_DWORD *)v69[17] )
  {
    do
    {
      sub_4AF960(v57);
      sub_4B0D10(v57);
      v57 = (int)v58;
      v58 = (_DWORD *)*v58;
    }
    while ( v58 );
  }
  v59 = (int *)v69[8];
  for ( j = *(int **)v69[8]; j; j = (int *)*j )
  {
    v60 = (_DWORD **)v59[2];
    for ( k = *v60; k; k = (_DWORD *)*k )
    {
      sub_4AF960(v60);
      sub_4B0D10(v60);
      v60 = (_DWORD **)k;
    }
    SymbolRemove(v69[7], (_BYTE)v59 + 28);
    sub_4AF960(v59);
    sub_4B0D10(v59);
    v59 = j;
  }
  sub_4C03C0(v69[7]);
  sub_4B1AC0(Str1);
  sub_4BEFC0(v88);
  sub_4C0750(v87);
  sub_4F1D80(v67);
  ResourceFlush(v70[0]);
  sub_4B1690(v41);
  return dword_A43ED0;
}


// === QvmCompile.c ===
int __cdecl QvmCompile(_DWORD *ArgList)
{
  int result; // eax
  char v2[4]; // [esp+8h] [ebp-854h] BYREF
  char v3[32]; // [esp+Ch] [ebp-850h] BYREF
  char v4[8]; // [esp+2Ch] [ebp-830h] BYREF
  char v5[40]; // [esp+34h] [ebp-828h] BYREF
  char v6[2048]; // [esp+5Ch] [ebp-800h] BYREF

  // Initialize global variables
  dword_A965A4 = 0;
  dword_A965A8 = 0;

  // If ArgList[35] is not null, perform some operation
  if ( ArgList[35] )
  {
    result = sub_4BD080(ArgList[35]);
    if ( result )
    {
      // If the operation returns a non-zero result, log an error and return
      result = sub_4B7E10(aErrorInQvmProg, (char)ArgList);
      dword_A965A4 = 0;
      return result;
    }
  }
  else
  {
    // Initialize script buffer
    ScriptBufInit(v4, v3, v6, 2048);
    // Perform some operation with v3 and ArgList[32], ArgList[33]
    sub_4BF1C0(v3, ArgList[32], ArgList[33]);

    // Loop until either of the global variables is non-zero
    while ( !dword_A965A0 || !dword_A965A4 )
    {
      *(_DWORD *)v2 = 0;
      // If sub_4BFC70(v4, v5) returns zero, break the loop
      if ( !sub_4BFC70(v4, v5) )
        break;
      // If sub_4BF1F0(v4, v2) returns non-zero, perform some operations
      if ( sub_4BF1F0(v4, v2) )
      {
        sub_4BFA80(v2[0]);
        sub_4BF8F0(*(_DWORD *)v2);
        // If dword_A965A8 is zero, continue the loop
        if ( !dword_A965A8 )
          continue;
      }
      // If dword_A96598 is non-zero, log an error
      if ( dword_A96598 )
        sub_4B7E10(aAnErrorOccured_0, (char)ArgList);
      dword_A965A8 = 0;
      break;
    }
    // Perform some operation with v3 and store the result
    result = sub_4BEFC0(v3);
  }
  // Reset global variable
  dword_A965A4 = 0;
  return result;
}

// === QvmLoad.c ===
int __cdecl QvmLoad(char *a1)
{
  int v2; // ebx
  int v3; // eax
  int v4; // [esp+10h] [ebp-11Ch]
  int v5; // [esp+14h] [ebp-118h]
  int v6; // [esp+18h] [ebp-114h] BYREF
  unsigned int Duration[2]; // [esp+1Ch] [ebp-110h] BYREF
  unsigned int Frequency[2]; // [esp+24h] [ebp-108h] BYREF
  char Str1[4]; // [esp+2Ch] [ebp-100h] BYREF
  char v10[128]; // [esp+ACh] [ebp-80h] BYREF

  v5 = 0;
  v4 = 0;
  if ( !sub_48F1D0() )
  {
    // Check if the given file exists
    if ( sub_4B5B60(a1) )
    {
      // Load the resource from the file
      v5 = ResourceLoad(a1, &v6);
      if ( v5 )
        goto LABEL_12;
    }
    return 0;
  }
  strcpy(Str1, a1);
  strcpy((char *)sub_4B1E90(0, 0, (int)Str1), ".qvm");
  if ( !sub_48F340() )
  {
    // Check if the modified file exists
    if ( sub_4B5B60(Str1) )
    {
      // Get the frequency and duration of the modified file
      sub_4B6440((int)Frequency, Str1);
      sub_4B6440((int)Duration, a1);
      // Compare the frequency and duration
      if ( sub_4B6490((unsigned int)Frequency, (unsigned int)Duration) >= 0 )
      {
        // Load the modified file
        v4 = sub_4BD220((char)Str1, 0, 0);
        if ( v4 )
          goto LABEL_12;
      }
    }
    goto LABEL_9;
  }
  // Check if the original file exists
  if ( !sub_4B5B60(Str1) )
    return 0;
  // Load the original file
  v4 = sub_4BD220((char)Str1, 0, 0);
  if ( !v4 )
    return 0;
LABEL_12:
  v2 = MemoryAlloc(148, 4);
  memset((void *)v2, 0, 0x94u);
  sub_4B8A10(0);
  v3 = v4;
  if ( v4 )
  {
LABEL_20:
    *(_BYTE *)(v2 + 144) = 1;
    *(_DWORD *)(v2 + 140) = v3;
    strcpy((char *)v2, Str1);
    return v2;
  }
  *(_DWORD *)(v2 + 128) = v5;
  *(_DWORD *)(v2 + 132) = v6;
  *(_DWORD *)(v2 + 136) = 0;
  strcpy((char *)v2, a1);
  if ( sub_48F1D0() )
  {
    strcpy(v10, a1);
    strcpy((char *)sub_4B1E90(0, 0, (int)v10), ".qas");
    sub_4B1AC0(Str1);
    sub_4B1AC0(v10);
    // Parse the modified file
    if ( QvmParse(v10, v2) )
    {
      CompilerCleanup(v2);
      sub_4B7E10(aAnErrorOccured, (char)a1);
      return 0;
    }
    // Assemble the modified file
    if ( QvmAssemble(Str1, v10) )
    {
      sub_4B7E10(aAnErrorOccured, (char)a1);
      return v2;
    }
    sub_4B1AC0(v10);
    CompilerCleanup(v2);
    v2 = MemoryAlloc(148, 4);
    memset((void *)v2, 0, 0x94u);
    v3 = sub_4BD220((char)Str1, 0, 0);
    if ( !v3 )
    {
      sub_4B7E10(aFailedToLoadQv, (char)Str1);
      sub_4B0D10(v2);
      return 0;
    }
    goto LABEL_20;
  }
  return v2;
}

// === QvmParse.c ===
int __cdecl QvmParse(char *ArgList, int a2)
{
  int v2; // edi
  char *v3; // esi
  char v4; // al
  int *v5; // edx
  _BYTE *v6; // ecx
  int v7; // esi
  int v8; // edi
  _DWORD *v9; // esi
  char v11; // [esp+0h] [ebp-874h]
  int v12[2]; // [esp+10h] [ebp-864h] BYREF
  int *v13; // [esp+18h] [ebp-85Ch] BYREF
  int v14[2]; // [esp+1Ch] [ebp-858h] BYREF
  char v15[32]; // [esp+24h] [ebp-850h] BYREF
  char v16[8]; // [esp+44h] [ebp-830h] BYREF
  char v17[40]; // [esp+4Ch] [ebp-828h] BYREF
  char v18[2048]; // [esp+74h] [ebp-800h] BYREF

  sub_4B1AC0(ArgList);  // Initialize ArgList
  strcpy((char *)&dword_A442D0, "                    ");  // Initialize dword_A442D0
  v13 = v14;  // Initialize v13
  v14[1] = (int)&v13;
  v14[0] = 0;
  dword_A442C8 = 0;  // Initialize dword_A442C8
  v2 = 0;
  v3 = (char *)&unk_A43EE0;  // Initialize v3
  do
  {
    sub_4BD3F0(v2, 1, v12, 0);  // Call sub_4BD3F0
    v4 = v12[0];
    strcpy(v3, "                   ");  // Initialize v3
    if ( v4 )
    {
      v5 = v12;
      v6 = v3 + 11;
      do
      {
        *v6 = v4;
        v4 = *((_BYTE *)v5 + 1);
        ++v6;
        v5 = (int *)((char *)v5 + 1);
      }
      while ( v4 );
    }
    v3 += 20;
    ++v2;
  }
  while ( (int)v3 < (int)&dword_A442B4 );
  dword_A965A8 = 0;  // Initialize dword_A965A8
  ScriptBufInit(v16, v15, v18, 2048);  // Call ScriptBufInit
  sub_4BF1C0(v15, *(_DWORD *)(a2 + 128), *(_DWORD *)(a2 + 132));  // Call sub_4BF1C0
  v7 = QFileOpen(ArgList, (int)aW);  // Call QFileOpen
  if ( v7 )
  {
    sub_4BBEF0(aParsingScriptA, v11);  // Call sub_4BBEF0
    while ( 1 )
    {
      v12[0] = 0;
      if ( !sub_4BFC70(v16, v17) )  // Call sub_4BFC70
        break;
      if ( !sub_4BF1F0(v16, v12) )  // Call sub_4BF1F0
      {
        ++dword_A442C8;
        break;
      }
      sub_4AF8F0(&v13, v12[0]);  // Call sub_4AF8F0
      sub_4BBF80(v7, v12[0]);  // Call sub_4BBF80
    }
    sub_4BBF40(0, v7);  // Call sub_4BBF40
    sub_4BBF60(v7);  // Call sub_4BBF60
    sub_4B1690(v7);  // Call sub_4B1690
  }
  else
  {
    sub_4BBE90(aFailedToOpenFi, (char)ArgList);  // Call sub_4BBE90
  }
  v8 = (int)v13;
  v9 = (_DWORD *)*v13;
  if ( *v13 )
  {
    do
    {
      sub_4AF960(v8);  // Call sub_4AF960
      sub_4BF8F0(v8);  // Call sub_4BF8F0
      v8 = (int)v9;
      v9 = (_DWORD *)*v9;
    }
    while ( v9 );
  }
  sub_4BEFC0(v15);  // Call sub_4BEFC0
  return dword_A442C8;
}

// === ResourceFlush.c ===
int __cdecl ResourceFlush(const void *ArgList)
{
  int v1 = dword_943E38;  // Get the address of the resource list
  _DWORD *v2 = *(_DWORD **)dword_943E38;  // Get the first resource in the list
  int result;  // Variable to store the result of the flush operation

  // If the resource list is empty, show an error and halt the program
  if (!*(_DWORD *)dword_943E38)
  {
    ErrorShow("Resource_Flush() : Couldn't locate resource at %p.", ArgList);
    while (1)
      ;
  }

  // Iterate through the resource list until the resource is found
  while (*(const void **)(v1 + 52) != ArgList)
  {
    v1 = (int)v2;
    v2 = (_DWORD *)*v2;
    if (!v2)
      goto LABEL_4;
  }

  // Get the type of the resource
  result = *(_DWORD *)(v1 + 36);

  // If the resource type is not 3 or 1, call sub_4B5C90 with the resource address
  if (result != 3 && result != 1)
    return sub_4B5C90(v1);

  return result;
}

// === ResourceLoad.c ===
int __cdecl ResourceLoad(char *ArgList, int *a2)
{
  const char *v2; // esi
  char *v3; // ecx
  int v5; // eax
  int v6; // edx
  char *v7; // eax
  char *v8; // [esp-8h] [ebp-10h]
  int v9; // [esp-4h] [ebp-Ch]
  int v10; // [esp+4h] [ebp-4h] BYREF

  v2 = ArgList;
  // Check if the resource is already loaded
  if ( IsResourceLoaded(ArgList, (int *)&ArgList) )
  {
    v3 = ArgList;
    // If a2 is not NULL, store the resource ID in a2
    if ( a2 )
      *a2 = *((_DWORD *)ArgList + 10);
    // Set the resource state to loaded
    *((_DWORD *)v3 + 11) = 1;
    // Return the resource ID
    return *((_DWORD *)ArgList + 13);
  }
  else
  {
    // Unpack the resource
    v5 = ResourcePackUnpack((int)v2, &v10);
    // If unpacking fails, show an error and halt the program
    if ( !v5 )
    {
      ErrorShow("Failed to load resource: '%s'", v2);
      while ( 1 )
        ;
    }
    v6 = v10;
    // If a2 is not NULL, store the resource ID in a2
    if ( a2 )
      *a2 = v10;
    v9 = v6;
    v8 = (char *)v5;
    v7 = (char *)sub_4B1FB0();
    // Return the result of sub_4B5F80
    return sub_4B5F80(v7, v8, v9);
  }
}

// === ResourcePackUnpack.c ===
int __cdecl ResourcePackUnpack(char *ArgList, int *a2)
{
  char *v2; // edi
  _DWORD *v3; // esi
  int v4; // eax
  int v5; // edi
  int v7; // ebx
  int v8; // ebp
  _DWORD *v9; // edi

  v2 = ArgList;
  v3 = (_DWORD *)QFileOpen(ArgList, (int)aR);
  if ( !v3 )
    return 0;
  
  // Check if the resource has a custom unpack function
  if ( dword_9436E8[35 * *v3] )
  {
    // Allocate memory for the resource
    v4 = sub_4B19C0(v2);
    *(_DWORD *)(v4 + 12) = *v3;
    
    // Call the custom unpack function and store the result
    v5 = ((int (__cdecl *)(_DWORD, _DWORD *, char **, int))dword_9436E8[35 * *v3])(*v3, v3, &ArgList, v4);
    
    // Clean up and return the result
    sub_4B1690(v3);
    if ( a2 )
      *a2 = (int)ArgList;
    return v5;
  }
  else
  {
    // Get the size of the resource
    v7 = sub_4B1780(v3);
    
    // Allocate memory for the resource data
    v8 = MemoryAlloc(v7, 4);
    
    // Create a resource descriptor
    v9 = (_DWORD *)sub_4B19C0(v2);
    v9[3] = *v3;
    v9[6] = v8;
    v9[4] = v7;
    
    // Unpack the resource data
    ResourceUnpack(v3, v8, v7);
    
    // Clean up and check for errors
    sub_4B17F0(v3, 0);
    if ( sub_4B17A0(v3) )
    {
      sub_4BADA0(v9);
      sub_4B0D10(v8);
      sub_4B1690(v3);
      if ( a2 )
        *a2 = 0;
      return 0;
    }
    
    // If a2 is not NULL, store the size of the unpacked resource in a2
    if ( a2 )
      *a2 = v7;
    
    // Clean up and return the address of the unpacked resource
    sub_4B1690(v3);
    return v8;
  }
}

// === ResourceUnload.c ===
int __cdecl ResourceUnload(char *ArgList)
{
  const char *resourceName = ArgList; // Store the resource name for error message
  int resourceState = IsResourceLoaded(ArgList, (int *)&ArgList); // Check if the resource is loaded

  if (!resourceState) {
    // If the resource is not loaded, show an error message and halt the program
    ErrorShow("Resource_Unload() : Resource '%s' is not loaded.", resourceName);
    while (1) {
      // Halt the program
    }
  }

  int resourceType = *((_DWORD *)ArgList + 9); // Get the resource type

  if (resourceType != 3 && resourceType != 1) {
    // If the resource type is not 3 or 1, call a subfunction and return its result
    return sub_4B5C90(ArgList);
  }

  return resourceType; // Return the resource type
}

// === ResourceUnpack.c ===
int __cdecl ResourceUnpack(_DWORD *a1, int a2, int a3)
{
  return ((int (__cdecl *)(_DWORD, _DWORD *, int, int))dword_9436C0[35 * *a1])(*a1, a1, a2, a3);
}

// === ScriptSetsymbolCxt.c ===
int __cdecl ScriptSetsymbolCxt(int ArgList, int a2)
{
  const char *v2; // esi
  int result; // eax

  // Store the argument list in v2
  v2 = (const char *)ArgList;

  // Call sub_4BAB80 with the argument list and the address of ArgList
  result = sub_4BAB80(ArgList, &ArgList);

  // If the result is 0, the symbol was not found
  if ( !result )
  {
    // Show an error message and halt the program
    ErrorShow("Script_SetSymbolContext(): Symbol not found: %s", v2);
    while ( 1 )
      ;
  }

  // Set the symbol context to a2
  *(_DWORD *)(ArgList + 24) = a2;

  // Return the result
  return result;
}

// === SoundLoad.c ===
int __cdecl SoundLoad(char ArgList)
{
  return sub_4B1420(ArgList, (int)sub_4E68F0, 0);
}

// === StatusMessageShow.c ===
int __cdecl StatusMessageShow(int a1, const char *a2, const char *a3, const char *a4)
{
  int v4; // eax
  int v5; // ebp
  char *v6; // edx

  // Initialize the hash
  v4 = QhashInit(1);
  LOWORD(v4) = word_540A8C;

  // Call sub_4012A0 with the arguments a1, v4, and 0
  v5 = sub_4012A0(a1, v4, 0);

  // Allocate memory for the first string and store it in v6
  v6 = (char *)MemoryAlloc(strlen(a2) + 1, 4);
  *(_DWORD *)(v5 + 176) = v6;

  // Copy the first string to the allocated memory
  strcpy(v6, a2);

  // Copy the second string to the appropriate location
  strcpy((char *)(v5 + 180), a3);

  // Copy the third string to the appropriate location
  strcpy((char *)(v5 + 436), a4);

  // Set the appropriate flags
  *(_BYTE *)(v5 + 452) = 1;
  *(_BYTE *)(v5 + 453) = 1;

  // Reset the hash
  QhashReset();

  // Call sub_485750 with the argument v5
  sub_485750(v5);

  // Return v5
  return v5;
}

// === SymbolCheck.c ===
// Define the SymbolCheck function
int __cdecl SymbolCheck(_DWORD *a1, int ArgList, int a3)
{
  const char *v3; // ebx
  int v4; // eax

  // Store the argument list in v3
  v3 = (const char *)ArgList;

  // Check if the symbol is already registered in the hash table
  if ((unsigned __int8)sub_4C04B0(a1, &ArgList, ArgList))
  {
    // Show an error message and halt the program
    ErrorShow("Symbol \"%s\" already registered in hash table", v3);
    while (1)
      ;
  }

  // Allocate memory for the symbol and store it in ArgList
  ArgList = MemoryAlloc(strlen(v3) + 17, 4);

  // Set the address of the symbol to ArgList + 16
  *(_DWORD *)(ArgList + 8) = ArgList + 16;

  // Set the symbol context to a3
  *(_DWORD *)(ArgList + 12) = a3;

  // Copy the symbol name to the allocated memory
  strcpy(*(char **)(ArgList + 8), v3);

  // Initialize the symbol counters
  *(_DWORD *)(ArgList + 4) = 0;
  *(_DWORD *)ArgList = 0;

  // Get the hash value for the symbol name
  v4 = sub_4C0530(v3, a1[1]);

  // Add the symbol to the hash table
  sub_4AF910(*a1 + 12 * v4, ArgList);

  // Return the address of the symbol
  return *(_DWORD *)(ArgList + 8);
}

// === SymbolRegisterBool8.c ===
int __cdecl SymbolRegisterBool8(char ArgList, int a2)
{
  return QTaskHashTableSet(ArgList, (int)sub_4B7F00, a2, 1, 0, 1, 1);
}

// === SymbolRegisterInt16.c ===
int __cdecl SymbolRegisterInt16(char ArgList, int a2)
{
  return QTaskHashTableSet(ArgList, (int)sub_4B7EA0, a2, 4, 0, 1, 1);
}

// === SymbolRegisterInt32.c ===
int __cdecl SymbolRegisterInt32(char ArgList, int a2)
{
  return QTaskHashTableSet(ArgList, (int)sub_4B7EA0, a2, 4, 0, 1, 1);
}

// === SymbolRegisterReal32.c ===
int __cdecl SymbolRegisterReal32(char ArgList, int a2)
{
  return QTaskHashTableSet(ArgList, (int)sub_4B7FE0, a2, 8, 0, 2, 1);
}

// === SymbolRemove.c ===
int __cdecl SymbolRemove(int a1, const char *ArgList)
{
  const char *v2; // esi

  v2 = ArgList;

  // Check if the symbol is registered in the hash table
  if ( !(unsigned __int8)sub_4C04B0(a1, &ArgList, ArgList) )
  {
    // Show an error message and halt the program
    ErrorShow("Unable to remove symbol \"%s\" (not registered)", v2);
    while ( 1 )
      ;
  }

  // Call the function to remove the symbol from the hash table
  sub_4AF960(ArgList);

  // Call the function to free the memory allocated for the symbol
  return sub_4B0D10(ArgList);
}

// === TasktypeSet.c ===
int __cdecl TasktypeSet(char ArgList, int a2)
{
  return QTaskHashTableSet(ArgList, (int)sub_4B8830, a2, 4, 2, 1, 0);
}

// === WeaponConfigRead.c ===
// Read the weapon configuration
int __cdecl WeaponConfigRead(int a1, char *a2)
{
  int v2; // eax
  int v3; // edi
  int v4; // esi
  int v5; // eax
  int v6; // ecx
  unsigned __int8 v7; // al

  // Copy the weapon configuration to a local variable
  strcpy(byte_5690F0, a2);

  // Compile the weapon configuration
  v2 = ConfigCompile(a1, a2, 0);
  v3 = v2;

  // If the compilation was successful
  if (v2)
  {
    v4 = *(_DWORD *)(v2 + 8);

    // If the weapon configuration is not empty
    if (*(_DWORD *)v4)
    {
      if (v4)
      {
        v5 = dword_AFA7E0;

        // Loop through each weapon configuration entry
        do
        {
          if (*(_DWORD *)v4)
            v6 = **(_DWORD **)v4 != 0 ? *(_DWORD *)v4 : 0;
          else
            v6 = 0;

          // Store the weapon configuration entry in an array
          dword_AFA6E0[v5] = v6;
          dword_AFA7E0 = v5 + 1;
          v7 = sub_4F1A70();

          // Call a function based on the weapon configuration entry
          ((void (__cdecl *)(int, _DWORD))dword_A96AE0[384 * v7 + *(unsigned __int16 *)(v4 + 28)])(v4, 0);

          v5 = dword_AFA7E0 - 1;
          dword_AFA7E0 = v5;
          v4 = dword_AFA6E0[v5];
        }
        while (v4);
      }
    }
  }

  return v3;
}

