local count = #string.gsub(text, "[^f]", "")
local f1 = string.sub(text,1,1)
if count == 1 and f1 == "f" then
   mRadar:onTextInput(text)
end

if text == "export" then GEAR(unit,system,text) end

if text == "clear" then
   databank_2.clear()
   GHUD_friendly_IDs = {}
   newWhitelist = checkWhitelist()
   whitelist = newWhitelist
   system.print('Databank whitelist cleared')
end

if text == "addall" then
   local keys = databank_2.getNbKeys()
   local keyCount = keys
for k,v in pairs(radarIDs) do
    keyCount = keyCount + 1
    databank_2.setIntValue(keyCount,v)
    table.insert(GHUD_friendly_IDs,v)
 end
 newWhitelist = checkWhitelist()
 whitelist = newWhitelist
 system.print('All targets have been added to the whitelist')
end

if text == "friends" then
if GHUD_show_AR_allies_marks == true then
   GHUD_show_AR_allies_marks = false
   system.print('AR allies marks deactivated')
else
   GHUD_show_AR_allies_marks = true
   system.print('AR allies marks activated')
end
end

if text == "safe" then
   if GHUD_safeNotifications == true then
      GHUD_safeNotifications = false
      system.print('Radar safe zone notifications OFF')
   else
      GHUD_safeNotifications = true
      system.print('Radar safe zone notifications ON')
   end
end

   if string.find (text,'m::pos') then
      asteroidPOS = text:sub(2)
      system.print(asteroidPOS)
      system.print('Calculation...')
      asteroidcoord = zeroConvertToWorldCoordinates(asteroidPOS)
      databank_1.setStringValue(15,asteroidPOS)
      corTime = system.getArkTime() 
      ck = coroutine.create(closestPipe1)
      corpos = true
   end   

inTEXT(unit,system,text)