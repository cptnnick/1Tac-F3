// F3 - Buddy Team Colours
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
if (!hasInterface) exitWith {};

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (!isDedicated && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================

// DECLARE PRIVATE VARIABLES

private ["_unit","_isFireteam","_white","_red","_blue","_yellow","_green","_unitStr"];

// ====================================================================================

// SET CUSTOM VARIABLES
// These variables govern the behaviour of the script

// Colors will be set for groups of leaders with these suffixes
_leaders = ["_FTL"];

// Set suffixes for each color
_white = [];
_red = ["_AR","_AAR"];
_blue = ["_AT","_FTL"];
_yellow = [];
_green = [];
_isFireteam = false;

// ====================================================================================

// WAIT UNTIL 10 SECONDS AFTER INITIALIZING

uiSleep 5;

_unit = player;
if (isNull _unit) exitWith {};


// ====================================================================================

// CHECK GROUP SIZE
// If the group isn't a full fireteam, leave teams as default.

{
	if (((str (leader (group _unit))) find _x) != -1) exitWith {_isFireteam = true;}
} forEach _leaders;

if(!_isFireteam) exitWith {};

// SET TEAM COLOURS
{
	_unitStr = str _x;
    _unit = _x;
	{
        if ((_unitStr find _x) != -1) then {
			_unit assignTeam "RED";
		};
	} forEach _red;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "blue";
		};
	} forEach _blue;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "yellow";
		};
	} forEach _yellow;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "green";
		};
	} forEach _green;

	{
		if ((_unitStr find _x) != -1) then {
			_unit assignTeam "white";
		};
	} forEach _white;

} foreach units (group _unit);