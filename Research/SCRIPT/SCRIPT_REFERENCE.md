# SCRIPT - Complete Reference

Consolidated documentation for SCRIPT file format.

---

## Readme

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

## Igi Script Methods

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

