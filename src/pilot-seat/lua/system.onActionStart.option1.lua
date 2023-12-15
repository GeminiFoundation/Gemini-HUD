if shift == false and upB == false and downB == false then DisplayRadar = not DisplayRadar end

if upB == true and shield.getResistancesCooldown() == 0 then
    local resistance = shield.getResistances()
    local res = {resMAX,0,0,0}
    if resistance[1] ~= res[1] or
    resistance[2] ~= res[2] or
    resistance[3] ~= res[3] or
    resistance[4] ~= res[4] then
       if shield.setResistances(resMAX,0,0,0) == 1 then
          system.print("ANTIMATTER POWER 100%")
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
   local res = {0,0,resMAX/2,resMAX/2}
   if resistance[1] ~= res[1] or
   resistance[2] ~= res[2] or
   resistance[3] ~= res[3] or
   resistance[4] ~= res[4] then
      if shield.setResistances(0,0,resMAX/2,resMAX/2) == 1 then
         system.print("CANNON PROFILE 50/50%")
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

if shift == true then
   local id = activeRadar.getTargetId()
   if id ~= 0 then
      local keys = databank_2.getNbKeys()
      if whitelist[id] == true then
 
         for i = 1, #GHUD_friendly_IDs do
            if GHUD_friendly_IDs[i] == id then table.remove(GHUD_friendly_IDs,i) databank_2.clearValue(i) end
         end
         system.print(id..' ID has been removed from the whitelist databank')
      else
         local dbKey = keys + 1
         databank_2.setIntValue(dbKey,id)
         table.insert(GHUD_friendly_IDs,id)
         system.print(id..' ID has been added to the whitelist databank')
      end
      newWhitelist = checkWhitelist()
      whitelist = newWhitelist
   end
 end