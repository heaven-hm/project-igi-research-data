# IGI 1 Natives - Verified

**Source:** igi.exe (IGI 1)
**Verified:** 2026-06-14 via radare2
**Total:** 270 natives
**IGI 2 content:** excluded

## Categories

- **AI:** 20 natives
- **AI Behavior:** 3 natives
- **Ammo:** 8 natives
- **Animation:** 6 natives
- **Camera:** 8 natives
- **Config:** 29 natives
- **Damage & Health:** 2 natives
- **Define:** 1 natives
- **Flow Events:** 5 natives
- **Game Options:** 14 natives
- **Graphics:** 1 natives
- **Human Player:** 3 natives
- **Input:** 2 natives
- **Menu:** 1 natives
- **Missiles:** 8 natives
- **Other:** 84 natives
- **Physics & Vehicles:** 2 natives
- **Player Physics:** 1 natives
- **Resources & QVM:** 3 natives
- **Sound:** 3 natives
- **Task Types:** 51 natives
- **Weapons:** 15 natives

---

## AI

### ResourceLoad

- **Address:** `004B5F00`
- **Signature:** `int * ResourceLoad(char *resource_file,char **buffer)`
- **Description:** Load resource in Memory and Returns address of file., Params: resource file like 'sounds.res','AI/303.qvm'

### ResourceUnload

- **Address:** `004B6380`
- **Signature:** `void ResourceUnload(int *resource_file);`
- **Description:** Unload resource loaded in memory, Params: resource file like 'sounds.qvm','AI/303.qvm'

### IsResourceLoaded

- **Address:** `004B5B90`
- **Signature:** `int IsResourceLoaded(char *res_file,int *res_file_ptr);`
- **Description:** Check where resource is in loaded in memory, Params: resource 'sounds.qvm','AI/303.qvm' and address of res file

### EnemyDetectorOverlay

- **Address:** `00470260`
- **Signature:** `uint32_t EnemyDetectorOverlay(int contextBase, int targetAddr, float sortingDistance, int configFlag, int *screenPosition, int eventParam, int extraParam1, int extraParam2)`
- **Description:** Shows red box on enemy when using binoculars. Params: contextBase=AI/render base (e.g. 0x01A3F4C0), targetAddr=target address (e.g. 0x00472C50), sortingDistance=float (e.g. 12.5), configFlag=overlay type (e.g. 1), screenPosition=out vec2 ptr, eventParam/extraParam1/extraParam2=optional (0).

### AIAction_Patrol

- **Address:** `0044D0E0`
- **Signature:** `void AIAction_Patrol(int path_id, int start_node, int end_node);`
- **Description:** Assigns patrol route path and node loop boundaries for AI guard entity.

### AIAction_FallFlat

- **Address:** `0044D2C0`
- **Signature:** `void AIAction_FallFlat(float duration, int anim_id);`
- **Description:** Forces AI guard to fall flat on ground for specified duration.

### AIAction_WalkToNode

- **Address:** `0044D4A0`
- **Signature:** `void AIAction_WalkToNode(int node_id, int speed);`
- **Description:** Orders guard AI to walk to a designated path node.

### AIAction_RunToNode

- **Address:** `0044D510`
- **Signature:** `void AIAction_RunToNode(int node_id, int speed);`
- **Description:** Orders guard AI to run to a designated path node.

### AIAction_PlayAnimation

- **Address:** `0044D6E0`
- **Signature:** `void AIAction_PlayAnimation(int anim_id, float speed);`
- **Description:** Plays skeletal animation sequence on AI guard model.

### AIAction_PlaySound

- **Address:** `0044D750`
- **Signature:** `void AIAction_PlaySound(int sound_id, float volume, float pitch);`
- **Description:** Triggers voice/sound playback on AI guard entity.

### AIAction_MoveToEvent

- **Address:** `0044D7D0`
- **Signature:** `void AIAction_MoveToEvent(int event_id, int speed);`
- **Description:** Orders AI to move toward detected sound or vision event location.

### AIAction_LookAtEvent

- **Address:** `0044D870`
- **Signature:** `void AIAction_LookAtEvent(int event_id, float duration);`
- **Description:** Rotates AI head/eyes to look at event origin.

### AIAction_Stunned

- **Address:** `0044D8F0`
- **Signature:** `void AIAction_Stunned(float duration, int anim_id);`
- **Description:** Puts AI into stunned reaction state (e.g. Flashbang).

### AIAction_Idle

- **Address:** `0044DA80`
- **Signature:** `void AIAction_Idle(float duration);`
- **Description:** Puts AI guard in passive idle stance for specified time.

### AIFunction_SetAlarmTriggerID

- **Address:** `0044E270`
- **Signature:** `void AIFunction_SetAlarmTriggerID(int trigger_id);`
- **Description:** Links guard AI to alarm button task ID.

### AIFunction_SetAlarmControlID

- **Address:** `0044E2D0`
- **Signature:** `void AIFunction_SetAlarmControlID(int control_id);`
- **Description:** Links guard AI to alarm control panel task ID.

### AIFunction_SetGunnerID

- **Address:** `0044E390`
- **Signature:** `void AIFunction_SetGunnerID(int gunner_id);`
- **Description:** Links AI guard to stationary gun/turret task ID.

### AIFunction_SendResponse

- **Address:** `0044EE40`
- **Signature:** `void AIFunction_SendResponse();`
- **Description:** Sends AI response signal to event pump.

### Flow_RequestEvent

- **Address:** `00401FC0`
- **Signature:** `void Flow_RequestEvent(int event_id);`
- **Description:** Requests engine state transition (QUIT, INTRO, MAINMENU, GAME, RESTART_GAME).

### HumanAI

- **Address:** `0053D404`
- **Signature:** `void HumanAI(int* task);`
- **Description:** Human AI base task type.

## AI Behavior

### SoldierExecute

- **Address:** `0045C440`
- **Signature:** `void SoldierExecute(int ptr, int addr)`
- **Description:** Execute current soldier in level, Param: ptr = (addr+0x2EC) and soldier address.

### AIAction_Combat

- **Address:** `0044D160`
- **Signature:** `void AIAction_Combat(int target_id);`
- **Description:** Engages specified target entity in combat state.

### AIAction_SetCombat

- **Address:** `0044DAE0`
- **Signature:** `void AIAction_SetCombat(int combat_mode);`
- **Description:** Sets aggressive/defensive combat mode parameters.

## Ammo

### AMMO_ID_M203

- **Address:** `00538E0C`
- **Signature:** `int AMMO_ID_M203();`
- **Description:** Ammo type ID for M203 grenades.

### AMMO_ID_MEDIPACK

- **Address:** `00538E2C`
- **Signature:** `int AMMO_ID_MEDIPACK();`
- **Description:** Ammo type ID for medipacks (healing items).

### AMMODISPLAYTYPE_GRENADE

- **Address:** `00539250`
- **Signature:** `int AMMODISPLAYTYPE_GRENADE();`
- **Description:** Ammo display type for grenades (thrown weapon icon).

### AMMODISPLAYTYPE_SHELL

- **Address:** `00539268`
- **Signature:** `int AMMODISPLAYTYPE_SHELL();`
- **Description:** Ammo display type for shotgun shells.

### AMMODISPLAYTYPE_BARREL

- **Address:** `00539280`
- **Signature:** `int AMMODISPLAYTYPE_BARREL();`
- **Description:** Ammo display type for ammo barrels.

### AMMODISPLAYTYPE_CLIP

- **Address:** `00539298`
- **Signature:** `int AMMODISPLAYTYPE_CLIP();`
- **Description:** Ammo display type for gun clips.

### AMMODISPLAYTYPE_NORMAL

- **Address:** `005392B0`
- **Signature:** `int AMMODISPLAYTYPE_NORMAL();`
- **Description:** Ammo display type for normal bullets.

### AMMODISPLAYTYPE_NONE

- **Address:** `005392C8`
- **Signature:** `int AMMODISPLAYTYPE_NONE();`
- **Description:** Ammo display type for no ammo display.

## Animation

### AnimTriggerRead

- **Address:** `004EC070`
- **Signature:** `void AnimTriggerRead(uint* path);`
- **Description:** Read Config of AnimTrigger, Params: Path like: 'LOCAL:Animtrigger'

### AnimTriggerLoad

- **Address:** `004EC0C0`
- **Signature:** `void AnimTriggerLoad(char *path);`
- **Description:** Loads anim trigger objects from path, Params: Path 'LOCAL:animtrigger'

### AIFunction_SetDeathAnimation

- **Address:** `0044E210`
- **Signature:** `void AIFunction_SetDeathAnimation(int anim_id);`
- **Description:** Assigns specific death animation index.

### AIFunction_SetAnimationInterval

- **Address:** `0044EAF0`
- **Signature:** `void AIFunction_SetAnimationInterval(float min, float max);`
- **Description:** Sets min/max interval between ambient idle animations.

### AIFunction_AddAnimationEntry

- **Address:** `0044EBB0`
- **Signature:** `void AIFunction_AddAnimationEntry(int anim_id, float weight);`
- **Description:** Adds weighted animation entry to idle animation pool.

### AIFunction_GetAnimationToPlay

- **Address:** `0044ECB0`
- **Signature:** `int AIFunction_GetAnimationToPlay();`
- **Description:** Selects animation index from weighted idle pool.

## Camera

### AIFunction_SetViewLength

- **Address:** `0044DC40`
- **Signature:** `void AIFunction_SetViewLength(float length);`
- **Description:** Sets primary acute vision cone sight distance.

### AIFunction_SetAlarmViewLength

- **Address:** `0044DCD0`
- **Signature:** `void AIFunction_SetAlarmViewLength(float length);`
- **Description:** Sets sight distance while alarm is active.

### AIFunction_SetViewAlpha

- **Address:** `0044DD30`
- **Signature:** `void AIFunction_SetViewAlpha(float alpha);`
- **Description:** Sets primary vision cone half-angle alpha.

### AIFunction_SetViewGamma

- **Address:** `0044DD90`
- **Signature:** `void AIFunction_SetViewGamma(float gamma);`
- **Description:** Sets primary vision cone detection rate gamma.

### AIFunction_SetSecondaryViewLength

- **Address:** `0044DDF0`
- **Signature:** `void AIFunction_SetSecondaryViewLength(float length);`
- **Description:** Sets secondary peripheral vision cone distance.

### AIFunction_SetSecondaryAlarmViewLength

- **Address:** `0044DE80`
- **Signature:** `void AIFunction_SetSecondaryAlarmViewLength(float length);`
- **Description:** Sets secondary peripheral vision cone distance under alarm.

### AIFunction_SetSecondaryViewAlpha

- **Address:** `0044DEE0`
- **Signature:** `void AIFunction_SetSecondaryViewAlpha(float alpha);`
- **Description:** Sets secondary vision cone angle.

### AIFunction_SetSecondaryViewGamma

- **Address:** `0044DF40`
- **Signature:** `void AIFunction_SetSecondaryViewGamma(float gamma);`
- **Description:** Sets secondary vision cone detection rate.

## Config

### ConfigCompile

- **Address:** `004F0CF0`
- **Signature:** `int ConfigCompile(int p1,char* cfg_file,int p3);`
- **Description:** Compile any config file, Params: Config: 'WEAPONS:weaponconfig.qsc' p1 ??, p3 ??

### ConfigRead

- **Address:** `00405850`
- **Signature:** `int ConfigRead(char* cfg_file);`
- **Description:** Read game config file, Params:  File: 'LOCAL:config.qsc'

### ConfigWrite

- **Address:** `00405BD0`
- **Signature:** `void ConfigWrite(char* cfg_file);`
- **Description:** Write game config file, Params: File: 'LOCAL:config.qsc'

### WeaponConfigRead

- **Address:** `004071E0`
- **Signature:** `int WeaponConfigRead(int p1,char *cfg_file);`
- **Description:** Read weapon config file into memory, Params: p1 is 0, cfg_file is 'weaponconfig.qvm'

### Config_GetNumberOfPlayerProfiles

- **Address:** `00402FF0`
- **Signature:** `int Config_GetNumberOfPlayerProfiles();`
- **Description:** Returns total count of registered player profiles.

### Config_GetActivePlayerProfileIndex

- **Address:** `00402FF0`
- **Signature:** `int Config_GetActivePlayerProfileIndex();`
- **Description:** Returns active profile index.

### Config_SetActivePlayerProfileIndex

- **Address:** `00402FF0`
- **Signature:** `void Config_SetActivePlayerProfileIndex(int index);`
- **Description:** Sets active player profile index.

### Config_CreateNewPlayerProfile

- **Address:** `00402FF0`
- **Signature:** `int Config_CreateNewPlayerProfile(string name, int difficulty);`
- **Description:** Creates new player profile.

### Config_DeletePlayerProfile

- **Address:** `00402FF0`
- **Signature:** `int Config_DeletePlayerProfile(int index);`
- **Description:** Deletes player profile at index.

### Config_PlayerGetActiveMission

- **Address:** `00402FF0`
- **Signature:** `int Config_PlayerGetActiveMission(int profile_index);`
- **Description:** Gets highest unlocked mission for profile.

### Config_FillPlayerProfileListBox

- **Address:** `00402FF0`
- **Signature:** `void Config_FillPlayerProfileListBox();`
- **Description:** Fills active menu list box with player profile names.

### Config_FillRenderDeviceListBox

- **Address:** `00402FF0`
- **Signature:** `void Config_FillRenderDeviceListBox();`
- **Description:** Fills list box with detected Direct3D/OpenGL render devices.

### Config_FillScreenResolutionListBox

- **Address:** `00402FF0`
- **Signature:** `void Config_FillScreenResolutionListBox();`
- **Description:** Fills list box with supported screen resolutions.

### Config_GraphicOptionsGetDevice

- **Address:** `00402FF0`
- **Signature:** `int Config_GraphicOptionsGetDevice();`
- **Description:** Gets active graphics device index.

### Config_GraphicOptionsSetDevice

- **Address:** `00402FF0`
- **Signature:** `void Config_GraphicOptionsSetDevice(int device_index);`
- **Description:** Sets active graphics device index.

### Config_GraphicOptionsGetResolution

- **Address:** `00402FF0`
- **Signature:** `int Config_GraphicOptionsGetResolution();`
- **Description:** Gets active screen resolution index.

### Config_GraphicOptionsSetResolution

- **Address:** `00402FF0`
- **Signature:** `void Config_GraphicOptionsSetResolution(int res_index);`
- **Description:** Sets active screen resolution index.

### Config_GraphicOptionsGetGamma

- **Address:** `00402FF0`
- **Signature:** `float Config_GraphicOptionsGetGamma();`
- **Description:** Gets active gamma slider value.

### Config_GraphicOptionsSetGamma

- **Address:** `00402FF0`
- **Signature:** `void Config_GraphicOptionsSetGamma(float gamma);`
- **Description:** Sets active gamma slider value.

### Config_SoundOptionsGetSoundsEffectsVolume

- **Address:** `00402FF0`
- **Signature:** `float Config_SoundOptionsGetSoundsEffectsVolume();`
- **Description:** Gets sound effects volume level (0.0 to 1.0).

### Config_SoundOptionsSetSoundsEffectsVolume

- **Address:** `00402FF0`
- **Signature:** `void Config_SoundOptionsSetSoundsEffectsVolume(float volume);`
- **Description:** Sets sound effects volume level.

### Config_SoundOptionsGetMusicVolume

- **Address:** `00402FF0`
- **Signature:** `float Config_SoundOptionsGetMusicVolume();`
- **Description:** Gets music volume level (0.0 to 1.0).

### Config_SoundOptionsSetMusicVolume

- **Address:** `00402FF0`
- **Signature:** `void Config_SoundOptionsSetMusicVolume(float volume);`
- **Description:** Sets music volume level.

### Config_GameOptionsInputGetInvertMouse

- **Address:** `00402FF0`
- **Signature:** `int Config_GameOptionsInputGetInvertMouse();`
- **Description:** Gets invert mouse pitch setting (0 or 1).

### Config_GameOptionsInputSetInvertMouse

- **Address:** `00402FF0`
- **Signature:** `void Config_GameOptionsInputSetInvertMouse(int invert);`
- **Description:** Sets invert mouse pitch setting.

### Config_GameOptionsInputGetMouseSensitivity

- **Address:** `00402FF0`
- **Signature:** `float Config_GameOptionsInputGetMouseSensitivity();`
- **Description:** Gets mouse look sensitivity multiplier.

### Config_GameOptionsInputSetMouseSensitivity

- **Address:** `00402FF0`
- **Signature:** `void Config_GameOptionsInputSetMouseSensitivity(float sensitivity);`
- **Description:** Sets mouse look sensitivity multiplier.

### HumanAIConfigItem

- **Address:** `005383DC`
- **Signature:** `void HumanAIConfigItem(int* task);`
- **Description:** Human AI config item registration.

### HumanAIConfig

- **Address:** `005383F0`
- **Signature:** `void HumanAIConfig(int* task);`
- **Description:** Human AI config task type.

## Damage & Health

### PlayerXPHit

- **Address:** `00416D80`
- **Signature:** `uint PlayerXPHit()`
- **Description:** Get Player XP Hit damage for current health.

### EnablePlayerHit

- **Address:** `00416D80`
- **Signature:** `int EnablePlayerHit()`
- **Description:** Set (0057BABC + 0xE1) value to 0 for Enable, 1 for Disable

## Define

### GameDefineOptions

- **Address:** `004B8890`
- **Signature:** `void GameDefineOptions(int **option_str,int option_func_addr,int opt1,int opt2);`
- **Description:** Define game options constants , Params: opt_str (int**)'DefineAmmoType'

## Flow Events

### FLOW_EVENT_RESTART_GAME

- **Address:** `00536214`
- **Signature:** `int FLOW_EVENT_RESTART_GAME();`
- **Description:** Flow event: restart current mission. Registered via Flow_RequestEvent.

### FLOW_EVENT_GAME

- **Address:** `0053622C`
- **Signature:** `int FLOW_EVENT_GAME();`
- **Description:** Flow event: start game (enter mission).

### FLOW_EVENT_MAINMENU

- **Address:** `0053623C`
- **Signature:** `int FLOW_EVENT_MAINMENU();`
- **Description:** Flow event: return to main menu.

### FLOW_EVENT_INTRO

- **Address:** `00536250`
- **Signature:** `int FLOW_EVENT_INTRO();`
- **Description:** Flow event: play intro sequence.

### FLOW_EVENT_QUIT

- **Address:** `00536264`
- **Signature:** `int FLOW_EVENT_QUIT();`
- **Description:** Flow event: quit game.

## Game Options

### GOStart

- **Address:** `00533237`
- **Signature:** `int GOStart();`
- **Description:** Game option: start game.

### GOPlayer

- **Address:** `00533240`
- **Signature:** `int GOPlayer();`
- **Description:** Game option: player settings.

### GOInRemap

- **Address:** `0053324C`
- **Signature:** `int GOInRemap();`
- **Description:** Game option: input remapping.

### GOInMouInv

- **Address:** `00533258`
- **Signature:** `int GOInMouInv();`
- **Description:** Game option: mouse invert.

### GOInMouSens

- **Address:** `00533264`
- **Signature:** `float GOInMouSens();`
- **Description:** Game option: mouse sensitivity.

### GOGfxDisp

- **Address:** `00533270`
- **Signature:** `int GOGfxDisp();`
- **Description:** Game option: graphics display mode.

### GOGfxDevice

- **Address:** `0053327C`
- **Signature:** `int GOGfxDevice();`
- **Description:** Game option: graphics device selection.

### GOGfxGamma

- **Address:** `00533288`
- **Signature:** `float GOGfxGamma();`
- **Description:** Game option: gamma correction.

### GOGfxPerformance

- **Address:** `00533294`
- **Signature:** `int GOGfxPerformance();`
- **Description:** Game option: graphics performance level.

### GOGameLang

- **Address:** `005332A8`
- **Signature:** `int GOGameLang();`
- **Description:** Game option: game language.

### GOGameDiff

- **Address:** `005332B4`
- **Signature:** `int GOGameDiff();`
- **Description:** Game option: game difficulty.

### GOIsBlood

- **Address:** `005332C0`
- **Signature:** `int GOIsBlood();`
- **Description:** Game option: blood enabled.

### GOActiveMission

- **Address:** `005332F8`
- **Signature:** `int GOActiveMission();`
- **Description:** Game option: active mission ID.

### GOContentControlPW

- **Address:** `00533308`
- **Signature:** `char* GOContentControlPW();`
- **Description:** Game option: content control password.

## Graphics

### GraphicsReset

- **Address:** `00403B70`
- **Signature:** `void GraphicsReset(char* buffer);`
- **Description:** Reset Graphics options in settings, Params: Buffer of size 30.

## Human Player

### HumanplayerLoad

- **Address:** `004137A0`
- **Signature:** `void HumanplayerLoad(void);`
- **Description:** Load Humanplayer.qvm file to memory.

### HumanViewCam

- **Address:** `00463760`
- **Signature:** `void HumanViewCam(int soldier_ptr,int cam_type)`
- **Description:** Camera view for Human Player/Soldier , Param: soldier_ptr is pointer to Entity you are changing and cam_type is [1-6]

### HumanTaskViewReset

- **Address:** `004659E0`
- **Signature:** `void HumanTaskViewReset(int human_ptr)`
- **Description:** Reset Human view angle after changing it by Zoom (Dragunov,Binoculars). 

## Input

### InputDisable

- **Address:** `004157D0`
- **Signature:** `void InputDisable(char* buffer);`
- **Description:** Disable input of player., Params: Buffer of size 30.

### InputEnable

- **Address:** `00415830`
- **Signature:** `void InputEnable(char* buffer);`
- **Description:** Enable input of player., Params: Buffer of size 30.

## Menu

### MenuManager

- **Address:** `00418B00`
- **Signature:** `int* MenuManager(int p1,char *menu_str,char p3,char p4,int p5);`
- **Description:** MenuManager load for inagame or Mainmenu,Params:  p1: 0057BABC ,p3,p4,p5: 0.

## Missiles

### MISSILE_TYPE_HIND_HELICOPTER

- **Address:** `0053BB90`
- **Signature:** `int MISSILE_TYPE_HIND_HELICOPTER();`
- **Description:** Missile type for HIND helicopter.

### MISSILE_TYPE_BOMB

- **Address:** `0053BBB0`
- **Signature:** `int MISSILE_TYPE_BOMB();`
- **Description:** Missile type for bombs.

### MISSILE_TYPE_MISSILE_KEYBOARD

- **Address:** `0053BBC4`
- **Signature:** `int MISSILE_TYPE_MISSILE_KEYBOARD();`
- **Description:** Missile type for keyboard-controlled missiles.

### MISSILE_TYPE_MISSILE_ANTITANK

- **Address:** `0053BBE4`
- **Signature:** `int MISSILE_TYPE_MISSILE_ANTITANK();`
- **Description:** Missile type for anti-tank missiles.

### MISSILE_TYPE_MISSILE_BALLISTIC

- **Address:** `0053BC04`
- **Signature:** `int MISSILE_TYPE_MISSILE_BALLISTIC();`
- **Description:** Missile type for ballistic missiles.

### MISSILE_TYPE_MISSILE_DIRECT

- **Address:** `0053BC24`
- **Signature:** `int MISSILE_TYPE_MISSILE_DIRECT();`
- **Description:** Missile type for direct-fire missiles.

### MISSILE_SMOKE_NORMAL

- **Address:** `0053BC40`
- **Signature:** `int MISSILE_SMOKE_NORMAL();`
- **Description:** Missile smoke trail type: normal.

### MISSILE_SMOKE_NONE

- **Address:** `0053BC58`
- **Signature:** `int MISSILE_SMOKE_NONE();`
- **Description:** Missile smoke trail type: none.

## Other

### CompilerCleanup

- **Address:** `004B83D0`
- **Signature:** `void CompileCleanUp(int* file);`
- **Description:** Cleanup files after compiling, Params: File passed to CompileQVM

### CutsceneDelete

- **Address:** `00415AB0`
- **Signature:** `void CutsceneDelete(char* buffer);`
- **Description:** Delete current cutscene, Params: Buffer of size 30.

### ErrorShow

- **Address:** `004AF7B0`
- **Signature:** `void ErrorShow(char* err_msg);`
- **Description:** Show error message from game, Params: Error message.

### FramesSet

- **Address:** `00402820`
- **Signature:** `void FramesSet(int frames);`
- **Description:** Set game frames, Params: 30,60 max 240FPS.

### GameMaterialLoad

- **Address:** `00408350`
- **Signature:** `void GameMaterialLoad(void);`
- **Description:** Load game material.qvm to memory.

### GraphOpen

- **Address:** `004F9FF0`
- **Signature:** `void GraphOpen(uint level,char* graph_str);`
- **Description:** Open graph of level,Params: with str 'Graph4019.dat'

### LogAdd

- **Address:** `004BBC30`
- **Signature:** `void LogAdd(byte* log_msg);`
- **Description:** Add internal game log message., Params: message to log.

### LevelLoad

- **Address:** `004F0E10`
- **Signature:** `void LevelLoad(int level_path,int level_len);`
- **Description:** Load current level from level_path,Params: path: 0057B568, len: 0x1E.

### LevelQuit

- **Address:** `00416550`
- **Signature:** `void LevelQuit(void);`
- **Description:** Quit current level to mainmenu.

### LevelRestart

- **Address:** `00416FE0`
- **Signature:** `void LevelRestart(void);`
- **Description:** Restarts current level.

### LevelStart

- **Address:** `00415B30`
- **Signature:** `void LevelStart(int p1);`
- **Description:** Start new level, Params:  p1: 0057BABC

### MusicDisable

- **Address:** `00415A60`
- **Signature:** `void MusicDisable(char* buffer);`
- **Description:** Disable Game Music, Params:  Buffer of size 30.

### MusicEnable

- **Address:** `00415A10`
- **Signature:** `void MusicEnable(char* buffer);`
- **Description:** Enable Game Music, Params: Buffer of size 30.

### MusicSetSfxVolume

- **Address:** `00495F30`
- **Signature:** `void MusicSetSfxVolume(float volume);`
- **Description:** Sets sound effect volume, Params: volume range [0.0 - 1.0]

### MusicSetVolume

- **Address:** `00495E70`
- **Signature:** `void MusicSetVolume(float volume,float volume);`
- **Description:** Sets music volume., Params: volume range [0.0 - 1.0]

### MusicUpdateVolume

- **Address:** `004158E0`
- **Signature:** `void MusicUpdateVolume(char* buffer);`
- **Description:** Update current music volume, Params: Buffer of size 30.

### QhashInit

- **Address:** `004B0D60`
- **Signature:** `void QHashInit(char hash_val);`
- **Description:** Init hash table value, Params: hash value 0 or 1.

### QhashReset

- **Address:** `004B0D90`
- **Signature:** `void QHashReset(void);`
- **Description:** Reset QTask type hash table.

### QscCompile

- **Address:** `004B8410`
- **Signature:** `void QscCompile(char* qsc_file);`
- **Description:** Compile QSC file to QVM, Params: QSC script file like 'LOCAL:objects.qsc'

### QtaskUpdate

- **Address:** `004F0E90`
- **Signature:** `void QtaskUpdate(void);`
- **Description:** Update QTask hash table call before loading level.

### QtaskUpdateList

- **Address:** `00401B20`
- **Signature:** `void QtaskUpdateList(int* p1);`
- **Description:** Update all QTask list, Params: p1 ??

### QvmAssemble

- **Address:** `004BB270`
- **Signature:** `int QvmAssemble(char *file_out,char *file_in);`
- **Description:** Assemble QAS assembler file, Params: Assemler source file like 'objects.qas'

### QvmCompile

- **Address:** `004B85B0`
- **Signature:** `void QvmCompile(int file);`
- **Description:** Compile qvm file loaded in memory, Params: address of QVM file loaded from 'LoadResource' method.

### QvmLoad

- **Address:** `004B80B0`
- **Signature:** `int * QvmLoad(char *file_name);`
- **Description:** Compiles and Load any .qvm file into memory, Params: any qvm file name,  Returns filename loaded.

### QvmParse

- **Address:** `004BBCB0`
- **Signature:** `int QvmParse(char *file_name,int mem_alloc_addr);`
- **Description:** Parse Assembler source file, Params: any QAS file name and Memory allocated by Mem_Alloc(),  Returns status.

### ScriptInit

- **Address:** `004F0E50`
- **Signature:** `void ScriptInit(char* file_name,int p2,int p3,int p4);`
- **Description:** Init script buffer for Assembler, Params: Use QvmLoad(file_name) first.

### ScriptSetsymbolCxt

- **Address:** `004B8930`
- **Signature:** `void ScriptSetsymbolCxt(byte *symbol_name,int** symbol_buf);`
- **Description:** Set symbol context before loading it, Params: symbol_name like 'TaskType_Set'.

### StatusMessageClear

- **Address:** `00485AD0`
- **Signature:** `void StatusMessageClear (char* buffer);`
- **Description:** Clear current status message from screen not from memory, Params: Buffer of size 30.

### StatusMessageShow

- **Address:** `00485970`
- **Signature:** `int* StatusMessageShow(int status_timer,char* msg,char *sprite,char *status_byte);`
- **Description:** Show status message on screen, Params: msg to show, sprite of msg, status_timer 0xA758AC, status_byte &0x567C74.

### SymbolRemove

- **Address:** `004C0460`
- **Signature:** `void SymbolRemove(int *p1,int *symbol_name);`
- **Description:** Remove symbol from memory, Params: symbol_name like 'TaskType_Set', p1 pointer ??

### TasktypeSet

- **Address:** `004B8810`
- **Signature:** `void TasktypeSet(int** task_str,int task_id);`
- **Description:** Defines new constants for game and scripts ,Params: task_str (int**)WEAPONTYPE_PISTOL, task_id

### WarningShow

- **Address:** `004AF810`
- **Signature:** `void WarningShow(char* warn_msg);`
- **Description:** Show warning message, Params: message to show.

### SymbolCheck

- **Address:** `004C0560`
- **Signature:** `int * SymbolCheck(int *p1,int **symbol_name,int* p3);`
- **Description:** Check symbol in QTask list if already loaded, Params: symbol_name like 'TaskType_Set', p1,p3 ??

### ScriptBufInit

- **Address:** `004C0200`
- **Signature:** `void ScriptBufInit(int *buff_arr1,int buff_arr2,int buff,int buff_size);`
- **Description:** Init buffer for scripts, Params: buffers with last param as size.

### SoundLoad

- **Address:** `004E68D0`
- **Signature:** `void SoundLoad(char *sound_dir);`
- **Description:** Load all level sounds from path , Params: Path of sound like 'MISSION:sounds'

### MemoryAlloc

- **Address:** `004B0C60`
- **Signature:** `uint MemAlloc(int num, int size);`
- **Description:** Allocate memory for game, Params: Check calloc() in c.

### MemoryDealloc

- **Address:** `004B0BE0`
- **Signature:** `uint MemDealloc(void);`
- **Description:** Deallocate allocated memory.

### MissionOpen

- **Address:** `00484E60`
- **Signature:** `void MissionOpen(char **ptr_file);`
- **Description:** Open current mission file , Params: Pointer to mission file.

### FileOpen

- **Address:** `004A5350`
- **Signature:** `void* FileOpen(const char* file,char *mode);`
- **Description:** Open file for reading or writing, Params: Check fopen() in c.

### QFileOpen

- **Address:** `004B1510`
- **Signature:** `void* QFileOpen(const char* file,char *mode);`
- **Description:** Open Qfile (QSC,QVM) for reading or writing, Params: Check fopen() in c.

### RigidDyncubeObjRead

- **Address:** `004C48E0`
- **Signature:** `void RigidDynCubeObjRead(uint *cfg_file);`
- **Description:** Read rigid dynCube config file , Params: config file of rigid dynCube.

### MagicObjLoad

- **Address:** `004C4930`
- **Signature:** `void MagicObjLoad(char *path);`
- **Description:** Loads magic objects from path, Params: Path 'LOCAL:magicobj'

### AmmoTypeOpen

- **Address:** `0047CAB0`
- **Signature:** `void AmmoTypeOpen(void);`
- **Description:** Open ammo qvm file to memory for all weapons loaded.

### WeaponTypeOpen

- **Address:** `00413B70`
- **Signature:** `void WeaponTypeOpen(void);`
- **Description:** Open all weapons defined in .qsc file for Humanplayer.

### GameDataSymbolLoad

- **Address:** `004A53B3`
- **Signature:** `int GameDataSymbolLoad(char* sym_buf,char* sym_path,char* sym_name);`
- **Description:** Load game data symbol to buffer for game like internal vairables,UI controls,timers etc. Params: like (buf,'LOCAL:models/%s.mef','000_02_1')

### GameDataSymbolRemove

- **Address:** `004B80A0`
- **Signature:** `void GameDataSymbolRemove(char* sym_buf);`
- **Description:** Removes game data symbol for game like internal vairables,UI controls,timers etc.

### SymbolRegisterBool8

- **Address:** `004B7EE0`
- **Signature:** `void SymbolRegisterBool8(int **sym_buf,int sym_addr);`
- **Description:** Register new symbol of type 'Boolean' for game like internal vairables,UI controls,timers etc.

### SymbolRegisterInt16

- **Address:** `004B7E80`
- **Signature:** `void SymbolRegisterInt16(int **sym_buf,int sym_addr);`
- **Description:** Register new symbol of type 'Int16' for game like internal vairables,UI controls,timers etc.

### SymbolRegisterInt32

- **Address:** `004B7FA0`
- **Signature:** `void SymbolRegisterInt16(int **sym_buf,int sym_addr);`
- **Description:** Register new symbol of type 'Int32' for game like internal vairables,UI controls,timers etc.

### SymbolRegisterReal32

- **Address:** `004B7FC0`
- **Signature:** `void SymbolRegisterReal32(int **sym_buf,int sym_addr);`
- **Description:** Register new symbol of type 'Real32 aka Float' for game like internal vairables,UI controls,timers etc.

### LoadingScreenShow

- **Address:** `0048A440`
- **Signature:** `void LoadingScreenShow(int loading_type);`
- **Description:** Show menu loading screen before loading level.

### QTaskHashTableSet

- **Address:** `004BAAC0`
- **Signature:** `void QTaskHashTableSet(int **symbol,int ptr_func,int symbol_val,int p4,int p5,int p6,int p7)`
- **Description:** Main Hash Table for QTasks types for Objects(Guns,Ammo,Scripts,Variables etc) in whole game. HashTable is 70bytes long for each QTask.

### WeaponsCountGet

- **Address:** `00413BB0`
- **Signature:** `int WeaponsCountGet()`
- **Description:** Get total number of Weapons in game.

### WeaponGunPickup

- **Address:** `0045FFC0`
- **Signature:** `void WeaponGunPickup(int param_ptr, int* type_ptr)`
- **Description:** Weapon pickup from ground, Param: param_ptr is in defined in Constants as 'gun_pickup_ptr', set Weapon Id in type_ptr like *(0x19F720) = 5

### WeaponAmmoPickup

- **Address:** `0045FF80`
- **Signature:** `void WeaponAmmoPickup(int param_ptr, int* type_ptr)`
- **Description:** Ammo pickup from ground, Param: param_ptr is in defined in Constants as 'gun_pickup_ptr', set Ammo Id in type_ptr like *(0x19F820) = 3

### AIAction_Dead

- **Address:** `0044D260`
- **Signature:** `void AIAction_Dead(int killer_id);`
- **Description:** Triggers death state, animation, and drop weapon behavior.

### AIAction_Activate

- **Address:** `0044D420`
- **Signature:** `void AIAction_Activate(int object_id, int action_id, float duration);`
- **Description:** Triggers interactable object activation (alarm button, door switch).

### AIAction_FireAtNode

- **Address:** `0044D580`
- **Signature:** `void AIAction_FireAtNode(int node_id, int weapon_id, int burst_count, float delay, int aim_mode);`
- **Description:** Fires weapon at a specific world node location.

### AIAction_FireAtTask

- **Address:** `0044D630`
- **Signature:** `void AIAction_FireAtTask(int task_id, int weapon_id, int burst_count, float delay, int aim_mode);`
- **Description:** Fires weapon at target task object (player or camera).

### AIAction_KickGrenade

- **Address:** `0044D960`
- **Signature:** `void AIAction_KickGrenade(int grenade_id);`
- **Description:** Triggers grenade kick reaction sequence.

### AIAction_RunPanicking

- **Address:** `0044DA00`
- **Signature:** `void AIAction_RunPanicking(int target_node, float duration);`
- **Description:** Orders unarmed civilian/guard to run panicking away.

### AIFunction_DefaultHandler

- **Address:** `0044E060`
- **Signature:** `void AIFunction_DefaultHandler();`
- **Description:** Default fallback script event handler.

### AIFunction_RemoveAlarmActions

- **Address:** `0044DBC0`
- **Signature:** `void AIFunction_RemoveAlarmActions();`
- **Description:** Clears pending alarm switch activation goals.

### AIFunction_SetEventPriority

- **Address:** `0044E0C0`
- **Signature:** `void AIFunction_SetEventPriority(int priority);`
- **Description:** Sets event queue evaluation priority for guard script.

### AIFunction_SetInvulnerability

- **Address:** `0044E150`
- **Signature:** `void AIFunction_SetInvulnerability(int invulnerable);`
- **Description:** Sets invulnerability flag (1 = godmode / mission object).

### AIFunction_SetInstantDeath

- **Address:** `0044E1B0`
- **Signature:** `void AIFunction_SetInstantDeath(int instant_death);`
- **Description:** Forces immediate death on single bullet hit.

### AIFunction_SetAlarmAccess

- **Address:** `0044E330`
- **Signature:** `void AIFunction_SetAlarmAccess(int access_flags);`
- **Description:** Sets guard permission to trigger alarms.

### AIFunction_SetScriptIntegerValue

- **Address:** `0044E6D0`
- **Signature:** `void AIFunction_SetScriptIntegerValue(int key, int value);`
- **Description:** Sets internal integer script state variable.

### AIFunction_SetScriptRealValue

- **Address:** `0044E790`
- **Signature:** `void AIFunction_SetScriptRealValue(int key, float value);`
- **Description:** Sets internal float script state variable.

### AIFunction_GetAlarmTriggerID

- **Address:** `0044E3F0`
- **Signature:** `int AIFunction_GetAlarmTriggerID();`
- **Description:** Returns linked alarm trigger task ID.

### AIFunction_GetAlarmControlID

- **Address:** `0044E430`
- **Signature:** `int AIFunction_GetAlarmControlID();`
- **Description:** Returns linked alarm control panel task ID.

### AIFunction_GetAlarmAccess

- **Address:** `0044E470`
- **Signature:** `int AIFunction_GetAlarmAccess();`
- **Description:** Returns guard alarm access permissions.

### AIFunction_GetGunnerID

- **Address:** `0044E4B0`
- **Signature:** `int AIFunction_GetGunnerID();`
- **Description:** Returns linked stationary gun task ID.

### AIFunction_GetAlarmControlStatus

- **Address:** `0044E4F0`
- **Signature:** `int AIFunction_GetAlarmControlStatus();`
- **Description:** Queries if global level alarm is active (0 or 1).

### AIFunction_GetGunnerStatus

- **Address:** `0044E5E0`
- **Signature:** `int AIFunction_GetGunnerStatus();`
- **Description:** Queries if linked gunner turret is occupied.

### AIFunction_GetScriptIntegerValue

- **Address:** `0044E740`
- **Signature:** `int AIFunction_GetScriptIntegerValue(int key);`
- **Description:** Reads integer script state variable.

### AIFunction_GetCurrentEventType

- **Address:** `0044DFA0`
- **Signature:** `int AIFunction_GetCurrentEventType();`
- **Description:** Returns active detected event type (Gunshot, Vision, Impact).

### AIFunction_IsEventBehind

- **Address:** `0044E860`
- **Signature:** `int AIFunction_IsEventBehind();`
- **Description:** Returns 1 if detected sound/event originates behind guard.

### AIFunction_GetScriptRealValue

- **Address:** `0044E800`
- **Signature:** `float AIFunction_GetScriptRealValue(int key);`
- **Description:** Reads float script state variable.

### AIFunction_GetRandomValue

- **Address:** `0044E000`
- **Signature:** `float AIFunction_GetRandomValue(float max);`
- **Description:** Generates random float between 0.0 and max using PRNG 0x4B4740.

### AIFunction_GetEventDistance

- **Address:** `0044E930`
- **Signature:** `float AIFunction_GetEventDistance();`
- **Description:** Returns distance to detected event origin.

### AIFunction_GetAlarmTriggerDistance

- **Address:** `0044E9B0`
- **Signature:** `float AIFunction_GetAlarmTriggerDistance();`
- **Description:** Returns distance between guard and alarm switch.

### Task_New

- **Address:** `004F0E50`
- **Signature:** `void Task_New(int type_id, ...);`
- **Description:** Instantiates new task node in level task tree hierarchy.

### Task_DeclareParameters

- **Address:** `004F0ED0`
- **Signature:** `void Task_DeclareParameters(int type_id, ...);`
- **Description:** Declares parameter schema and value types for a task node type.

## Physics & Vehicles

### PhysicsObjTypeRead

- **Address:** `004EDFE0`
- **Signature:** `void PhysicsObjTypeRead(char* cfg_file);`
- **Description:** Read Physics obj config file, Params: config file.

### PhysicsObjLoad

- **Address:** `004EE030`
- **Signature:** `void PhysicsObjLoad(char *path);`
- **Description:** Loads physics objects from path, Params: Path 'LOCAL:physicsobj'

## Player Physics

### IsPlayerProfileActive

- **Address:** `00406220`
- **Signature:** `char* IsPlayerProfileActive()`
- **Description:** Checks if current player profle is active.

## Resources & QVM

### ResourceFlush

- **Address:** `004B63D0`
- **Signature:** `void ResourceFlush(int* p1);`
- **Description:** Releases the current holding resources, Params: Params: p1 ??

### ResourcePackUnpack

- **Address:** `004B18B0`
- **Signature:** `int ResourcePackUnpack(char *res_file,char **buffer);`
- **Description:** Packs and return address or Unpacks resource file into memory depending upon resource type, Params: resource 'sounds.res','terrain.res', and buffer.

### ResourceUnpack

- **Address:** `004B16D0`
- **Signature:** `void ResourceUnpack(int* res_ptr, int res_addr, int res_size);`
- **Description:** Unpacks resource file into memory, Params: Resource ptr, address where to unpack (Allocate using Mem_Alloc) and size of resource.

## Sound

### GOSoundSpeech

- **Address:** `005332CC`
- **Signature:** `float GOSoundSpeech();`
- **Description:** Game option: speech volume.

### GOSoundMusic

- **Address:** `005332DC`
- **Signature:** `float GOSoundMusic();`
- **Description:** Game option: music volume.

### GOSoundFX

- **Address:** `005332EC`
- **Signature:** `float GOSoundFX();`
- **Description:** Game option: sound effects volume.

## Task Types

### TASKTYPE_CARDOOR

- **Address:** `0053BAC0`
- **Signature:** `int TASKTYPE_CARDOOR();`
- **Description:** Task type constant for car doors. Registered via TasktypeSet.

### TASKTYPE_HELIWHEEL

- **Address:** `0053BAF8`
- **Signature:** `int TASKTYPE_HELIWHEEL();`
- **Description:** Task type constant for helicopter wheels.

### TASKTYPE_HELIDOOR

- **Address:** `0053BB1C`
- **Signature:** `int TASKTYPE_HELIDOOR();`
- **Description:** Task type constant for helicopter doors.

### TASKTYPE_ROCKETPOD

- **Address:** `0053BB40`
- **Signature:** `int TASKTYPE_ROCKETPOD();`
- **Description:** Task type constant for rocket pods.

### TASKTYPE_HITZONE

- **Address:** `0053BB70`
- **Signature:** `int TASKTYPE_HITZONE();`
- **Description:** Task type constant for hit zones (damage areas).

### TASKTYPE_MISSILE

- **Address:** `0053BC6C`
- **Signature:** `int TASKTYPE_MISSILE();`
- **Description:** Task type constant for missiles.

### TASKTYPE_AFTERBURNER

- **Address:** `0053BD44`
- **Signature:** `int TASKTYPE_AFTERBURNER();`
- **Description:** Task type constant for afterburners (plane thrust).

### TASKTYPE_ROTOR

- **Address:** `0053BD80`
- **Signature:** `int TASKTYPE_ROTOR();`
- **Description:** Task type constant for rotors. Parsed by 0x42D9F0.

### TASKTYPE_CAR

- **Address:** `0053BE18`
- **Signature:** `int TASKTYPE_CAR();`
- **Description:** Task type constant for cars.

### TASKTYPE_WHEEL

- **Address:** `0053BE3C`
- **Signature:** `int TASKTYPE_WHEEL();`
- **Description:** Task type constant for wheels.

### TASKTYPE_HELI

- **Address:** `0053BEC0`
- **Signature:** `int TASKTYPE_HELI();`
- **Description:** Task type constant for helicopters. Registered by HeliTask_Register(0x4310F0).

### TASKTYPE_PLANE

- **Address:** `0053BFB4`
- **Signature:** `int TASKTYPE_PLANE();`
- **Description:** Task type constant for planes.

### TASKTYPE_COCKPITSHIELD

- **Address:** `0053BFD4`
- **Signature:** `int TASKTYPE_COCKPITSHIELD();`
- **Description:** Task type constant for cockpit shields.

### TASKTYPE_GEAR

- **Address:** `0053BFFC`
- **Signature:** `int TASKTYPE_GEAR();`
- **Description:** Task type constant for landing gear.

### TASKTYPE_HATCH

- **Address:** `0053C00C`
- **Signature:** `int TASKTYPE_HATCH();`
- **Description:** Task type constant for hatches.

### TASKTYPE_RUDDER

- **Address:** `0053C074`
- **Signature:** `int TASKTYPE_RUDDER();`
- **Description:** Task type constant for rudders.

### TASKTYPE_SMOKE

- **Address:** `0053C164`
- **Signature:** `int TASKTYPE_SMOKE();`
- **Description:** Task type constant for smoke effects.

### TASKTYPE_GUNSHOTEFFECT

- **Address:** `0053C1B4`
- **Signature:** `int TASKTYPE_GUNSHOTEFFECT();`
- **Description:** Task type constant for gun shot effects (muzzle flash, tracers).

### TASKTYPE_ALARMLIGHTREFLECTOR

- **Address:** `0053C26C`
- **Signature:** `int TASKTYPE_ALARMLIGHTREFLECTOR();`
- **Description:** Task type constant for alarm light reflectors.

### TASKTYPE_ALARMLIGHT

- **Address:** `0053C2A0`
- **Signature:** `int TASKTYPE_ALARMLIGHT();`
- **Description:** Task type constant for alarm lights.

### TASKTYPE_EXPLODEMAGICOBJ

- **Address:** `0053C338`
- **Signature:** `int TASKTYPE_EXPLODEMAGICOBJ();`
- **Description:** Task type constant for explosive magic objects.

### TASKTYPE_GENERICPHYSICSMAGICOBJ

- **Address:** `0053C470`
- **Signature:** `int TASKTYPE_GENERICPHYSICSMAGICOBJ();`
- **Description:** Task type constant for generic physics magic objects.

### TASKTYPE_GENERICPHYSICSOBJ

- **Address:** `0053C4AC`
- **Signature:** `int TASKTYPE_GENERICPHYSICSOBJ();`
- **Description:** Task type constant for generic physics objects.

### TASKTYPE_FENCE

- **Address:** `0053C500`
- **Signature:** `int TASKTYPE_FENCE();`
- **Description:** Task type constant for fences.

### TASKTYPE_LADDER

- **Address:** `0053C528`
- **Signature:** `int TASKTYPE_LADDER();`
- **Description:** Task type constant for ladders.

### TASKTYPE_SCAMERALENSVIEWCONE

- **Address:** `0053C5A0`
- **Signature:** `int TASKTYPE_SCAMERALENSVIEWCONE();`
- **Description:** Task type constant for security camera view cones.

### TASKTYPE_DRAWER

- **Address:** `0053C6BC`
- **Signature:** `int TASKTYPE_DRAWER();`
- **Description:** Task type constant for drawers.

### TASKTYPE_BUILDING

- **Address:** `0053C814`
- **Signature:** `int TASKTYPE_BUILDING();`
- **Description:** Task type constant for buildings.

### TASKTYPE_RADARDISH

- **Address:** `0053C834`
- **Signature:** `int TASKTYPE_RADARDISH();`
- **Description:** Task type constant for radar dishes.

### TASKTYPE_GLASS

- **Address:** `0053C868`
- **Signature:** `int TASKTYPE_GLASS();`
- **Description:** Task type constant for breakable glass.

### TASKTYPE_DEATHZONE

- **Address:** `0053F500`
- **Signature:** `int TASKTYPE_DEATHZONE();`
- **Description:** Task type constant for death zones (instant kill areas).

### TASKTYPE_GUNX2

- **Address:** `0053FE6C`
- **Signature:** `int TASKTYPE_GUNX2();`
- **Description:** Task type constant for double guns.

### TASKTYPE_KNIFESTAB

- **Address:** `0053FE88`
- **Signature:** `int TASKTYPE_KNIFESTAB();`
- **Description:** Task type constant for knife stab attacks.

### TASKTYPE_AISTATIONARYGUN

- **Address:** `0053FEC4`
- **Signature:** `int TASKTYPE_AISTATIONARYGUN();`
- **Description:** Task type constant for AI stationary guns/turrets.

### TASKTYPE_MEDIPACK

- **Address:** `0053FEF0`
- **Signature:** `int TASKTYPE_MEDIPACK();`
- **Description:** Task type constant for medipacks (health packs).

### TASKTYPE_BINOCULAR

- **Address:** `0053FF58`
- **Signature:** `int TASKTYPE_BINOCULAR();`
- **Description:** Task type constant for binoculars.

### TASKTYPE_CABARREL

- **Address:** `00540300`
- **Signature:** `int TASKTYPE_CABARREL();`
- **Description:** Task type constant for ammo barrels.

### TASKTYPE_CACLIP

- **Address:** `00540314`
- **Signature:** `int TASKTYPE_CACLIP();`
- **Description:** Task type constant for ammo clips.

### TASKTYPE_GUNSPAS12

- **Address:** `00540374`
- **Signature:** `int TASKTYPE_GUNSPAS12();`
- **Description:** Task type constant for SPAS-12 shotgun.

### TASKTYPE_GUNDRAGUNOV

- **Address:** `00540404`
- **Signature:** `int TASKTYPE_GUNDRAGUNOV();`
- **Description:** Task type constant for Dragunov sniper rifle.

### TASKTYPE_GUNM16A2

- **Address:** `00540434`
- **Signature:** `int TASKTYPE_GUNM16A2();`
- **Description:** Task type constant for M16A2 assault rifle.

### TASKTYPE_GUNMP5SD

- **Address:** `005404EC`
- **Signature:** `int TASKTYPE_GUNMP5SD();`
- **Description:** Task type constant for MP5SD submachine gun.

### TASKTYPE_PROXIMITYMINE

- **Address:** `0054053C`
- **Signature:** `int TASKTYPE_PROXIMITYMINE();`
- **Description:** Task type constant for proximity mines.

### TASKTYPE_MINE

- **Address:** `00540618`
- **Signature:** `int TASKTYPE_MINE();`
- **Description:** Task type constant for mines.

### TASKTYPE_M203

- **Address:** `00540654`
- **Signature:** `int TASKTYPE_M203();`
- **Description:** Task type constant for M203 grenade launcher.

### TASKTYPE_GRENADE

- **Address:** `005406B0`
- **Signature:** `int TASKTYPE_GRENADE();`
- **Description:** Task type constant for grenades.

### TASKTYPE_GUNMOVINGPART

- **Address:** `00540754`
- **Signature:** `int TASKTYPE_GUNMOVINGPART();`
- **Description:** Task type constant for moving gun parts.

### TASKTYPE_GUNCLIP

- **Address:** `0054076C`
- **Signature:** `int TASKTYPE_GUNCLIP();`
- **Description:** Task type constant for gun clips.

### TASKTYPE_GUNFLAME

- **Address:** `00540780`
- **Signature:** `int TASKTYPE_GUNFLAME();`
- **Description:** Task type constant for flame throwers.

### TASKTYPE_GUN

- **Address:** `00540800`
- **Signature:** `int TASKTYPE_GUN();`
- **Description:** Task type constant for generic guns.

### TASKTYPE_GUNSHOT

- **Address:** `0054087C`
- **Signature:** `int TASKTYPE_GUNSHOT();`
- **Description:** Task type constant for gun shots (projectiles).

## Weapons

### WEAPON_ID_PROXIMITYMINE

- **Address:** `00538DF4`
- **Signature:** `int WEAPON_ID_PROXIMITYMINE();`
- **Description:** Weapon ID constant for proximity mines.

### WEAPON_ID_M16A2

- **Address:** `00538E1C`
- **Signature:** `int WEAPON_ID_M16A2();`
- **Description:** Weapon ID constant for M16A2.

### WEAPON_ID_BINOCULARS

- **Address:** `00538E40`
- **Signature:** `int WEAPON_ID_BINOCULARS();`
- **Description:** Weapon ID constant for binoculars.

### WEAPONTYPE_PROXIMITYMINE

- **Address:** `00539314`
- **Signature:** `int WEAPONTYPE_PROXIMITYMINE();`
- **Description:** Weapon type constant for proximity mines.

### WEAPONTYPE_MEDIPACK

- **Address:** `00539330`
- **Signature:** `int WEAPONTYPE_MEDIPACK();`
- **Description:** Weapon type constant for medipacks.

### WEAPONTYPE_BINOCULAR

- **Address:** `00539344`
- **Signature:** `int WEAPONTYPE_BINOCULAR();`
- **Description:** Weapon type constant for binoculars.

### WEAPONTYPE_GRENADE

- **Address:** `0053935C`
- **Signature:** `int WEAPONTYPE_GRENADE();`
- **Description:** Weapon type constant for grenades.

### WEAPONTYPE_KNIFE

- **Address:** `00539370`
- **Signature:** `int WEAPONTYPE_KNIFE();`
- **Description:** Weapon type constant for knives.

### WEAPONTYPE_SHOTGUN

- **Address:** `00539384`
- **Signature:** `int WEAPONTYPE_SHOTGUN();`
- **Description:** Weapon type constant for shotguns.

### WEAPONTYPE_PISTOL

- **Address:** `00539398`
- **Signature:** `int WEAPONTYPE_PISTOL();`
- **Description:** Weapon type constant for pistols.

### WEAPONTYPE_GUN

- **Address:** `005393AC`
- **Signature:** `int WEAPONTYPE_GUN();`
- **Description:** Weapon type constant for generic guns.

### WEAPON_ID_MEDIPACK

- **Address:** `0053FF10`
- **Signature:** `int WEAPON_ID_MEDIPACK();`
- **Description:** Weapon ID constant for medipacks.

### WEAPON_ID_SPAS12

- **Address:** `00540394`
- **Signature:** `int WEAPON_ID_SPAS12();`
- **Description:** Weapon ID constant for SPAS-12 shotgun.

### WEAPON_ID_MP5SD

- **Address:** `0054050C`
- **Signature:** `int WEAPON_ID_MP5SD();`
- **Description:** Weapon ID constant for MP5SD submachine gun.

### WEAPON_ID_M2HB

- **Address:** `0054051C`
- **Signature:** `int WEAPON_ID_M2HB();`
- **Description:** Weapon ID constant for M2HB heavy machine gun.

