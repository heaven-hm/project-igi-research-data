# SCRIPT Format - Consolidated Reference

Auto-generated consolidation of 6 research files.

---

## README.md

Welcome to the **Q Script** documentation for the **Project IGI** game. This documentation provides detailed information on the scripting methods used within the game's AI and event handling.

## Overview 🌟

*Project IGI* uses Game Script for its Propietary Game Engine (*JSF Game Engine*) that use **Q Script** that is a part of the game's AI system that dictates the behavior of in-game entities and events. **Q Script** is used for the Q System, which functions as a *Virtual Machine* (also known as **QVM**). This system is borrowed from the Quake game. While the mechanism works similarly, the opcodes and instructions in Q Script are different from those in Quake.

## Script Methods 🛠️
There are total *30* script methods known however there is no official documentation for this.

The Script methods are as follows.

- GetEventDistance
- GetGunnerID
- SetAlarmAccess
- SetAlarmViewLength
- SetDeathAnimation
- SetAlarmTriggerID
- IsEventBehind
- SetViewAlpha
- SetScriptRealValue
- GetAlarmTriggerDistance
- SetScriptIntegerValue
- SetGunnerID
- SetAlarmControlID
- GetAlarmTriggerID
- GetAlarmAccess
- SetEventPriority
- SetViewGamma
- GetScriptRealValue
- GetGunnerStatus
- GetAlarmControlStatus
- SetViewLength
- GetCurrentEventType
- SetInvulnerability
- SetInstantDeath
- GetRandomValue
- GetScriptIntegerValue
- GetAnimationToPlay
- SendResponse
- RemoveAlarmActions
- DefaultHandler

The script methods are categorized into different types based on their functionality:

### AI Functions 🔍
- **Getters**: Methods that retrieve values or states within the game's environment.
- **Setters**: Methods that set or modify values or states.

### Event Handling 🎛️
- Handling game events such as alarms, detections, and AI responses.

### Utility Functions ⚙️
- General-purpose functions used throughout the game scripts.

## Method Documentation 📖

Each method in the Q Script is documented with the following details:
- **Method Name**: The unique identifier for the method.
- **Parameter Values**: The constants and variables that the method accepts.
- **Signature**: The method's return type and parameter types.
- **Description**: A brief explanation of what the method does.

_Example_:
```markdown
Method: `AIFunction_GetCurrentEventType`
Parameter Values: `AIEVENT_ALARMON`, `AIEVENT_ENEMYDETECTION`, ...
Signature: `int AIFunction_GetCurrentEventType()`
Description: Retrieves the current event type being processed by the AI.
```

---

## igi_script_docs.cpp

//=========================================================
// IGI AI SCRIPT FUNCTIONS
// Parameter names are inferred from function names.
//=========================================================

//---------------------------------------------------------
// Default AI Processing
//---------------------------------------------------------

// Handles default AI behavior.
void AIFunction_DefaultHandler();

// Example
AIFunction_DefaultHandler();


//---------------------------------------------------------
// Alarm Functions
//---------------------------------------------------------

// Returns current alarm access level.
int AIFunction_GetAlarmAccess();

// Example
int accessLevel = AIFunction_GetAlarmAccess();


// Returns alarm control status.
int AIFunction_GetAlarmControlStatus();

// Example
int status = AIFunction_GetAlarmControlStatus();


// Returns alarm trigger distance.
int AIFunction_GetAlarmTriggerDistance();

// Example
int distance = AIFunction_GetAlarmTriggerDistance();


// Returns alarm trigger ID.
int AIFunction_GetAlarmTriggerID();

// Example
int triggerID = AIFunction_GetAlarmTriggerID();


// Sets alarm access level.
void AIFunction_SetAlarmAccess(int accessLevel);

// Example
AIFunction_SetAlarmAccess(AIALARMACCESS_BEFORECOMBAT);


// Sets alarm control object ID.
void AIFunction_SetAlarmControlID(int alarmControlID);

// Example
AIFunction_SetAlarmControlID(5);


// Sets alarm trigger object ID.
void AIFunction_SetAlarmTriggerID(int alarmTriggerID);

// Example
AIFunction_SetAlarmTriggerID(10);


// Sets alarm vision range.
void AIFunction_SetAlarmViewLength(int viewLength);

// Example
AIFunction_SetAlarmViewLength(5000);


// Removes alarm actions.
void AIFunction_RemoveAlarmActions();

// Example
AIFunction_RemoveAlarmActions();


//---------------------------------------------------------
// Event Functions
//---------------------------------------------------------

// Returns current event type.
int AIFunction_GetCurrentEventType();

// Example
if (AIFunction_GetCurrentEventType() == AIEVENT_COMBAT)
{
    AIFunction_SendResponse();
}


// Returns distance to current event.
int AIFunction_GetEventDistance();

// Example
int eventDistance = AIFunction_GetEventDistance();


// Checks if event is behind AI.
void AIFunction_IsEventBehind();

// Example
AIFunction_IsEventBehind();


// Sends response to current event.
void AIFunction_SendResponse();

// Example
AIFunction_SendResponse();


// Sets event priority.
void AIFunction_SetEventPriority(int eventType);

// Example
AIFunction_SetEventPriority(AIEVENT_ENEMYDETECTION);


//---------------------------------------------------------
// Gunner Functions
//---------------------------------------------------------

// Returns gunner ID.
int AIFunction_GetGunnerID();

// Example
int gunnerID = AIFunction_GetGunnerID();


// Returns gunner status.
int AIFunction_GetGunnerStatus();

// Example
int gunnerStatus = AIFunction_GetGunnerStatus();


// Sets gunner ID.
void AIFunction_SetGunnerID(int gunnerID);

// Example
AIFunction_SetGunnerID(3);


//---------------------------------------------------------
// Script Variables
//---------------------------------------------------------

// Returns script integer value.
int AIFunction_GetScriptIntegerValue(int index);

// Example
int value = AIFunction_GetScriptIntegerValue(0);


// Returns script float value.
float AIFunction_GetScriptRealValue(int index);

// Example
float value = AIFunction_GetScriptRealValue(0);


// Sets script integer value.
void AIFunction_SetScriptIntegerValue(int index, int value);

// Example
AIFunction_SetScriptIntegerValue(0, 100);


// Sets script float value.
void AIFunction_SetScriptRealValue(int index, float value);

// Example
AIFunction_SetScriptRealValue(0, 25.5f);


//---------------------------------------------------------
// AI Properties
//---------------------------------------------------------

// Sets death animation.
void AIFunction_SetDeathAnimation(int animationID);

// Example
AIFunction_SetDeathAnimation(2);


// Enables/disables instant death.
void AIFunction_SetInstantDeath(bool enabled);

// Example
AIFunction_SetInstantDeath(true);


// Enables/disables invulnerability.
void AIFunction_SetInvulnerability(bool enabled);

// Example
AIFunction_SetInvulnerability(true);


//---------------------------------------------------------
// Vision Functions
//---------------------------------------------------------

// Sets alpha view value.
void AIFunction_SetViewAlpha(int alpha);

// Example
AIFunction_SetViewAlpha(300);


// Sets gamma view value.
void AIFunction_SetViewGamma(int gamma);

// Example
AIFunction_SetViewGamma(500);


// Sets AI vision range.
void AIFunction_SetViewLength(int viewLength);

// Example
AIFunction_SetViewLength(6000);


//---------------------------------------------------------
// Miscellaneous
//---------------------------------------------------------

// Returns random float value.
// Meaning of parameter currently unknown.
float AIFunction_GetRandomValue(int value);

// Example
float randomValue = AIFunction_GetRandomValue(0);


// Gets animation chosen by AI.
void AIFunction_GetAnimationToPlay();

// Example
AIFunction_GetAnimationToPlay();


//---------------------------------------------------------
// Complete Example
//---------------------------------------------------------

if (AIFunction_GetCurrentEventType() == AIEVENT_CREATE)
{
    AIFunction_DefaultHandler();

    AIFunction_SetViewLength(6000);
    AIFunction_SetViewGamma(500);
    AIFunction_SetViewAlpha(300);

    AIFunction_SetInvulnerability(true);

    AIFunction_SetScriptIntegerValue(0, 1);
}
else
{
    AIFunction_DefaultHandler();
}

---

## igi_script_methods.csv

Method,Signature,Description,Parameter Values
DefaultHandler,void AIFunction_DefaultHandler(),Handles default AI behavior.,
GetAlarmAccess,int AIFunction_GetAlarmAccess(),Gets the access level for an alarm system.,
GetAlarmControlStatus,int AIFunction_GetAlarmControlStatus(),Gets the current status of the alarm control system.,
GetAlarmTriggerDistance,int AIFunction_GetAlarmTriggerDistance(),Gets the trigger distance for alarm activation.,
GetAlarmTriggerID,int AIFunction_GetAlarmTriggerID(),Gets the ID of the alarm trigger.,
GetCurrentEventType,int AIFunction_GetCurrentEventType(),Gets the current AI event type.,"AIEVENT_ENEMYDETECTION, AIEVENT_GRENADETHROWN, AIEVENT_ALERT, AIEVENT_DEAD, AIEVENT_GROUNDIMPACT, AIEVENT_FLASHBANG, AIEVENT_GRENADELAND, AIEVENT_DOOR, AIEVENT_FENCE, AIEVENT_EXPLOSION, AIEVENT_ALARMON, AIEVENT_ALARMOFF, AIEVENT_GUNSHOTMISS, AIEVENT_FRIENDLYDETECTION, AIEVENT_IDLE, AIEVENT_COMBAT, AIEVENT_CREATE, AIEVENT_ANIMATION, AIEVENT_LADDER, AIEVENT_WALK, AIEVENT_GUNSHOT, AIEVENT_TAKINGDAMAGE"
GetEventDistance,int AIFunction_GetEventDistance(),Gets the distance to the current AI event.,
GetGunnerID,int AIFunction_GetGunnerID(),Gets the ID of the AI gunner.,
GetGunnerStatus,int AIFunction_GetGunnerStatus(),Gets the status of the AI gunner.,
GetRandomValue,float AIFunction_GetRandomValue(int),Generates a random value based on the provided seed.,
GetScriptIntegerValue,int AIFunction_GetScriptIntegerValue(int),Gets an integer value from the AI script based on the provided index.,
GetScriptRealValue,float AIFunction_GetScriptRealValue(int),Gets a real (floating-point) value from the AI script based on the provided index.,
IsEventBehind,void AIFunction_IsEventBehind(),Checks if the current AI event is behind the AI character's perspective.,
RemoveAlarmActions,void AIFunction_RemoveAlarmActions(),Removes all actions associated with the alarm system.,
SendResponse,void AIFunction_SendResponse(),Sends a response to the current AI event.,
SetAlarmAccess,void AIFunction_SetAlarmAccess(int),Sets the access level for the alarm system.,"AIALARMACCESS_AFTERCOMBAT, AIALARMACCESS_BEFORECOMBAT"
SetAlarmControlID,void AIFunction_SetAlarmControlID(int),Sets the ID of the alarm control system.,
SetAlarmTriggerID,void AIFunction_SetAlarmTriggerID(int),Sets the ID of the alarm trigger.,
SetAlarmViewLength,void AIFunction_SetAlarmViewLength(int),Sets the view length for alarm activation.,
SetDeathAnimation,void AIFunction_SetDeathAnimation(int),Sets the death animation for the AI character.,
SetEventPriority,void AIFunction_SetEventPriority(int),Sets the priority for handling AI events.,"AIEVENT_ENEMYDETECTION, AIEVENT_IDLE, AIEVENT_COMBAT, AIEVENT_GRENADETHROWN, AIEVENT_ALERT, AIEVENT_ANIMATION, AIEVENT_CREATE, AIEVENT_DEAD, AIEVENT_GROUNDIMPACT, AIEVENT_FLASHBANG, AIEVENT_GRENADELAND, AIEVENT_DOOR, AIEVENT_FENCE, AIEVENT_GUNSHOT, AIEVENT_WALK, AIEVENT_EXPLOSION, AIEVENT_ALARMON, AIEVENT_ALARMOFF, AIEVENT_GUNSHOTMISS, AIEVENT_TAKINGDAMAGE"
SetGunnerID,void AIFunction_SetGunnerID(int),Sets the ID of the AI gunner.,
SetInstantDeath,void AIFunction_SetInstantDeath(bool),Enables or disables instant death behavior for the AI character.,
SetInvulnerability,void AIFunction_SetInvulnerability(bool),Makes the AI character invulnerable or vulnerable to damage.,
SetScriptIntegerValue,"void AIFunction_SetScriptIntegerValue(int,int)",Sets an integer value in the AI script based on the provided index.,
SetScriptRealValue,"void AIFunction_SetScriptRealValue(int,int)",Sets a real value in the AI script based on the provided index.,
SetViewAlpha,void AIFunction_SetViewAlpha(int),Sets the alpha value for the AI character's view.,
SetViewGamma,void AIFunction_SetViewGamma(int),Sets the gamma value for the AI character's view.,
SetViewLength,void AIFunction_SetViewLength(int),Sets the view length for the AI character.,
GetAnimationToPlay,void AIFunction_GetAnimationToPlay(),Gets the animation to play based on the current AI context.,

---

## igi_script_methods.json

[
  {
    "Method": "DefaultHandler",
    "Signature": "void AIFunction_DefaultHandler()",
    "Description": "Handles default AI behavior."
  },
  {
    "Method": "GetAlarmAccess",
    "Signature": "int AIFunction_GetAlarmAccess()",
    "Description": "Gets the access level for an alarm system."
  },
  {
    "Method": "GetAlarmControlStatus",
    "Signature": "int AIFunction_GetAlarmControlStatus()",
    "Description": "Gets the current status of the alarm control system."
  },
  {
    "Method": "GetAlarmTriggerDistance",
    "Signature": "int AIFunction_GetAlarmTriggerDistance()",
    "Description": "Gets the trigger distance for alarm activation."
  },
  {
    "Method": "GetAlarmTriggerID",
    "Signature": "int AIFunction_GetAlarmTriggerID()",
    "Description": "Gets the ID of the alarm trigger."
  },
  {
    "Method": "GetCurrentEventType",
    "Parameter Values": "AIEVENT_ENEMYDETECTION, AIEVENT_GRENADETHROWN, AIEVENT_ALERT, AIEVENT_DEAD, AIEVENT_GROUNDIMPACT, AIEVENT_FLASHBANG, AIEVENT_GRENADELAND, AIEVENT_DOOR, AIEVENT_FENCE, AIEVENT_EXPLOSION, AIEVENT_ALARMON, AIEVENT_ALARMOFF, AIEVENT_GUNSHOTMISS, AIEVENT_FRIENDLYDETECTION, AIEVENT_IDLE, AIEVENT_COMBAT, AIEVENT_CREATE, AIEVENT_ANIMATION, AIEVENT_LADDER, AIEVENT_WALK, AIEVENT_GUNSHOT, AIEVENT_TAKINGDAMAGE",
    "Signature": "int AIFunction_GetCurrentEventType()",
    "Description": "Gets the current AI event type."
  },
  {
    "Method": "GetEventDistance",
    "Signature": "int AIFunction_GetEventDistance()",
    "Description": "Gets the distance to the current AI event."
  },
  {
    "Method": "GetGunnerID",
    "Signature": "int AIFunction_GetGunnerID()",
    "Description": "Gets the ID of the AI gunner."
  },
  {
    "Method": "GetGunnerStatus",
    "Signature": "int AIFunction_GetGunnerStatus()",
    "Description": "Gets the status of the AI gunner."
  },
  {
    "Method": "GetRandomValue",
    "Signature": "float AIFunction_GetRandomValue(int)",
    "Description": "Generates a random value based on the provided seed."
  },
  {
    "Method": "GetScriptIntegerValue",
    "Signature": "int AIFunction_GetScriptIntegerValue(int)",
    "Description": "Gets an integer value from the AI script based on the provided index."
  },
  {
    "Method": "GetScriptRealValue",
    "Signature": "float AIFunction_GetScriptRealValue(int)",
    "Description": "Gets a real (floating-point) value from the AI script based on the provided index."
  },
  {
    "Method": "IsEventBehind",
    "Signature": "void AIFunction_IsEventBehind()",
    "Description": "Checks if the current AI event is behind the AI character's perspective."
  },
  {
    "Method": "RemoveAlarmActions",
    "Signature": "void AIFunction_RemoveAlarmActions()",
    "Description": "Removes all actions associated with the alarm system."
  },
  {
    "Method": "SendResponse",
    "Signature": "void AIFunction_SendResponse()",
    "Description": "Sends a response to the current AI event."
  },
  {
    "Method": "SetAlarmAccess",
    "Parameter Values": "AIALARMACCESS_AFTERCOMBAT, AIALARMACCESS_BEFORECOMBAT",
    "Signature": "void AIFunction_SetAlarmAccess(int)",
    "Description": "Sets the access level for the alarm system."
  },
  {
    "Method": "SetAlarmControlID",
    "Signature": "void AIFunction_SetAlarmControlID(int)",
    "Description": "Sets the ID of the alarm control system."
  },
  {
    "Method": "SetAlarmTriggerID",
    "Signature": "void AIFunction_SetAlarmTriggerID(int)",
    "Description": "Sets the ID of the alarm trigger."
  },
  {
    "Method": "SetAlarmViewLength",
    "Signature": "void AIFunction_SetAlarmViewLength(int)",
    "Description": "Sets the view length for alarm activation."
  },
  {
    "Method": "SetDeathAnimation",
    "Signature": "void AIFunction_SetDeathAnimation(int)",
    "Description": "Sets the death animation for the AI character."
  },
  {
    "Method": "SetEventPriority",
    "Parameter Values": "AIEVENT_ENEMYDETECTION, AIEVENT_IDLE, AIEVENT_COMBAT, AIEVENT_GRENADETHROWN, AIEVENT_ALERT, AIEVENT_ANIMATION, AIEVENT_CREATE, AIEVENT_DEAD, AIEVENT_GROUNDIMPACT, AIEVENT_FLASHBANG, AIEVENT_GRENADELAND, AIEVENT_DOOR, AIEVENT_FENCE, AIEVENT_GUNSHOT, AIEVENT_WALK, AIEVENT_EXPLOSION, AIEVENT_ALARMON, AIEVENT_ALARMOFF, AIEVENT_GUNSHOTMISS, AIEVENT_TAKINGDAMAGE",
    "Signature": "void AIFunction_SetEventPriority(int)",
    "Description": "Sets the priority for handling AI events."
  },
  {
    "Method": "SetGunnerID",
    "Signature": "void AIFunction_SetGunnerID(int)",
    "Description": "Sets the ID of the AI gunner."
  },
  {
    "Method": "SetInstantDeath",
    "Signature": "void AIFunction_SetInstantDeath(bool)",
    "Description": "Enables or disables instant death behavior for the AI character."
  },
  {
    "Method": "SetInvulnerability",
    "Signature": "void AIFunction_SetInvulnerability(bool)",
    "Description": "Makes the AI character invulnerable or vulnerable to damage."
  },
  {
    "Method": "SetScriptIntegerValue",
    "Signature": "void AIFunction_SetScriptIntegerValue(int,int)",
    "Description": "Sets an integer value in the AI script based on the provided index."
  },
  {
    "Method": "SetScriptRealValue",
    "Signature": "void AIFunction_SetScriptRealValue(int,int)",
    "Description": "Sets a real value in the AI script based on the provided index."
  },
  {
    "Method": "SetViewAlpha",
    "Signature": "void AIFunction_SetViewAlpha(int)",
    "Description": "Sets the alpha value for the AI character's view."
  },
  {
    "Method": "SetViewGamma",
    "Signature": "void AIFunction_SetViewGamma(int)",
    "Description": "Sets the gamma value for the AI character's view."
  },
  {
    "Method": "SetViewLength",
    "Signature": "void AIFunction_SetViewLength(int)",
    "Description": "Sets the view length for the AI character."
  },
  {
    "Method": "GetAnimationToPlay",
    "Signature": "void AIFunction_GetAnimationToPlay()",
    "Description": "Gets the animation to play based on the current AI context."
  }
]

---

## igi_script_methods.md

## Table of Methods

| Method                  | Signature                                      | Description                                                                        | Parameter Values                                                                                                                                                                                                                                                                                                                                                                                                  |
|:------------------------|:-----------------------------------------------|:-----------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DefaultHandler          | void AIFunction_DefaultHandler()               | Handles default AI behavior.                                                       | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetAlarmAccess          | int AIFunction_GetAlarmAccess()                | Gets the access level for an alarm system.                                         | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetAlarmControlStatus   | int AIFunction_GetAlarmControlStatus()         | Gets the current status of the alarm control system.                               | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetAlarmTriggerDistance | int AIFunction_GetAlarmTriggerDistance()       | Gets the trigger distance for alarm activation.                                    | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetAlarmTriggerID       | int AIFunction_GetAlarmTriggerID()             | Gets the ID of the alarm trigger.                                                  | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetCurrentEventType     | int AIFunction_GetCurrentEventType()           | Gets the current AI event type.                                                    | AIEVENT_ENEMYDETECTION, AIEVENT_GRENADETHROWN, AIEVENT_ALERT, AIEVENT_DEAD, AIEVENT_GROUNDIMPACT, AIEVENT_FLASHBANG, AIEVENT_GRENADELAND, AIEVENT_DOOR, AIEVENT_FENCE, AIEVENT_EXPLOSION, AIEVENT_ALARMON, AIEVENT_ALARMOFF, AIEVENT_GUNSHOTMISS, AIEVENT_FRIENDLYDETECTION, AIEVENT_IDLE, AIEVENT_COMBAT, AIEVENT_CREATE, AIEVENT_ANIMATION, AIEVENT_LADDER, AIEVENT_WALK, AIEVENT_GUNSHOT, AIEVENT_TAKINGDAMAGE |
| GetEventDistance        | int AIFunction_GetEventDistance()              | Gets the distance to the current AI event.                                         | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetGunnerID             | int AIFunction_GetGunnerID()                   | Gets the ID of the AI gunner.                                                      | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetGunnerStatus         | int AIFunction_GetGunnerStatus()               | Gets the status of the AI gunner.                                                  | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetRandomValue          | float AIFunction_GetRandomValue(int)           | Generates a random value based on the provided seed.                               | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetScriptIntegerValue   | int AIFunction_GetScriptIntegerValue(int)      | Gets an integer value from the AI script based on the provided index.              | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetScriptRealValue      | float AIFunction_GetScriptRealValue(int)       | Gets a real (floating-point) value from the AI script based on the provided index. | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| IsEventBehind           | void AIFunction_IsEventBehind()                | Checks if the current AI event is behind the AI character's perspective.           | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| RemoveAlarmActions      | void AIFunction_RemoveAlarmActions()           | Removes all actions associated with the alarm system.                              | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SendResponse            | void AIFunction_SendResponse()                 | Sends a response to the current AI event.                                          | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetAlarmAccess          | void AIFunction_SetAlarmAccess(int)            | Sets the access level for the alarm system.                                        | AIALARMACCESS_AFTERCOMBAT, AIALARMACCESS_BEFORECOMBAT                                                                                                                                                                                                                                                                                                                                                             |
| SetAlarmControlID       | void AIFunction_SetAlarmControlID(int)         | Sets the ID of the alarm control system.                                           | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetAlarmTriggerID       | void AIFunction_SetAlarmTriggerID(int)         | Sets the ID of the alarm trigger.                                                  | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetAlarmViewLength      | void AIFunction_SetAlarmViewLength(int)        | Sets the view length for alarm activation.                                         | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetDeathAnimation       | void AIFunction_SetDeathAnimation(int)         | Sets the death animation for the AI character.                                     | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetEventPriority        | void AIFunction_SetEventPriority(int)          | Sets the priority for handling AI events.                                          | AIEVENT_ENEMYDETECTION, AIEVENT_IDLE, AIEVENT_COMBAT, AIEVENT_GRENADETHROWN, AIEVENT_ALERT, AIEVENT_ANIMATION, AIEVENT_CREATE, AIEVENT_DEAD, AIEVENT_GROUNDIMPACT, AIEVENT_FLASHBANG, AIEVENT_GRENADELAND, AIEVENT_DOOR, AIEVENT_FENCE, AIEVENT_GUNSHOT, AIEVENT_WALK, AIEVENT_EXPLOSION, AIEVENT_ALARMON, AIEVENT_ALARMOFF, AIEVENT_GUNSHOTMISS, AIEVENT_TAKINGDAMAGE                                            |
| SetGunnerID             | void AIFunction_SetGunnerID(int)               | Sets the ID of the AI gunner.                                                      | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetInstantDeath         | void AIFunction_SetInstantDeath(bool)          | Enables or disables instant death behavior for the AI character.                   | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetInvulnerability      | void AIFunction_SetInvulnerability(bool)       | Makes the AI character invulnerable or vulnerable to damage.                       | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetScriptIntegerValue   | void AIFunction_SetScriptIntegerValue(int,int) | Sets an integer value in the AI script based on the provided index.                | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetScriptRealValue      | void AIFunction_SetScriptRealValue(int,int)    | Sets a real value in the AI script based on the provided index.                    | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetViewAlpha            | void AIFunction_SetViewAlpha(int)              | Sets the alpha value for the AI character's view.                                  | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetViewGamma            | void AIFunction_SetViewGamma(int)              | Sets the gamma value for the AI character's view.                                  | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| SetViewLength           | void AIFunction_SetViewLength(int)             | Sets the view length for the AI character.                                         | nan                                                                                                                                                                                                                                                                                                                                                                                                               |
| GetAnimationToPlay      | void AIFunction_GetAnimationToPlay()           | Gets the animation to play based on the current AI context.                        | nan                                                                                                                                                                                                                                                                                                                                                                                                               |

---

## igi_script_methos.txt

AIFunction_GetEventDistance
AIFunction_GetGunnerID
AIFunction_SetAlarmAccess
AIFunction_SetAlarmViewLength
AIFunction_SetDeathAnimation
AIFunction_SetAlarmTriggerID
AIFunction_IsEventBehind
AIFunction_SetViewAlpha
AIFunction_SetScriptRealValue
AIFunction_GetAlarmTriggerDistance
AIFunction_SetScriptIntegerValue
AIFunction_SetGunnerID
AIFunction_SetAlarmControlID
AIFunction_GetAlarmTriggerID
AIFunction_GetAlarmAccess
AIFunction_SetEventPriority
AIFunction_SetViewGamma
AIFunction_GetScriptRealValue
AIFunction_GetGunnerStatus
AIFunction_GetAlarmControlStatus
AIFunction_SetViewLength
AIFunction_GetCurrentEventType
AIFunction_SetInvulnerability
AIFunction_SetInstantDeath
AIFunction_GetRandomValue
AIFunction_GetScriptIntegerValue
AIFunction_GetAnimationToPlay
AIFunction_SendResponse
AIFunction_RemoveAlarmActions
AIFunction_DefaultHandler

---

