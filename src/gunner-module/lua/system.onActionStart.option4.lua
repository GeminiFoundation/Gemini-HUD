if upB == false and downB == false then
    local DepartureWaypoint = "::pos{0,0," ..math.floor(DepartureCenter.x)..","..math.floor(DepartureCenter.y)..","..math.floor(DepartureCenter.z).."}"
    if shift==true then
       system.print(DepartureCenterName)
       system.setWaypoint(DepartureWaypoint)
    else
       system.print(stellarObjects[sortestPipeKey2Id].name[1])
       system.setWaypoint("::pos{0,0," ..math.floor(stellarObjects[sortestPipeKey2Id].center[1]).. "," ..math.floor(stellarObjects[sortestPipeKey2Id].center[2]).. "," ..math.floor(stellarObjects[sortestPipeKey2Id].center[3]).. "}")
    end
end
if gearB == true then mmode = not mmode end