/*
Maintainer: Caleb Serafin
    Converts a road into a save position.
    The RoadAt the returned position may not return the same road.

Arguments:
    <OBJECT> road.

Return Value:
    <POS2D> DB position of road.

Scope: Any, Global Arguments
Environment: Any
Public: No

Example:
    private _road = nearestTerrainObjects [getPosWorld player,A3A_NG_const_roadTypeEnum,1000] #0;
    private _pos = _road call A3A_NG_convert_road_pos;
*/
params ["_road"];

private _pos = getPosWorld _road select A3A_NG_const_pos2DSelect;
if (isNull roadAt _pos) then {    // Now we go all out and try a bunch of values from an offset matrix.
    {
        private _newPos = _pos vectorAdd _x select A3A_NG_const_pos2DSelect;  // vectorAdd puts the z back
        if !(isNull roadAt _pos) exitWith { _pos = _newPos };
    } forEach A3A_NG_const_posOffsetMatrix;
};
_pos;
