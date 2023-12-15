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

if upB == true and shield.getResistancesCooldown() == 0 then
   local resistance = shield.getResistances()
   local res = {0,0,0,resMAX}
   if resistance[1] ~= res[1] or
   resistance[2] ~= res[2] or
   resistance[3] ~= res[3] or
   resistance[4] ~= res[4] then
      if shield.setResistances(0,0,0,resMAX) == 1 then
         system.print("THERMIC POWER 100%")
         actionRes(res)
         system.playSound('shieldNewResists.mp3')
      else
         system.print("ERR6")
         system.playSound('shieldResistError.mp3')
      end
   else
      system.print("ERR7")
      system.playSound('shieldResistError.mp3')
   end
end

if downB == true and shield.getResistancesCooldown() == 0 then
   local resistance = shield.getResistances()
   local res = {0,resMAX/2,0,resMAX/2}
   if resistance[1] ~= res[1] or
   resistance[2] ~= res[2] or
   resistance[3] ~= res[3] or
   resistance[4] ~= res[4] then
      if shield.setResistances(0,resMAX/2,0,resMAX/2) == 1 then
         system.print("LASER PROFILE 50/50%")
         actionRes(res)
         system.playSound('shieldNewResists.mp3')
      else
         system.print("ERR6")
         system.playSound('shieldResistError.mp3')
      end
   else
      system.print("ERR7")
      system.playSound('shieldResistError.mp3')
   end
end