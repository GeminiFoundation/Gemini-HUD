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

if upB == true and shield.getResistancesCooldown() == 0 then
   local resistance = shield.getResistances()
   local res = {0,resMAX,0,0}
   if resistance[1] ~= res[1] or
   resistance[2] ~= res[2] or
   resistance[3] ~= res[3] or
   resistance[4] ~= res[4] then
      if shield.setResistances(0,resMAX,0,0) == 1 then
         system.print("ELECTROMAGNETIC POWER 100%")
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
   local res = {resMAX/2,resMAX/2,0,0}
   if resistance[1] ~= res[1] or
   resistance[2] ~= res[2] or
   resistance[3] ~= res[3] or
   resistance[4] ~= res[4] then
      if shield.setResistances(resMAX/2,resMAX/2,0,0) == 1 then
         system.print("RAILGUN PROFILE 50/50%")
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