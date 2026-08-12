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
