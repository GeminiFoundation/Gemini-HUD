if upB == false and downB == false then
local DestWaypoint = "::pos{0,0," ..math.floor(DestinationCenter.x)..","..math.floor(DestinationCenter.y)..","..math.floor(DestinationCenter.z).."}"
if shift==true then
   system.print(DestinationCenterName)
   system.setWaypoint(DestWaypoint)
else
   system.print(stellarObjects[sortestPipeKeyId].name[1])
   system.setWaypoint("::pos{0,0," ..math.floor(stellarObjects[sortestPipeKeyId].center[1]).. "," ..math.floor(stellarObjects[sortestPipeKeyId].center[2]).. "," ..math.floor(stellarObjects[sortestPipeKeyId].center[3]).. "}")
end
end