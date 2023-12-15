if shift == false and upB == false and downB == false then DisplayRadar = not DisplayRadar end

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