if upB == false and downB == false then
if shift==true then
   local function getPipeDistance()
      local worldPos = vec3(construct.getWorldPosition())
      local pipe = (DestinationCenter - DepartureCenter):normalize()
      local r = (worldPos -DepartureCenter):dot(pipe) / pipe:dot(pipe)
      if r <= 0. then
         return (worldPos-DepartureCenter):len()
      elseif r >= (DestinationCenter - DepartureCenter):len() then
         return (worldPos-DestinationCenter):len()
      end
      local L = DepartureCenter + (r * pipe)
      local PipeWaypoint = "::pos{0,0," ..math.floor(L.x).. "," ..math.floor(L.y).. "," ..math.floor(L.z).. "}"
      return PipeWaypoint
   end
   system.print("Pipe center: " ..DepartureCenterName.. " - " ..DestinationCenterName)
   system.setWaypoint(getPipeDistance())
else
   local function getPipeDistance()
      local DestinationCenter = vec3(stellarObjects[sortestPipeKeyId].center)
      local DepartureCenter = vec3(stellarObjects[sortestPipeKey2Id].center)
      local worldPos = vec3(construct.getWorldPosition())
      local pipe = (DestinationCenter - DepartureCenter):normalize()
      local r = (worldPos -DepartureCenter):dot(pipe) / pipe:dot(pipe)
      if r <= 0. then
         return (worldPos-DepartureCenter):len()
      elseif r >= (DestinationCenter - DepartureCenter):len() then
         return (worldPos-DestinationCenter):len()
      end
      local L = DepartureCenter + (r * pipe)
      local PipeWaypoint = "::pos{0,0," ..math.floor(L.x).. "," ..math.floor(L.y).. "," ..math.floor(L.z).. "}"
      return PipeWaypoint
   end
   local clpipeMSG = "Pipe center: "..stellarObjects[sortestPipeKeyId].name[1].. " - " .. stellarObjects[sortestPipeKey2Id].name[1]
   system.print(clpipeMSG)
   system.setWaypoint(getPipeDistance())
end
end