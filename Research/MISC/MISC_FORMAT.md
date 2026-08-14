# MISC Format - Consolidated Reference

Auto-generated consolidation of 20 research files.

---

## AI-Models.json

[
  {
    "ModelName": "ANYA",
    "ModelId": "015_01_1"
  },
  {
    "ModelName": "EKK",
    "ModelId": "012_01_1"
  },
  {
    "ModelName": "FRIENDLY",
    "ModelId": "020_01_1"
  },
  {
    "ModelName": "GUARD_AK",
    "ModelId": "004_01_1"
  },
  {
    "ModelName": "GUARD_AK",
    "ModelId": "006_01_1"
  },
  {
    "ModelName": "GUNNER",
    "ModelId": "011_02_1"
  },
  {
    "ModelName": "GUNNER",
    "ModelId": "011_03_1"
  },
  {
    "ModelName": "JACH_PRIBOI",
    "ModelId": "009_01_1"
  },
  {
    "ModelName": "JOSIP_PRIBOI",
    "ModelId": "009_02_1"
  },
  {
    "ModelName": "MAFIA2_PATROL_AK",
    "ModelId": "014_02_1"
  },
  {
    "ModelName": "MAFIA_PATROL_AK",
    "ModelId": "014_01_1"
  },
  {
    "ModelName": "PATROL_AK",
    "ModelId": "003_01_1"
  },
  {
    "ModelName": "PATROL_AK",
    "ModelId": "003_02_1"
  },
  {
    "ModelName": "RPG",
    "ModelId": "013_01_1"
  },
  {
    "ModelName": "SECURITY_PATROL_SPAS",
    "ModelId": "019_01_1"
  },
  {
    "ModelName": "SNIPER",
    "ModelId": "001_01_1"
  },
  {
    "ModelName": "SNIPER",
    "ModelId": "001_02_1"
  },
  {
    "ModelName": "SOLDIER_AK",
    "ModelId": "008_01_1"
  },
  {
    "ModelName": "SPETNAZ_GUARD_AK",
    "ModelId": "018_01_1"
  },
  {
    "ModelName": "CIVILIAN_GUY1",
    "ModelId": "011_01_1"
  },
  {
    "ModelName": "GUARD_WAREHOUSE",
    "ModelId": "004_02_1"
  },
  {
    "ModelName": "HARRISON",
    "ModelId": "021_01_1"
  },
  {
    "ModelName": "HARRISON",
    "ModelId": "022_01_1"
  },
  {
    "ModelName": "JONES",
    "ModelId": "000_01_1"
  },
  {
    "ModelName": "GENERAL",
    "ModelId": "016_01_1"
  }
]

---

## AIEVENTS.txt

AIEVENT_ALARMOFF
AIEVENT_ALARMON
AIEVENT_ALERT
AIEVENT_ALERT_RESPONSE
AIEVENT_ANIMATION
AIEVENT_COMBAT
AIEVENT_CREATE
AIEVENT_DEAD
AIEVENT_DELETE
AIEVENT_DOOR
AIEVENT_ENEMYDETECTION
AIEVENT_EXPLOSION
AIEVENT_FENCE
AIEVENT_FLASHBANG
AIEVENT_FRIENDLYDETECTION
AIEVENT_GRENADELAND
AIEVENT_GRENADETHROWN
AIEVENT_GROUNDIMPACT
AIEVENT_GUNSHOT
AIEVENT_GUNSHOTMISS
AIEVENT_IDLE
AIEVENT_LADDER
AIEVENT_TAKINGDAMAGE
AIEVENT_WALK

---

## AIEvents.json

[
  {
    "AIEvent": "AIEVENT_ALARMOFF",
    "AIEvenDesc": "The AI has turned off its alarm."
  },
  {
    "AIEvent": "AIEVENT_ALARMON",
    "AIEvenDesc": "The AI has turned on its alarm."
  },
  {
    "AIEvent": "AIEVENT_ALERT",
    "AIEvenDesc": "The AI has been alerted to something."
  },
  {
    "AIEvent": "AIEVENT_ALERT_RESPONSE",
    "AIEvenDesc": "The AI is responding to an alert."
  },
  {
    "AIEvent": "AIEVENT_ANIMATION",
    "AIEvenDesc": "The AI is playing an animation."
  },
  {
    "AIEvent": "AIEVENT_COMBAT",
    "AIEvenDesc": "The AI is in combat."
  },
  {
    "AIEvent": "AIEVENT_CREATE",
    "AIEvenDesc": "The AI has been created."
  },
  {
    "AIEvent": "AIEVENT_DEAD",
    "AIEvenDesc": "The AI has died."
  },
  {
    "AIEvent": "AIEVENT_DELETE",
    "AIEvenDesc": "The AI has been deleted."
  },
  {
    "AIEvent": "AIEVENT_DOOR",
    "AIEvenDesc": "The AI has interacted with a door."
  },
  {
    "AIEvent": "AIEVENT_ENEMYDETECTION",
    "AIEvenDesc": "The AI has detected an enemy."
  },
  {
    "AIEvent": "AIEVENT_EXPLOSION",
    "AIEvenDesc": "The AI has detected an explosion."
  },
  {
    "AIEvent": "AIEVENT_FENCE",
    "AIEvenDesc": "The AI has interacted with a fence."
  },
  {
    "AIEvent": "AIEVENT_FLASHBANG",
    "AIEvenDesc": "The AI has been flashed by a flashbang."
  },
  {
    "AIEvent": "AIEVENT_FRIENDLYDETECTION",
    "AIEvenDesc": "The AI has detected a friendly unit."
  },
  {
    "AIEvent": "AIEVENT_GRENADELAND",
    "AIEvenDesc": "The AI has detected a grenade landing."
  },
  {
    "AIEvent": "AIEVENT_GRENADETHROWN",
    "AIEvenDesc": "The AI has thrown a grenade."
  },
  {
    "AIEvent": "AIEVENT_GROUNDIMPACT",
    "AIEvenDesc": "The AI has detected a ground impact."
  },
  {
    "AIEvent": "AIEVENT_GUNSHOT",
    "AIEvenDesc": "The AI has heard a gunshot."
  },
  {
    "AIEvent": "AIEVENT_GUNSHOTMISS",
    "AIEvenDesc": "The AI has heard a gunshot that missed it."
  },
  {
    "AIEvent": "AIEVENT_IDLE",
    "AIEvenDesc": "The AI is idling."
  },
  {
    "AIEvent": "AIEVENT_LADDER",
    "AIEvenDesc": "The AI has interacted with a ladder."
  },
  {
    "AIEvent": "AIEVENT_TAKINGDAMAGE",
    "AIEvenDesc": "The AI is taking damage."
  },
  {
    "AIEvent": "AIEVENT_WALK",
    "AIEvenDesc": "The AI is walking."
  }
]

---

## AIFUNCTION.txt

AIFunction_SendResponse
AIFunction_GetAnimationToPlay
AIFunction_AddAnimationEntry
AIFunction_SetAnimationInterval
AIFunction_GetAlarmTriggerDistance
AIFunction_GetEventDistance
AIFunction_GetRandomValue
AIFunction_GetScriptRealValue
AIFunction_IsEventBehind
AIFunction_GetCurrentEventType
AIFunction_GetScriptIntegerValue
AIFunction_GetGunnerStatus
AIFunction_GetAlarmControlStatus
AIFunction_GetGunnerID
AIFunction_GetAlarmAccess
AIFunction_GetAlarmControlID
AIFunction_GetAlarmTriggerID
AIFunction_SetScriptRealValue
AIFunction_SetScriptIntegerValue
AIFunction_SetGunnerID
AIFunction_SetAlarmAccess
AIFunction_SetAlarmControlID
AIFunction_SetAlarmTriggerID
AIFunction_SetDeathAnimation
AIFunction_SetInstantDeath
AIFunction_SetInvulnerability
AIFunction_SetEventPriority
AIFunction_SetSecondaryViewGamma
AIFunction_SetSecondaryViewAlpha
AIFunction_SetSecondaryAlarmViewLength
AIFunction_SetSecondaryViewLength
AIFunction_SetViewGamma
AIFunction_SetViewAlpha
AIFunction_SetAlarmViewLength
AIFunction_SetViewLength
AIFunction_RemoveAlarmActions
AIFunction_DefaultHandler

---

## AIFUNCTIONS.json

[
  {
    "FunctionName": "AIFunction_SendResponse",
    "FunctionDesc": "Sends a response to an event."
  },
  {
    "FunctionName": "AIFunction_GetAnimationToPlay",
    "FunctionDesc": "Gets the animation to play for an event."
  },
  {
    "FunctionName": "AIFunction_AddAnimationEntry",
    "FunctionDesc": "Adds an animation entry to the animation queue."
  },
  {
    "FunctionName": "AIFunction_SetAnimationInterval",
    "FunctionDesc": "Sets the animation interval."
  },
  {
    "FunctionName": "AIFunction_GetAlarmTriggerDistance",
    "FunctionDesc": "Gets the alarm trigger distance."
  },
  {
    "FunctionName": "AIFunction_GetEventDistance",
    "FunctionDesc": "Gets the event distance."
  },
  {
    "FunctionName": "AIFunction_GetRandomValue",
    "FunctionDesc": "Gets a random value."
  },
  {
    "FunctionName": "AIFunction_GetScriptRealValue",
    "FunctionDesc": "Gets a script real value."
  },
  {
    "FunctionName": "AIFunction_IsEventBehind",
    "FunctionDesc": "Checks if an event is behind the current event."
  },
  {
    "FunctionName": "AIFunction_GetCurrentEventType",
    "FunctionDesc": "Gets the current event type."
  },
  {
    "FunctionName": "AIFunction_GetScriptIntegerValue",
    "FunctionDesc": "Gets a script integer value."
  },
  {
    "FunctionName": "AIFunction_GetGunnerStatus",
    "FunctionDesc": "Gets the gunner status."
  },
  {
    "FunctionName": "AIFunction_GetAlarmControlStatus",
    "FunctionDesc": "Gets the alarm control status."
  },
  {
    "FunctionName": "AIFunction_GetGunnerID",
    "FunctionDesc": "Gets the gunner ID."
  },
  {
    "FunctionName": "AIFunction_GetAlarmAccess",
    "FunctionDesc": "Gets the alarm access."
  },
  {
    "FunctionName": "AIFunction_GetAlarmControlID",
    "FunctionDesc": "Gets the alarm control ID."
  },
  {
    "FunctionName": "AIFunction_GetAlarmTriggerID",
    "FunctionDesc": "Gets the alarm trigger ID."
  },
  {
    "FunctionName": "AIFunction_SetScriptRealValue",
    "FunctionDesc": "Sets a script real value."
  },
  {
    "FunctionName": "AIFunction_SetScriptIntegerValue",
    "FunctionDesc": "Sets a script integer value."
  },
  {
    "FunctionName": "AIFunction_SetGunnerID",
    "FunctionDesc": "Sets the gunner ID."
  },
  {
    "FunctionName": "AIFunction_SetAlarmAccess",
    "FunctionDesc": "Sets the alarm access."
  },
  {
    "FunctionName": "AIFunction_SetAlarmControlID",
    "FunctionDesc": "Sets the alarm control ID."
  },
  {
    "FunctionName": "AIFunction_SetAlarmTriggerID",
    "FunctionDesc": "Sets the alarm trigger ID."
  },
  {
    "FunctionName": "AIFunction_SetDeathAnimation",
    "FunctionDesc": "Sets the death animation."
  },
  {
    "FunctionName": "AIFunction_SetInstantDeath",
    "FunctionDesc": "Sets the instant death."
  },
  {
    "FunctionName": "AIFunction_SetInvulnerability",
    "FunctionDesc": "Sets the invulnerability."
  },
  {
    "FunctionName": "AIFunction_SetEventPriority",
    "FunctionDesc": "Sets the event priority."
  },
  {
    "FunctionName": "AIFunction_SetSecondaryViewGamma",
    "FunctionDesc": "Sets the secondary view gamma."
  },
  {
    "FunctionName": "AIFunction_SetSecondaryViewAlpha",
    "FunctionDesc": "Sets the secondary view alpha."
  },
  {
    "FunctionName": "AIFunction_SetSecondaryAlarmViewLength",
    "FunctionDesc": "Sets the secondary alarm view length."
  },
  {
    "FunctionName": "AIFunction_SetSecondaryViewLength",
    "FunctionDesc": "Sets the secondary view length."
  },
  {
    "FunctionName": "AIFunction_SetViewGamma",
    "FunctionDesc": "Sets the view gamma."
  },
  {
    "FunctionName": "AIFunction_SetViewAlpha",
    "FunctionDesc": "Sets the view alpha."
  },
  {
    "FunctionName": "AIFunction_SetAlarmViewLength",
    "FunctionDesc": "Sets the alarm view length."
  },
  {
    "FunctionName": "AIFunction_SetViewLength",
    "FunctionDesc": "Sets the view length."
  },
  {
    "FunctionName": "AIFunction_RemoveAlarmActions",
    "FunctionDesc": "Removes all alarm actions."
  },
  {
    "FunctionName": "AIFunction_DefaultHandler",
    "FunctionDesc": "The default handler for AI functions."
  }
]

---

## AISCRIPTS_DATA.txt

//Data provided by Yoejin.
//Extracted using tools.
"AIFunction_SetMinRangeAccuracy"
"AIFunction_SetMedRangeAccuracy"
"AIFunction_SetMaxRangeAccuracy"
"AIFunction_SetAccuracyMedRange"
"AIFunction_SetAccuracyMaxRange"
"AIFunction_SetPercentageFiredPerBurst"
"AIFunction_SetEvasiveActionProb"
"AIFunction_SetMinDelayBetweenFiring"
"AIFunction_SetTrackingTimeout"
"AIFunction_SetTrackingMaxDistance"
"AIFunction_SetGrenadeThrowProb"
"AIFunction_SetGrenadeDetonationTimer"
"AIFunction_SetGrenadeLandingReactionProb"
"AIFunction_SetCloseCombatDamage"
"AIFunction_SetHitPoints"
"AIFunction_SetHitRecoilThreshold"
"AIFunction_SetCombatViewCone1Alpha"
"AIFunction_SetCombatViewCone1Length"
"AIFunction_SetCombatViewCone2Alpha"
"AIFunction_SetCombatViewCone2Length"
"AIFunction_SetIdleViewCone1Alpha"
"AIFunction_SetIdleViewCone1Length"
"AIFunction_SetIdleViewCone2Alpha"
"AIFunction_SetIdleViewCone2Length"
"AIFunction_SetIdleAnimationFrequency"
"AIFunction_SetInvestigateViewCone1Alpha"
"AIFunction_SetInvestigateViewCone1Length"
"AIFunction_SetInvestigateViewCone2Alpha"
"AIFunction_SetInvestigateViewCone2Length"
"AIFunction_SetInvestigateShoutFrequency"
"AIFunction_SetAnimSpeedFactor"
"AIFunction_SetHearingRangeFactor"
"AIFunction_SetSideKick"
"AIFunction_UseCombatView"
"AIFunction_UseIdleView"
"AIFunction_HasSeenDeadFriendlyBefore"
"AIFunction_SetStandActionAnimation"
"AIFunction_HasTarget"
"AIFunction_LimitViewRange"
"AIAction_DelayedEventPassOn"
"AIAction_Patrol"
"AIAction_Dead"
"AIAction_FallFlat"
"AIAction_Activate"
"AIAction_WalkToNode"
"AIAction_RunToNode"
"AIAction_FireAtNode"
"AIAction_FireAtTask"
"AIAction_PlayAnimation"
"AIAction_MoveToEvent"
"AIAction_LookAtEvent"
"AIAction_LookInApproximateEventDirection"
"AIAction_Stunned"
"AIAction_KickGrenade"
"AIAction_RunPanicking"
"AIAction_Idle"
"AIAction_CombatIdle"
"AIAction_LookAround"
"AIAction_CallForBackup"
"AIAction_EnemyDetection"
"AIAction_LookAtNode"
"AIAction_FriendlyDetection"
"AIAction_RunToCover"
"AIAction_Wait"
"AIAction_OffensiveCombat"
"AIAction_DefensiveCombat"
"AIFunction_RemoveAlarmActions"
"AIFunction_SetViewLength"
"AIFunction_SetViewAlpha"
"AIFunction_SetViewGamma"
"AIFunction_SetSecondaryViewLength"
"AIFunction_SetSecondaryViewAlpha"
"AIFunction_SetSecondaryViewGamma"
"AIFunction_SetEventPriority"
"AIFunction_SetInvulnerability"
"AIFunction_SetInstantDeath"
"AIFunction_SetDeathAnimation"
"AIFunction_SetAlarmAccess"
"AIFunction_SetGunnerID"
"AIFunction_GetGunnerID"
"AIFunction_GetGunnerStatus"
"AIFunction_SetScriptIntegerValue"
"AIFunction_SetScriptRealValue"
"AIFunction_GetScriptIntegerValue"
"AIFunction_GetScriptRealValue"
"AIFunction_GetCurrentEventType"
"AIFunction_GetRandomValue"
"AIFunction_DefaultHandler"
"AIAction_PlaySound"
"AIFunction_IsEventBehind"
"AIFunction_GetEventDistance"
"AIFunction_SetAnimationInterval"
"AIFunction_AddAnimationEntry"
"AIFunction_GetAnimationToPlay"
"AIFunction_SendResponse"
"AIFunction_PassEventOnToSquad"
"AIEVENT_CREATE"
"AIEVENT_DELETE"
"AIEVENT_DEAD"
"AIEVENT_ANIMATION"
"AIEVENT_IDLE"
"AIEVENT_ALERT"
"AIEVENT_ALERT_RESPONSE"
"AIEVENT_ALARMON"
"AIEVENT_ALARMOFF"
"AIEVENT_WALK"
"AIEVENT_GROUNDIMPACT"
"AIEVENT_DOOR"
"AIEVENT_FENCE"
"AIEVENT_LADDER"
"AIEVENT_TAKINGDAMAGE"
"AIEVENT_GUNSHOT"
"AIEVENT_GRENADETHROWN"
"AIEVENT_GRENADELAND"
"AIEVENT_FLASHBANG"
"AIEVENT_GUNSHOTMISS"
"AIEVENT_EXPLOSION"
"AIEVENT_ENEMYDETECTION"
"AIEVENT_ENEMYDETECTION_NO_LOF"
"AIEVENT_FRIENDLYDETECTION"
"AIEVENT_FRIENDLY_GUNSHOT"
"AIEVENT_DEATH_CRY"
"AIEVENT_BACKUP_REQUEST"
"AIEVENT_SEENSOMETHING"
"AIEVENT_LOSTSIGHTOFENEMY"
"AIEVENT_SQUADCOMMAND"
"AIEVENT_INQUIRETIMEOUT"
"AIEVENT_SQUADCOMBATIDLE"
"AIEVENT_WOUNDED_CRY"
"AIEVENT_PATROLCOMMANDPROCESSED"
"AIEVENT_FRIENDLY_DYING"
"AIEVENT_DESTROYED_CAMERA"
"AIEVENT_FRIENDLY_DAMAGE_SEEN"
"AIEVENT_GRENADESHOUT"
"AIEVENT_DANGERSTATETIMEOUT"
"AIEVENT_VISUAL_GUNSHOT"
"AIEVENT_DONELOOKING"
"AIEVENT_DISTRESSCALL"
"AIEVENT_BULLETIMPACT"
"AIEVENT_SEARCHOVER"
"AIEVENT_HANDLEWEAPON"
"AIEVENT_CAMERAALARMUPDATE"
"AIEVENT_REACTTOSUSPICION"
"AIACTIONFLAG_NONE"
"AIACTIONFLAG_PUSHABLE"
"HUMANAI_DETECTIONEVENT_GUNSHOT_SILENCED_RANGE"
"HUMANAI_DETECTIONEVENT_GUNSHOT_PISTOL_RANGE"
"HUMANAI_DETECTIONEVENT_GUNSHOT_RANGE"
"HUMANAI_DETECTIONEVENT_CANNON_RANGE"
"HUMANAI_ANIMTYPE_PRIBOY"
"HUMANAI_ANIMTYPE_SOLDIER"
"AIALARMACCESS_BEFORECOMBAT"
"AIALARMACCESS_AFTERCOMBAT"
"AILOOKAROUND_PATTERN_180_CLOCKWISE"
"AILOOKAROUND_PATTERN_90_CLOCKWISE_QUICK"
"AILOOKAROUND_PATTERN_180_COUNTERCLOCKWISE"
"AILOOKAROUND_PATTERN_360_SLOW"
"AILOOKAROUND_PATTERN_360_FAST"

---

## AITYPES.json

{
  "AITYPE_MAFIA": {
    "childs": [
      "AITYPE_MAFIA_GUARD_AK",
      "AITYPE_MAFIA_GUARD_SPAS",
      "AITYPE_MAFIA_GUARD_UZI",
      "AITYPE_MAFIA_PATROL_AK",
      "AITYPE_MAFIA_PATROL_SPAS",
      "AITYPE_MAFIA_PATROL_UZI"
    ]
  },
  "AITYPE_GUARD": {
    "childs": [
      "AITYPE_GUARD_AK",
      "AITYPE_GUARD_PISTOL",
      "AITYPE_GUARD_SPAS",
      "AITYPE_GUARD_UZI"
    ]
  },
  "AITYPE_PATROL": {
    "childs": [
      "AITYPE_PATROL_AK",
      "AITYPE_PATROL_PISTOL",
      "AITYPE_PATROL_SPAS",
      "AITYPE_PATROL_UZI"
    ]
  },
  "AITYPE_SECURITY_PATROL": {
    "childs": [
      "AITYPE_SECURITY_PATROL_SPAS",
      "AITYPE_SECURITY_PATROL_UZI"
    ]
  },
  "AITYPE_SPETNAZ_GUARD": {
    "childs": [
      "AITYPE_SPETNAZ_GUARD_AK",
      "AITYPE_SPETNAZ_GUARD_SPAS",
      "AITYPE_SPETNAZ_GUARD_UZI"
    ]
  },
  "AITYPE_SPETNAZ_PATROL": {
    "childs": [
      "AITYPE_SPETNAZ_PATROL_AK",
      "AITYPE_SPETNAZ_PATROL_SPAS",
      "AITYPE_SPETNAZ_PATROL_UZI"
    ]
  },
  "AITYPE_OTHERS": {
    "childs": [
      "AITYPE_ANYA",
      "AITYPE_CIVILIAN",
      "AITYPE_EKK",
      "AITYPE_GUNNER",
      "AITYPE_PRIBOI",
      "AITYPE_RPG",
      "AITYPE_SNIPER"
    ]
  }
}

---

## AITYPES.txt

AITYPE_ANYA
AITYPE_CIVILIAN
AITYPE_EKK
AITYPE_GUARD_AK
AITYPE_GUARD_PISTOL
AITYPE_GUARD_SPAS
AITYPE_GUARD_UZI
AITYPE_GUNNER
AITYPE_MAFIA_GUARD_AK
AITYPE_MAFIA_GUARD_SPAS
AITYPE_MAFIA_GUARD_UZI
AITYPE_MAFIA_PATROL_AK
AITYPE_MAFIA_PATROL_SPAS
AITYPE_MAFIA_PATROL_UZI
AITYPE_PATROL_AK
AITYPE_PATROL_PISTOL
AITYPE_PATROL_SPAS
AITYPE_PATROL_UZI
AITYPE_PRIBOI
AITYPE_RPG
AITYPE_SECURITY_PATROL_SPAS
AITYPE_SECURITY_PATROL_UZI
AITYPE_SNIPER
AITYPE_SPETNAZ_GUARD_AK
AITYPE_SPETNAZ_GUARD_SPAS
AITYPE_SPETNAZ_GUARD_UZI
AITYPE_SPETNAZ_PATROL_AK
AITYPE_SPETNAZ_PATROL_SPAS
AITYPE_SPETNAZ_PATROL_UZI

---

## CameraEngine.md

This is a **high-level overview** of how the camera works in Project I.G.I and in game engines generally — short, clear, and practical.

---

# 🧠 1️⃣ What Is a Camera in a Game Engine?

A camera in a 3D engine is:

> A mathematical transform that defines how the world is viewed.

It consists of:

- 📍 **Position** (X, Y, Z)
- 🔄 **Rotation** (orientation in space)
- 📐 **Projection settings** (FOV, near/far plane)

The camera does not move the world.

Instead:

```
World is transformed relative to camera.
```

---

# 🎥 2️⃣ Basic Camera Concepts

## 📍 Position

Defines where the camera exists in 3D space:

```
X → Left / Right
Y → Forward / Backward
Z → Up / Down
```

---

## 🔄 Rotation

Defined by three angles:

### 🧭 Yaw
- Turn left / right
- Rotation around vertical axis

### 🔼 Pitch
- Look up / down
- Rotation around side axis

### 🔁 Roll
- Tilt sideways
- Rarely used in FPS games

In IGI:

- Yaw + Pitch are active
- Roll is typically unused

---

# 🧮 3️⃣ Rotation Matrix (Why 9 Floats?)

Instead of storing yaw/pitch directly,
IGI converts them into a **3×3 rotation matrix**.

Conceptually:

```c
float rotation[9]; // 3x3 orientation matrix
```

Why?

- Faster rendering math
- Stable 3D transformations
- Direct use in view matrix calculations

---

# 🏗 4️⃣ Structure of IGI Camera (Simplified)

Internally it looks similar to:

```c
typedef struct IGICamera
{
    float rotation[9];   // Orientation
    float position[3];   // X, Y, Z
    float stateData[...];
} IGICamera;
```

Then copied into a viewport structure used by the renderer.

---

# 🖥 5️⃣ What Is the Viewport?

The viewport is:

> The final camera buffer used by the renderer.

It contains:

- Rotation (floats)
- Position (often doubles for precision)
- Rendering-related values

Renderer reads this every frame.

---

# 🔁 6️⃣ IGI Camera Flow (Simplified)

Each frame:

```
Mouse Input
     ↓
Update Yaw & Pitch
     ↓
Build Rotation Matrix
     ↓
Update Position
     ↓
Copy Camera → Viewport
     ↓
Render Scene
```

---

# 🎬 7️⃣ Use Cases of IGI Camera System

IGI uses the same base system for:

- 🎯 First-person gameplay
- 👤 Third-person mode
- 🎥 Mission scripted cameras
- 🎬 Cutscenes
- 🛰 Debug camera modes

The difference is only how:

- Position is updated
- Rotation is controlled
- Camera state flags are set

---

# 🧩 Core Takeaway

IGI Camera =

- Position in 3D space
- Orientation (Yaw + Pitch → Rotation Matrix)
- Copied into viewport
- Used by renderer

Everything visual in the game depends on this transform.

That’s the entire foundation of the IGI camera engine. 🚀

---

## EVENTS.txt

EVENT_ANIMATION
EVENT_COMBAT
EVENT_CREATE
EVENT_DEAD
EVENT_DELETE
EVENT_DOOR
EVENT_ENEMYDETECTION
EVENT_EXPLOSION
EVENT_FENCE
EVENT_FLASHBANG
EVENT_FRIENDLYDETECTION
EVENT_GRENADELAND
EVENT_GRENADETHROWN
EVENT_GROUNDIMPACT
EVENT_GUNSHOT
EVENT_GUNSHOTMISS
EVENT_IDLE
EVENT_LADDER
EVENT_TAKINGDAMAGE
EVENT_WALK

---

## GCONV_SCRIPTS.qsc

//This data was provided by Artiom.
//And was extracted from GConv official Game convertor for IGI 1 & 2.

AddAnimFrame();
AddDirectoryResource();
AddPaletteImage();
AddResource();
AddStringResource();
AddToTextureScript();
AdjustCharPosition();
AdjustCharSpacing();
AmbientTMap();
AnimAttachObject();
AnimAttachObjectBoneID();
AnimInit();
AttachObject();
AttachObjectBoneID();
AttachObjectKeyFrame();
AttachObjectKeyFrameInit();
AutoMipMap();
AutoVQ();
BeginAnim();
BeginPalette();
BeginResource();
BeginSwappedAnim();
Bone();
BuildDynamic();
BuildHierarchy();
BuildPatch();
BuildStatic();
BumpHeight();
BumpTMap();
CheckTextureAlpha();
CompilePatch();
CompileScript();
CompileScriptsRecursive();
ConversionMode();
ConvertSoundFile();
ConvertSoundFileToLipsyncResource();
ConvertSoundFileToResource();
CreateAnim();
CreateAnimRandomAccess();
CreateCompleteModelBone();
CreateCompleteModelLightmap();
CreateCompleteModelRigid();
CreateModelBoneNotVirtual();
CreateModelRigidNotVirtual();
CreateShadowVolume();
CreateVirtualModel();
Debug();
DefaultAlignment();
DefaultSoundConvertMethod();
DefinePaletteInVirTex();
DefineVirTex();
DiffuseTMap();
Dither();
DumpFont();
DumpResource();
EndAnim();
EndPalette();
EndResource();
EndTexScript();
EqualTileCheck();
ErrorLevel();
Exec();
ExtractResource();
Face();
FIXEDSIZE();
FlipTileCheck();
FontAutoScan();
FontSpacing();
FontTileHeight();
FontTileWidth();
FontType();
FontWhiteSpace();
ForceVQ();
Glow();
HalfSize();
IncludePalette();
IncludeResourceDebug();
IncludeSound();
InputPath();
LinkEvent();
LoadCommon();
LoadPalette();
LoadScript();
MagicVertex();
MakeAnim();
MakeFont();
MakeMultiTexture();
MakeOutline();
MakePalette();
MakePicture();
MakeSprite();
MakeTexture();
MakeTGA();
MakeTGARecursive();
Material();
MaterialShininess();
MaterialTransparencyType();
MorphChannel();
MorphVertex();
NewAnim();
NewObject();
Normal();
OpacityTMap();
OutputMode();
OutputPath();
PatchIgnoreFile();
PROPORTIONAL();
QTASK_TYPE_UNDEFINED();
ReduceColours();
ReflectionTMap();
RemapImage();
ReplaceApostrophes();
RotationKeyFrameData();
RotationKeyFrameInit();
SemiTransparency();
Set100TransOnlyCollPoly();
SetAnimDirectory();
SetCharParts();
SetCharSpacing();
SetFontTable();
SetLightmapResolution();
SetLightmapResolutionDivider();
SetModelDirectory();
SetPaletteDirectory();
SetRawFileSize();
SetScale();
SetTargetPlatform();
SetTempDirectory();
SetTextureDirectory();
SetTileSize();
StartTexScript();
StripResourceDebug();
TempPath();
TextureScaleFactor();
TranslationKeyFrameData();
TranslationKeyFrameInit();
Transparency();
TransparencySource();
TransparentColour();
TriggerData();
TriggerInit();
UpToDateCheck();
UseEmptyCommon();
UseVQdll();
UV();
Verbosity();
Vertex();
VertexInfluenceRigid();
VertexInfluenceType();
VerticalFontSpacing();


// unknown identifier Convert();
// unknown identifier ConvertBoneDirect3D();
// unknown identifier ConvertLightmapDirect3D();
// unknown identifier ConvertRigidDirect3D();
// unknown identifier ConvertShadowDirect3D();
// unknown identifier Create();
// unknown identifier Delete();
// unknown identifier EnumerateTasks();
// unknown identifier Fixedsize();
// unknown identifier Font();
// unknown identifier NewFont();
// unknown identifier Output();
// unknown identifier ParentChanged();
// unknown identifier Parse();
// unknown identifier PrepareDelete();
// unknown identifier Proportional();
// unknown identifier QTask();
// unknown identifier QTaskNotDeallocated();
// unknown identifier Replace();
// unknown identifier Run();
// unknown identifier World();

---

## GConv_Script.cpp

// ============================================================================
// GCONV 3.5 API - C++ ENGINE METHOD DECLARATIONS
// Extracted from gconvapi.dll & script compilers (*.qsc, *.qvm, *.dat, *.mtp)
// ============================================================================

// --- CORE DLL ENGINE EXPORTS ---
void gcInit();
void gcFree(void* ptr);
void* gcMalloc(int size);
int gcParseCommandLine(string cmdLine);
void gcExecuteScript(string scriptPath);
void gcSetErrorCallback(void* callbackFunc);
void gcSetFreeCallback(void* callbackFunc);
void gcSetMallocCallback(void* callbackFunc);
void gcSetMessageCallback(void* callbackFunc);
void gcNewOption(string optionName, string value);
void gcOverrideUpToDateCheck(bool bOverride);
string gcGetInputPath();
string gcGetOutputPath();
string gcGetTempPath();
int gcGetNumberOfErrors();
void gcMessage(string messageText);
void gcError(string errorText);
void gcSetInputPath(string path);
void gcSetOutputPath(string path);
void gcSetTempPath(string path);
void gcSetOutputMode(string platformMode);       // e.g., "PC_Glide", "Dreamcast", "N64"
void gcSetTextureFormat(string format);          // e.g., "ARGB1555", "ARGB8888", "RGB565"
void gcSetErrorLevel(int level);                 // 0: Ignore, 1: stderr, 2: Dialog, 3: Abort
void gcSetVerbosity(int level);                  // Message detail logging level (0 to 5)
void gcSetAutoMipmap(bool bEnable);
void gcSetAutoVQ(bool bEnable);
void gcSetDithering(bool bEnable);
void gcSetTransparency(bool bEnable);
void gcSetTransparentColour(int colorIndex);

// --- VIRTUAL FILE SYSTEM (VFS) RESOURCE BUNDLING ---
void BeginResource(string resourcePath);
void AddResource(string virtualName, string localPath);
void AddStringResource(string textKey, string textValue);
void AddDirectoryResource(string folderRoute);
void EndResource();
void DumpResource(string resourcePath);
void ExtractResource(string targetElement);
void ReplaceApostrophes(bool bEnable);
void StripResourceDebug(bool bEnable);
void IncludeResourceDebug(bool bEnable);
void DefaultAlignment(int byteAlignment);

// --- GRAPHICS & TEXTURE PROCESSING PIPELINE ---
void MakeTexture(string sourceImage, string targetTex);
void MakeMultiTexture(string configFilename);
void MakePicture(string sourceImage, string targetPic);
void MakeSprite(string sourceImage, string targetSpr);
void MakeTGA(string sourceFile, string destTga);
void MakeTGARecursive(string folderRoute);        // Performs batch updates on structural graphics trees to Targa formats
void MakePalette(string sourceImage, string targetPal);
void ReduceColours(string sourceImage, int colorCount);
void BeginPalette(string palettePath);
void AddPaletteImage(string sourceImage);
void EndPalette();
void LoadPalette(string palettePath);
void RemapImage(string sourceImage);
void FlipTileCheck(bool bEnable);
void EqualTileCheck(bool bEnable);
void SemiTransparency(bool bEnable);

// --- TYPOGRAPHY & FONT MANAGEMENT ---
void NewFont(string fontIdName);
void MakeFont(string fontSheetImage, string targetFont);
void DumpFont(string fontFile);
void MakeOutline(int pixelThickness);
void SetTileSize(int width, int height);
void SetCharSpacing(int defaultPixels);
void AdjustCharPosition(int charCode, int xOffset, int yOffset);
void AdjustCharSpacing(int charCode, int extraPixels);
void SetCharParts(int charCode, int totalElements);
void SetFontTable(string layoutMappingString);
void FontAutoScan(bool bEnable);
void FontType(string typeMode);                   // "FIXEDSIZE" or "PROPORTIONAL"

// --- 3D MESH COMPILATION & MATERIAL BINDING ---
void CreateVirtualModel(string modelName, string baseAsset);
void CreateModelRigidNotVirtual(string meshName);
void CreateModelBoneNotVirtual(string meshName);
void CreateCompleteModelRigid(string meshName);
void CreateCompleteModelBone(string meshName);
void CreateCompleteModelLightmap(string meshName);
void CreateShadowVolume(string meshName);
void NewObject(string segmentName);
void AttachObject(string itemLabel);
void AttachObjectBoneID(string itemLabel, int boneIndex);
void Vertex(float x, float y, float z);
void Normal(float nx, float ny, float nz);
void UV(float u, float v);
void Face(int v1, int v2, int v3);
void MagicVertex(int typeFlag, int indexValue);
void VertexInfluenceRigid(int jointId, float weightValue);
void VertexInfluenceType(string trackingMethodName);
void MorphChannel(int channelIndex);
void MorphVertex(int vertexIndex, float x, float y, float z);
void Glow(string glowTypeFlag);
void Material(string profileLabel);
void MaterialTransparencyType(int blendModeId);
void MaterialShininess(float intensityValue);
void DiffuseTMap(string textureFilename);
void AmbientTMap(string textureFilename);
void BumpTMap(string textureFilename);
void ReflectionTMap(string textureFilename);
void OpacityTMap(string textureFilename);
void Convert();
void ConvertRigidDirect3D();
void ConvertShadowDirect3D();
void ConvertBoneDirect3D();
void ConvertLightmapDirect3D();

// --- SKELETAL KEYFRAME ANIMATION SYSTEM ---
void NewAnim(string animationId);
void BeginAnim(string animationId);
void BeginSwappedAnim(string animationId);
void AddAnimFrame(string sourceFrameFile);
void MakeAnim(string animationId);
void EndAnim();
void SetScale(float scalingFactor);
void AnimAttachObject(string subMeshLabel);
void AnimAttachObjectBoneID(string subMeshLabel, int jointId);
void AttachObjectKeyFrame(int frameTimeIndex);
void AttachObjectKeyFrameInit();
void TranslationKeyFrameData(int timeStamp, float x, float y, float z);
void TranslationKeyFrameInit();
void RotationKeyFrameData(int timeStamp, float qx, float qy, float qz, float qw); // Quaternion rotation
void RotationKeyFrameInit();
void LinkEvent(int timeStamp, string eventStringId);
void TriggerData(int timeStamp, string scriptActionCode);
void TriggerInit();
void AnimInit();
void CreateAnim(string targetFilename);
void CreateAnimRandomAccess(string targetFilename);
void SetAnimDirectory(string path);

// --- TEXTURE SCRIPT CONTEXTS (*.dat / *.mtp) ---
void StartTexScript();
void EndTexScript();
void UseEmptyCommon();
void LoadCommon(string trackingDatabasePath);
void BuildDynamic();
void BuildStatic();
void DefinePaletteInVirTex(string paletteId);
void DefineVirTex(string virtualTextureIdName);
void SetModelDirectory(string path);
void SetTextureDirectory(string path);
void SetPaletteDirectory(string path);
void SetTempDirectory(string path);
void SetTargetPlatform(string systemName);
void SetLightmapResolution(int pixelsSquare);
void SetLightmapResolutionDivider(int divisorScale);
void CheckTextureAlpha(string imageFilename);
void AddToTextureScript(string assetLabelName);
void Parse(string scriptFilename);
void Output(string targetFilename);
void Set100TransOnlyCollPoly(bool bEnable);

// --- AUDIO & CODE PATCH SCRIPTS ---
void DefaultSoundConvertMethod(string modeMethod); // e.g., "SOUNDPACKMETHOD_ADPCM_RESIDENT"
void ConvertSoundFile(string inputWav, string outputFormat);
void ConvertSoundFileToResource(string sourceWav, string targetRes);
void ConvertSoundFileToLipsyncResource(string wav, string res, float threshold);
void CompilePatch(string scriptPath, string targetPatchFile);
void BuildPatch();
void PatchIgnoreFile(string trackingFilename);

// --- SCRIPT COMPILATION & VM CONTROLS (*.qsc / *.qvm) ---
void CompileScript(string scriptFile, string targetQvm);
void CompileScriptsRecursive(string rootFolder);
void LoadScript(string targetQvm);
void Exec();
void BreakScript();
void _Script_SetWarningLevel(string severityLevelFlag);

---

## IGI-SFX.json

[
  {
    "name": "Ambience",
    "children": [
      "m1_ambience",
      "m13_ambience",
      "m14_ambience",
      "m11_ambience",
      "m2_ambience",
      "m3_ambience",
      "m4_ambience",
      "m5_ambience",
      "m6_ambience",
      "m7_ambience",
      "m8_ambience",
      "m9_ambience"
    ]
  },
  {
    "name": "Animal",
    "children": [
      "bird_01",
      "bird_02",
      "bird_03",
      "dog_01",
      "dog_01_cut",
      "dog_02",
      "dog_02_cut"
    ]
  },
  {
    "name": "Car",
    "children": [
      "car_01",
      "car_1"
    ]
  },
  {
    "name": "Clothing",
    "children": [
      "bul_textile_1"
    ]
  },
  {
    "name": "Concrete",
    "children": [
      "bul_concrete_1",
      "bul_concrete_2"
    ]
  },
  {
    "name": "Dirt",
    "children": [
      "bul_dirt_1",
      "bul_dirt_2"
    ]
  },
  {
    "name": "Door",
    "children": [
      "door_close_1",
      "door_move_1",
      "door_open_1",
      "door_slide_1"
    ]
  },
  {
    "name": "Electricity",
    "children": [
      "electricity_2"
    ]
  },
  {
    "name": "Flesh",
    "children": [
      "bul_flesh_1",
      "bul_flesh_2",
      "bul_flesh_3",
      "bul_flesh_4",
      "bul_flesh_5"
    ]
  },
  {
    "name": "Glass",
    "children": [
      "bul_glass_1",
      "bul_glass_2",
      "bul_glass_3",
      "bul_glass_4"
    ]
  },
  {
    "name": "Gun",
    "children": [
      "ak47_SFX",
      "colt_shot_1",
      "glock_reload_1",
      "glock_reload_2",
      "glock_reload_3",
      "glock_shot_1",
      "glock_shot_2",
      "jackh_loop",
      "jackh_loop_e",
      "jackh_reload_1",
      "jackh_reload_2",
      "jackh_reload_3",
      "jackh_reload_4",
      "m16_g_reload_1",
      "m16_loop",
      "m16_loop_e",
      "m16_reload_1",
      "m16_reload_2",
      "m16_reload_3",
      "m203_launch_1",
      "m2hb_loop"
    ]
  },
  {
    "name": "Nature",
    "children": [
      "tree_01",
      "tree_02",
      "tree_03"
    ]
  },
  {
    "name": "Person",
    "children": [
      "man_01",
      "man_02",
      "woman_01",
      "woman_02"
    ]
  },
  {
    "name": "Plastic",
    "children": [
      "bul_plastic_1",
      "bul_plastic_2",
      "bul_plastic_3"
    ]
  },
  {
    "name": "Rock",
    "children": [
      "bul_rock_1",
      "bul_rock_2",
      "bul_rock_3"
    ]
  },
  {
    "name": "Wood",
    "children": [
      "bul_wood_1",
      "bul_wood_2",
      "bul_wood_3"
    ]
  }
]

---

## IGI-SFX.txt

"ai_death_0",
"ai_death_1",
"ai_death_2",
"ai_death_3",
"ai_groin_01",
"ai_hit_1",
"ai_hit_2",
"ai_hit_3",
"ak47_loop",
"ak47_loop_e",
"ak47_reload_1",
"ak47_reload_2",
"ak47_reload_3",
"alarmsystem_working",
"anya_test_01",
"apc_sounds",
"base_amb_01",
"bgate_loop",
"big_door_01",
"bin_zoom_1",
"bird_01",
"bird_02",
"bird_03",
"bodyfall_9",
"breathe_cut",
"bul_asphalt_1",
"bul_asphalt_2",
"bul_carton_1",
"bul_carton_2",
"bul_carton_3",
"bul_concrete_1",
"bul_concrete_2",
"bul_dirt_1",
"bul_dirt_2",
"bul_flesh_1",
"bul_flesh_2",
"bul_flesh_3",
"bul_flesh_4",
"bul_flesh_5",
"bul_glass_1",
"bul_glass_2",
"bul_glass_3",
"bul_glass_4",
"bul_gravel_1",
"bul_gravel_2",
"bul_gravel_3",
"bul_metal_fnc_1",
"bul_metal_fnc_2",
"bul_metal_hrd_1",
"bul_metal_hrd_2",
"bul_metal_hrd_3",
"bul_metal_nrm_1",
"bul_metal_nrm_2",
"bul_metal_nrm_3",
"bul_metal_sft_1",
"bul_metal_sft_2",
"bul_metal_sft_3",
"bul_metal_sft_4",
"bul_plastic_1",
"bul_porc_1",
"bul_porc_4",
"bul_rubber_1",
"bul_textile_1",
"bul_wood_1",
"bul_wood_2",
"bul_wood_3",
"bul_wood_4",
"bul_wood_5",
"bul_wood_6",
"cabinet",
"camera_beep_al",
"camera_beep_l",
"camera_beep_s",
"camera_move",
"car_01",
"car_1",
"colt_shot_1",
"detected_01",
"detected_02",
"detected_03",
"detected_04",
"detected_05",
"detected_06",
"detected_hear",
"dogs_01",
"dogs_02",
"dogs_03",
"dog_01",
"dog_01_cut",
"dog_02",
"dog_02_cut",
"dog_03",
"doorsl_close_1",
"doorsl_move_1",
"doorsl_open_1",
"door_close_1",
"door_move_1",
"door_open_1",
"door_slide_1",
"dragu_reload_1",
"dragu_reload_2",
"earcandy",
"electricity_2",
"elfence_loop",
"elvdoor_close",
"elvdoor_cl_1",
"elvdoor_move",
"elvdoor_mve_1",
"elvdoor_open",
"elvdoor_op_1",
"elv_move_1",
"elv_stop_1",
"explo",
"explosion0",
"explosion_1",
"explo_01_s",
"explo_02_m",
"explo_03_l",
"explo_04_xl",
"explo_camera",
"explo_flash",
"explo_monitor",
"explo_m_02",
"explo_proxy",
"explo_sm_0",
"fan_big",
"fan_small",
"gate_loop",
"gate_loop_e",
"generator_low",
"generator_run",
"generator_stop",
"glass_crush_1",
"glass_crush_2",
"glass_crush_3",
"glock_reload_1",
"glock_reload_2",
"glock_reload_3",
"glock_shot_1",
"glock_shot_2",
"gondola_fx_01",
"gondola_fx_02",
"gondola_fx_03",
"gondola_fx_04",
"gondola_fx_06",
"gondola_fx_07",
"gondola_loop_01",
"gondola_loop_02",
"grenade_bnc_1",
"grenade_shot_1",
"grenade_tick_1",
"gunpunch_01",
"gunshotmiss",
"guns_dry_1",
"hammer_01",
"hammer_01_cut",
"hammer_1",
"helicopter_1",
"helicopter_cut",
"heli_by_01",
"heli_by_01_cut",
"Hit0",
"jackh_loop",
"jackh_loop_e",
"jackh_reload_1",
"jackh_reload_2",
"jackh_reload_3",
"jackh_reload_4",
"jump_1",
"knife_1",
"knife_2",
"land_ground_1",
"land_ground_2",
"land_ground_3",
"land_ground_4",
"land_ground_5",
"m10o_ak1",
"m10o_heliaway",
"m10o_heliblad",
"m10o_heliblfd",
"m10o_helistrt",
"m10o_rain1",
"m10o_rain2",
"m10o_run1",
"m10o_tankshot1",
"m10o_tankshot2",
"m10o_uzi1",
"m10o_voice1",
"m10o_voice2",
"m10o_voice3",
"m10o_voice4",
"m10o_voice5",
"m10o_voice7",
"m10o_voice8",
"m10o_war1",
"m10_ambience",
"m11_beeps",
"m11_heliby",
"m11_helichase",
"m11_heliland",
"m11_office1",
"m11_type",
"m11_wind",
"m11_windfx1",
"m11_windfx2",
"m11_windland",
"m12_baltochat",
"m12_heliloop2",
"m12_heliloop3",
"m12_ugfx1",
"m12_ugfx2",
"m12_ugfx3",
"m12_ugfx5",
"m12_wind",
"m12_windfx1",
"m12_windfx2",
"m13_ambience",
"m13_baseamb",
"m13_heligr1",
"m13_heligr2",
"m13_heliinside",
"m13_heliloop",
"m13_heliloop_cut",
"m13_wind",
"m14_amfx2",
"m14_amfx3",
"m14_beeps",
"m14_breathe1",
"m14_breathe3",
"m14_glassloop2",
"m14_glcrush1",
"m14_glcrush2",
"m14_glcrush3",
"m14_glcrush4",
"m14_glcrush5",
"m14_office2",
"m14_runloop",
"m14_runseq1",
"m14_sentrygun",
"m14_steam1",
"m14_steam2",
"m14_type",
"m14_ugfx1",
"m14_ugfx2",
"m14_ugfx3",
"m14_ugfx4",
"m14_ugfx5",
"m14_vent1",
"m14_vent1_cut",
"m14_vent2",
"m16_g_reload_1",
"m16_loop",
"m16_loop_e",
"m16_reload_1",
"m16_reload_2",
"m16_reload_3",
"m1_ambience",
"m203_launch_1",
"m2hb_loop",
"m2hb_loop_e",
"m2o_scream1",
"m2o_scream2",
"m2_ambience",
"m2_dooroc",
"m2_gravel",
"m2_stopnoise",
"m2_truckstop",
"m2_wind",
"m3o_cockpit",
"m3o_hangar",
"m3o_pl_behind",
"m3o_pl_by",
"m3o_pl_loop",
"m3o_pl_tax",
"m3o_voiceover",
"m3o_wind",
"m3_ambience",
"m3_beeps",
"m3_heliaway",
"m3_heliint",
"m3_heliover",
"m3_office1",
"m3_type",
"m3_wind",
"m4o_helioff",
"m4o_helioffs",
"m4o_run",
"m4_ambience",
"m4_beeps",
"m4_office1",
"m4_office2",
"m4_type",
"m5_ambience",
"m5_bird1",
"m5_wind",
"m6_ambience",
"m7_ambience",
"m7_baltochat",
"m7_helidown1",
"m7_helidown2",
"m7_heliinside",
"m7_heliloop",
"m7_helinoise",
"m7_helistart",
"m7_idle1",
"m7_idle2",
"m7_missileaway",
"m7_missileimp",
"m7_planeloop",
"m7_truckaway",
"m7_walksnow1",
"m7_walksnow2",
"m7_wind",
"m8_ambience",
"m8_drive",
"m8_idle1",
"m8_idle_backtruck",
"m9_ambience",
"m9_beeps",
"m9_office1",
"m9_type1",
"machinery_01",
"machinery_02",
"metal_01",
"metal_02",
"metal_03",
"mil_loop",
"minimi_loop",
"minimi_loop_e",
"minimi_reload_1",
"minimi_reload_2",
"missile_away_01",
"missile_imp_01",
"missile_loop_01",
"mp5sd_loop",
"mp5sd_loop_e",
"mp5_reload_5",
"outroexplo1",
"outroexplo1B",
"outroexplo2",
"outroexplo2B",
"outroexplo3",
"outroexplo3B",
"owl_01",
"owl_02",
"owl_03",
"picklock_loop",
"pickloop_end",
"plane_by_01",
"plane_by_02",
"plane_steady_01",
"player_death_1",
"player_fall_1",
"player_fall_2",
"player_fall_3",
"player_hit_1",
"player_hit_2",
"player_hit_3",
"player_hit_4",
"player_xplhit_1",
"proxy_arm",
"punched_01",
"punched_02",
"radardishsounds",
"radardome",
"radarwind_1",
"rain1_out",
"rain2_out",
"rain_1",
"rain_2",
"riccochet_1",
"riccochet_2",
"riccochet_3",
"riccochet_4",
"rpg_launch_1",
"stab_0",
"sentrygun_cut",
"sentrygun_cut2",
"spas12_bulins_1",
"spas12_bulins_2",
"spas12_bulins_3",
"spas12_bulins_4",
"spas12_reload_1",
"spas12_reload_2",
"spas12_shot_1",
"su27",
"svddrag_shot_1",
"switch",
"syringe",
"t80_sounds",
"tank_turret",
"tec_2",
"thunder_1",
"thunder_2",
"thunder_3",
"train_break_01",
"train_by_01",
"train_coll_01",
"train_explo_01",
"train_ext_01",
"train_horn_01",
"train_loop_1",
"train_loop_2",
"truck_away_01",
"truck_engine_cut",
"truck_idle_cut",
"truck_sounds",
"truck_start_cut",
"truck_stopg_01",
"turbine",
"typecomp_end",
"typecomp_loop",
"uzix2_loop",
"uzi_loop_e",
"uzi_reload_1",
"uzi_reload_2",
"uzi_reload_3",
"ventilation_01",
"ventilation_1",
"ventilation_2",
"Walk0",
"walk_gravel_1",
"walk_gravel_2",
"walk_gravel_3",
"walk_gravel_4",
"walk_gravel_5",
"walk_gravel_6",
"walk_ground_1",
"walk_ground_2",
"walk_ground_3",
"walk_ground_4",
"walk_ground_5",
"walk_ground_6",
"walk_ladder_1",
"walk_ladder_2",
"walk_ladder_3",
"walk_ladder_4",
"walk_metal_1",
"walk_metal_2",
"walk_metal_3",
"walk_metal_4",
"walk_metal_5",
"walk_metal_6",
"walk_snow_1",
"walk_snow_2",
"walk_snow_3",
"walk_snow_4",
"walk_wood_1",
"walk_wood_2",
"walk_wood_3",
"walk_wood_4",
"walk_wood_5",
"walk_wood_6",
"weapondrop_01",
"weapondrop_02",
"wind_1",
"wind_cold_1",
"wind_cold_fx_1",
"wind_cold_fx_2",
"wind_fx_01",
"wind_fx_01","walk_ground_3",
"wind_fx_02",
"wind_fx_02","truck_sounds",
"wire_slide_1",
"woodcrash_01",
"zoom_01",
"_cut08_01",
"_cut08_02",
"_cut10_01",
"_cut10_02",
"_cut10_03",
"_cut10_04",
"_cut10_05",
"_cut10_06",
"_cut10_07",
"_cut10_08",
"_cut10_10",
"_cut12_01",
"_cut12_02",
"_cut12_03",
"_cut12_05",

---

## IGI_AOB.txt

Game loaded : 25 73 2F 6F 62 6A 65 63 74 73 2E //Level Load Path
Player Loaded : 00 00 80 3F 3A CD 13 3F 00 00 00 00 AA 43 //Human FOV.
Player Loaded : 1E 00 00 00 24 BA B3 04 //Game Frames FPS
Game Running : 02 00 00 00 00 00 00 00 58 53 68 //Menu Manager
Game Paused : 00 00 00 00 ?? ?? ?? 00 7D 00 00 00 ?? 00 00 00 00 00 00 00 00 00 00 00 7C FE 9A 04 02 00 00 00 //QStrip For MenuManager.

---

## PATROLPATH.txt

PATROLPATH_ANIMATION = 0
PATROLPATH_DELAY = 1
PATROLPATH_WALKTO = 2
PATROLPATH_RUNTO = 3
PATROLPATH_CROUCH = 4
PATROLPATH_LOOKATNODE = 5
PATROLPATH_END = 6
PATROLPATH_QUIT = 7
PATROLPATH_SETSPEED = 8

---

## SFX_Table.md

| Name       | Children                                                                                                                        |
|------------|---------------------------------------------------------------------------------------------------------------------------------|
| Ambiance   | m1_ambience, m13_ambience, m14_ambience, m11_ambience, m2_ambience, m3_ambience, m4_ambience, m5_ambience, m6_ambience, m7_ambience, m8_ambience, m9_ambience |
| Animal     | bird_01, bird_02, bird_03, dog_01, dog_01_cut, dog_02, dog_02_cut                                                                  |
| Car        | car_01, car_1                                                                                                                   |
| Clothing   | bul_textile_1                                                                                                                   |
| Concrete   | bul_concrete_1, bul_concrete_2                                                                                                   |
| Dirt       | bul_dirt_1, bul_dirt_2                                                                                                           |
| Door       | door_close_1, door_move_1, door_open_1, door_slide_1                                                                              |
| Electricity | electricity_2                                                                                                                   |
| Flesh      | bul_flesh_1, bul_flesh_2, bul_flesh_3, bul_flesh_4, bul_flesh_5                                                                   |
| Glass      | bul_glass_1, bul_glass_2, bul_glass_3, bul_glass_4                                                                               |
| Gun        | ak47_SFX, colt_shot_1, glock_reload_1, glock_reload_2, glock_reload_3, glock_shot_1, glock_shot_2, jackh_loop, jackh_loop_e, jackh_reload_1, jackh_reload_2, jackh_reload_3, jackh_reload_4, m16_g_reload_1, m16_loop, m16_loop_e, m16_reload_1, m16_reload_2, m16_reload_3, m203_launch_1, m2hb_loop |
| Nature     | tree_01, tree_02, tree_03                                                                                                        |
| Person     | man_01, man_02, woman_01, woman_02                                                                                                |
| Plastic    | bul_plastic_1, bul_plastic_2, bul_plastic_3                                                                                      |
| Rock       | bul_rock_1, bul_rock_2, bul_rock_3                                                                                              |
| Wood       | bul_wood_1, bul_wood_2, bul_wood_3                                                                                              |

---

## TASKEVENTS.txt

AIEVENT_FRIENDLYDETECTION
AIEVENT_ENEMYDETECTION
AIEVENT_GUNSHOTMISS
AIEVENT_FLASHBANG
AIEVENT_GRENADELAND
AIEVENT_GRENADETHROWN
AIEVENT_GUNSHOT
AIEVENT_TAKINGDAMAGE
AIEVENT_LADDER
AIEVENT_ALARMOFF
AIEVENT_ALARMON
AIEVENT_COMBAT
AIEVENT_ALERT_RESPONSE
AIEVENT_ALERT
AIEVENT_IDLE
AIEVENT_ANIMATION
AIEVENT_DEAD
AIEVENT_DELETE
AIEVENT_CREATE

---

## TASKTYPE.txt

TASKTYPE_AFTERBURNER
TASKTYPE_AISTATIONARYGUN
TASKTYPE_ALARMLIGHT
TASKTYPE_ALARMLIGHTREFLECTOR
TASKTYPE_ANIMSOUND
TASKTYPE_BINOCULAR
TASKTYPE_BONEMAGICOBJ
TASKTYPE_BUILDING
TASKTYPE_CABARREL
TASKTYPE_CACLIP
TASKTYPE_CAR
TASKTYPE_CARDOOR
TASKTYPE_COCKPITSHIELD
TASKTYPE_CUTSCENE
TASKTYPE_DEATHZONE
TASKTYPE_DRAWER
TASKTYPE_EDITCAMERA
TASKTYPE_EDITORMAGICOBJ
TASKTYPE_EDITRIGIDOBJ
TASKTYPE_EXPLODEMAGICOBJ
TASKTYPE_FENCE
TASKTYPE_GEAR
TASKTYPE_GENERICPHYSICSMAGICOBJ
TASKTYPE_GENERICPHYSICSOBJ
TASKTYPE_GLASS
TASKTYPE_GRENADE
TASKTYPE_GUN
TASKTYPE_GUNCLIP
TASKTYPE_GUNDRAGUNOV
TASKTYPE_GUNFLAME
TASKTYPE_GUNM16A2
TASKTYPE_GUNMOVINGPART
TASKTYPE_GUNMP5SD
TASKTYPE_GUNSHOT
TASKTYPE_GUNSHOTEFFECT
TASKTYPE_GUNSPAS12
TASKTYPE_GUNX2
TASKTYPE_HATCH
TASKTYPE_HELI
TASKTYPE_HELIDOOR
TASKTYPE_HELIWHEEL
TASKTYPE_HITZONE
TASKTYPE_KNIFESTAB
TASKTYPE_LADDER
TASKTYPE_LEVELFLOW
TASKTYPE_LEVELTIMER
TASKTYPE_M203
TASKTYPE_MAGICOBJ
TASKTYPE_MEDIPACK
TASKTYPE_MINE
TASKTYPE_MISSILE
TASKTYPE_MOVERIGIDOBJ
TASKTYPE_NOISEQTASK
TASKTYPE_PHYSICSMAGICOBJ
TASKTYPE_PLANE
TASKTYPE_PROXIMITYMINE
TASKTYPE_RADARDISH
TASKTYPE_ROCKETPOD
TASKTYPE_ROTOR
TASKTYPE_RUDDER
TASKTYPE_SCAMERALENSVIEWCONE
TASKTYPE_SMOKE
TASKTYPE_SMOOTHQTASK
TASKTYPE_WHEEL

---

## WEAPONS_AMMO.cs

Dictionary<string, string> ammoList = new Dictionary<string, string>()
{
        {"SPAS12/JACKHAMMER","AMMO_ID_12"},
        {"COLT","AMMO_ID_357"},//AMMO_ID_44 Original slot fix.
        {"M2HB","AMMO_ID_127"},
        {"DESERTEAGLE","AMMO_ID_357"},
        {"M16A2/MINIMI/T80","AMMO_ID_556"},
        {"AK47","AMMO_ID_762"},
        {"GLOCK/UZI/UZIX2/MP5SD","AMMO_ID_919"},
        {"RPG18","AMMO_ID_1000"},
        {"DRAGUNOV","AMMO_ID_DRAGUNOV"},
        {"FLASHBANG","AMMO_ID_FLASHBANG"},
        {"GRENADE","AMMO_ID_GRENADE"},
        {"M203","AMMO_ID_M203"},
        {"MEDIPACK","AMMO_ID_MEDIPACK"},
        {"PROXIMITYMINE","AMMO_ID_PROXIMITYMINE"}
};

---

