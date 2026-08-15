# Natives - Complete Reference

Consolidated documentation for Natives file format.

---

## Igi-Natives

| Native | Address | Signature | Note |
|-|-|-|-|  
| AnimTriggerRead | 004EC070 | void AnimTriggerRead(uint* path); | Read Config of AnimTrigger, Params: Path like: 'LOCAL:Animtrigger' |
| CompilerCleanup | 004B83D0 | void CompileCleanUp(int* file); | Cleanup files after compiling, Params: File passed to CompileQVM |
| ConfigCompile | 004F0CF0 | int ConfigCompile(int p1,char* cfg_file,int p3); | Compile any config file, Params: Config: 'WEAPONS:weaponconfig.qsc' p1 ??, p3 ?? |
| ConfigRead | 00405850 | int ConfigRead(char* cfg_file); | Read game config file, Params:  File: 'LOCAL:config.qsc' |
| ConfigWrite | 00405BD0 | void ConfigWrite(char* cfg_file); | Write game config file, Params: File: 'LOCAL:config.qsc' |
| CutsceneDelete | 00415AB0 | void CutsceneDelete(char* buffer); | Delete current cutscene, Params: Buffer of size 30. |
| ErrorShow | 004AF7B0 | void ErrorShow(char* err_msg); | Show error message from game, Params: Error message. |
| FramesSet | 00402820 | void FramesSet(int frames); | Set game frames, Params: 30,60 max 240FPS. |
| GameMaterialLoad | 00408350 | void GameMaterialLoad(void); | Load game material.qvm to memory. |
| GraphicsReset | 00403B70 | void GraphicsReset(char* buffer); | Reset Graphics options in settings, Params: Buffer of size 30. |
| GraphOpen | 004F9FF0 | void GraphOpen(uint level,char* graph_str); | Open graph of level,Params: with str 'Graph4019.dat' |
| HumanplayerLoad | 004137A0 | void HumanplayerLoad(void); | Load Humanplayer.qvm file to memory. |
| InputDisable | 004157D0 | void InputDisable(char* buffer); | Disable input of player., Params: Buffer of size 30. |  
| InputEnable | 00415830 | void InputEnable(char* buffer); | Enable input of player., Params: Buffer of size 30. |
| LogAdd | 004BBC30 | void LogAdd(byte* log_msg); | Add internal game log message., Params: message to log. |
| LevelLoad | 004F0E10 | void LevelLoad(int level_path,int level_len); | Load current level from level_path,Params: path: 0057B568, len: 0x1E. |
| LevelQuit | 00416550 | void LevelQuit(void); | Quit current level to mainmenu. |
| LevelRestart | 00416FE0 | void LevelRestart(void); | Restarts current level. |
| LevelStart | 00415B30 | void LevelStart(int p1); | Start new level, Params:  p1: 0057BABC |
| MenuManager | 00418B00 | int* MenuManager(int p1,char *menu_str,char p3,char p4,int p5); | MenuManager load for inagame or Mainmenu,Params:  p1: 0057BABC ,p3,p4,p5: 0. |
| MusicDisable | 00415A60 | void MusicDisable(char* buffer); | Disable Game Music, Params:  Buffer of size 30. |
| MusicEnable | 00415A10 | void MusicEnable(char* buffer); | Enable Game Music, Params: Buffer of size 30. |  
| MusicSetSfxVolume | 00495F30 | void MusicSetSfxVolume(float volume); | Sets sound effect volume, Params: volume range [0.0 - 1.0] |
| MusicSetVolume | 00495E70 | void MusicSetVolume(float volume,float volume); | Sets music volume., Params: volume range [0.0 - 1.0] |
| MusicUpdateVolume | 004158E0 | void MusicUpdateVolume(char* buffer); | Update current music volume, Params: Buffer of size 30. |
| PhysicsObjTypeRead | 004EDFE0 | void PhysicsObjTypeRead(char* cfg_file); | Read Physics obj config file, Params: config file. |
| QhashInit | 004B0D60 | void QHashInit(char hash_val); | Init hash table value, Params: hash value 0 or 1. |
| QhashReset | 004B0D90 | void QHashReset(void); | Reset QTask type hash table. |
| QscCompile | 004B8410 | void QscCompile(char* qsc_file); | Compile QSC file to QVM, Params: QSC script file like 'LOCAL:objects.qsc' |
| QtaskUpdate | 004F0E90 | void QtaskUpdate(void); | Update QTask hash table call before loading level. |
| QtaskUpdateList | 00401B20 | void QtaskUpdateList(int* p1); | Update all QTask list, Params: p1 ?? |
| QvmAssemble | 004BB270 | int QvmAssemble(char *file_out,char *file_in); | Assemble QAS assembler file, Params: Assemler source file like 'objects.qas' |
| QvmCompile | 004B85B0 | void QvmCompile(int file); | Compile qvm file loaded in memory, Params: address of QVM file loaded from 'LoadResource' method. |
| QvmLoad | 004B80B0 | int * QvmLoad(char *file_name); | Compiles and Load any .qvm file into memory, Params: any qvm file name,  Returns filename loaded. |
| QvmParse | 004BBCB0 | int QvmParse(char *file_name,int mem_alloc_addr); | Parse Assembler source file, Params: any QAS file name and Memory allocated by Mem_Alloc(),  Returns status. |
| ResourceFlush | 004B63D0 | void ResourceFlush(int* p1); | Releases the current holding resources, Params: Params: p1 ?? |
| ResourceLoad | 004B5F00 | int * ResourceLoad(char *resource_file,char **buffer) | Load resource in Memory and Returns address of file., Params: resource file like 'sounds.res','AI/303.qvm' |
| ResourceUnload | 004B6380 | void ResourceUnload(int *resource_file); | Unload resource loaded in memory, Params: resource file like 'sounds.qvm','AI/303.qvm' | 
| IsResourceLoaded | 004B5B90 | int IsResourceLoaded(char *res_file,int *res_file_ptr); | Check where resource is in loaded in memory, Params: resource 'sounds.qvm','AI/303.qvm' and address of res file |
| ResourcePackUnpack | 004B18B0 | int ResourcePackUnpack(char *res_file,char **buffer); | Packs and return address or Unpacks resource file into memory depending upon resource type, Params: resource 'sounds.res','terrain.res', and buffer. |
| ResourceUnpack | 004B16D0 | void ResourceUnpack(int* res_ptr, int res_addr, int res_size); | Unpacks resource file into memory, Params: Resource ptr, address where to unpack (Allocate using Mem_Alloc) and size of resource. |
| ScriptInit | 004F0E50 | void ScriptInit(char* file_name,int p2,int p3,int p4); | Init script buffer for Assembler, Params: Use QvmLoad(file_name) first. |
| ScriptSetsymbolCxt | 004B8930 | void ScriptSetsymbolCxt(byte *symbol_name,int** symbol_buf); | Set symbol context before loading it, Params: symbol_name like 'TaskType_Set'. |
| StatusMessageClear | 00485AD0 | void StatusMessageClear (char* buffer); | Clear current status message from screen not from memory, Params: Buffer of size 30. |
| StatusMessageShow | 00485970 | int* StatusMessageShow(int status_timer,char* msg,char *sprite,char *status_byte); | Show status message on screen, Params: msg to show, sprite of msg, status_timer 0xA758AC, status_byte &0x567C74. |
| SymbolRemove | 004C0460 | void SymbolRemove(int *p1,int *symbol_name); | Remove symbol from memory, Params: symbol_name like 'TaskType_Set', p1 pointer ?? |
| TasktypeSet | 004B8810 | void TasktypeSet(int** task_str,int task_id); | Defines new constants for game and scripts ,Params: task_str (int**)WEAPONTYPE_PISTOL, task_id |
| WarningShow | 004AF810 | void WarningShow(char* warn_msg); | Show warning message, Params: message to show. |
| WeaponConfigRead | 004071E0 | int WeaponConfigRead(int p1,char *cfg_file); | Read weapon config file into memory, Params: p1 is 0, cfg_file is 'weaponconfig.qvm' |
| SymbolCheck | 004C0560 | int * SymbolCheck(int *p1,int **symbol_name,int* p3); | Check symbol in QTask list if already loaded, Params: symbol_name like 'TaskType_Set', p1,p3 ?? |
| GameDefineOptions | 004B8890 | void GameDefineOptions(int **option_str,int option_func_addr,int opt1,int opt2); | Define game options constants , Params: opt_str (int**)'DefineAmmoType' |
| ScriptBufInit | 004C0200 | void ScriptBufInit(int *buff_arr1,int buff_arr2,int buff,int buff_size); | Init buffer for scripts, Params: buffers with last param as size. |
| SoundLoad | 004E68D0 | void SoundLoad(char *sound_dir); | Load all level sounds from path , Params: Path of sound like 'MISSION:sounds' |
| MemoryAlloc | 004B0C60 | uint MemAlloc(int num, int size); | Allocate memory for game, Params: Check calloc() in c. |
| MemoryDealloc | 004B0BE0 | uint MemDealloc(void); | Deallocate allocated memory. |
| MissionOpen | 00484E60 | void MissionOpen(char **ptr_file); | Open current mission file , Params: Pointer to mission file. |
| FileOpen | 004A5350 | void* FileOpen(const char* file,char *mode); | Open file for reading or writing, Params: Check fopen() in c. |
| QFileOpen | 004B1510 | void* QFileOpen(const char* file,char *mode); | Open Qfile (QSC,QVM) for reading or writing, Params: Check fopen() in c. |
| RigidDyncubeObjRead | 004C48E0 | void RigidDynCubeObjRead(uint *cfg_file); | Read rigid dynCube config file , Params: config file of rigid dynCube. |
| MagicObjLoad | 004C4930 | void MagicObjLoad(char *path); | Loads magic objects from path, Params: Path 'LOCAL:magicobj' |
| AnimTriggerLoad | 004EC0C0 | void AnimTriggerLoad(char *path); | Loads anim trigger objects from path, Params: Path 'LOCAL:animtrigger' |  
| PhysicsObjLoad | 004EE030 | void PhysicsObjLoad(char *path); | Loads physics objects from path, Params: Path 'LOCAL:physicsobj' |
| AmmoTypeOpen | 0047CAB0 | void AmmoTypeOpen(void); | Open ammo qvm file to memory for all weapons loaded. |
| WeaponTypeOpen | 00413B70 | void WeaponTypeOpen(void); | Open all weapons defined in .qsc file for Humanplayer. |
| GameDataSymbolLoad | 004A53B3 | int GameDataSymbolLoad(char* sym_buf,char* sym_path,char* sym_name); | Load game data symbol to buffer for game like internal vairables,UI controls,timers etc. Params: like (buf,'LOCAL:models/%s.mef','000_02_1') |
| GameDataSymbolRemove | 004B80A0 | void GameDataSymbolRemove(char* sym_buf); | Removes game data symbol for game like internal vairables,UI controls,timers etc. |
| SymbolRegisterBool8 | 004B7EE0 | void SymbolRegisterBool8(int **sym_buf,int sym_addr); | Register new symbol of type 'Boolean' for game like internal vairables,UI controls,timers etc. |
| SymbolRegisterInt16 | 004B7E80 | void SymbolRegisterInt16(int **sym_buf,int sym_addr); | Register new symbol of type 'Int16' for game like internal vairables,UI controls,timers etc. |
| SymbolRegisterInt32 | 004B7FA0 | void SymbolRegisterInt16(int **sym_buf,int sym_addr); | Register new symbol of type 'Int32' for game like internal vairables,UI controls,timers etc. |
| SymbolRegisterReal32 | 004B7FC0 | void SymbolRegisterReal32(int **sym_buf,int sym_addr); | Register new symbol of type 'Real32 aka Float' for game like internal vairables,UI controls,timers etc. |
| LoadingScreenShow | 0048A440 | void LoadingScreenShow(int loading_type); | Show menu loading screen before loading level. |  
| QTaskHashTableSet | 004BAAC0 | void QTaskHashTableSet(int **symbol,int ptr_func,int symbol_val,int p4,int p5,int p6,int p7) | Main Hash Table for QTasks types for Objects(Guns,Ammo,Scripts,Variables etc) in whole game. HashTable is 70bytes long for each QTask. |
| WeaponsCountGet | 00413BB0 | int WeaponsCountGet() | Get total number of Weapons in game. |
| WeaponGunPickup | 0045FFC0 | void WeaponGunPickup(int param_ptr, int* type_ptr) | Weapon pickup from ground, Param: param_ptr is in defined in Constants as 'gun_pickup_ptr', set Weapon Id in type_ptr like *(0x19F720) = 5 |
| WeaponAmmoPickup | 0045FF80 | void WeaponAmmoPickup(int param_ptr, int* type_ptr) | Ammo pickup from ground, Param: param_ptr is in defined in Constants as 'gun_pickup_ptr', set Ammo Id in type_ptr like *(0x19F820) = 3 |
| PlayerXPHit | 00416D80 | uint PlayerXPHit() | Get Player XP Hit damage for current health. |
| HumanViewCam | 00463760 | void HumanViewCam(int soldier_ptr,int cam_type) | Camera view for Human Player/Soldier , Param: soldier_ptr is pointer to Entity you are changing and cam_type is [1-6] |
| HumanTaskViewReset | 004659E0 | void HumanTaskViewReset(int human_ptr) | Reset Human view angle after changing it by Zoom (Dragunov,Binoculars). |  
| IsPlayerProfileActive | 00406220 | char* IsPlayerProfileActive() | Checks if current player profle is active. |
| SoldierExecute | 0045C440 | void SoldierExecute(int ptr, int addr) | Execute current soldier in level, Param: ptr = (addr+0x2EC) and soldier address. |

---

