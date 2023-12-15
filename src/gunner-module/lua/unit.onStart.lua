-- GEMINI FOUNDATION

--Gunner module
HUD_version = '1.4.9'

--LUA parameters
GHUD_marker_name = 'Asteroid' --export: Helios map marker name
GHUD_marker_color = '#c603fc' --export:
GHUD_departure_planet = 'Alioth' --export: Departure name planet
GHUD_destination_planet = 'Jago' --export: Destination name planet
GHUD_radarWidget_on_top = false --export: Radar widget position
GHUD_weapon_panels = 3 --export: Set 3 or 2
GHUD_selected_target_panel_size = 50 --export:
GHUD_selected_target_Y = 71.8 --export:
GHUD_hit_chance_2_weapons = false --export: Show 2 hit chance panels
GHUD_1_chance_weapon_slot = 1 --export: weapon_1 = 1
GHUD_2_chance_weapon_slot = 2 --export: weapon_2 = 2
GHUD_export_mode = false --export: Target Vector export mode
targetSpeed = 29999 --export: Target Vector speed
GHUD_background_color = "#142027" --export: Background HUD color
GHUD_flight_indicator_size = 25 --export:
GHUD_flight_indicator_color = 'rgb(198, 3, 252)' --export:
GHUD_pipe_text_color = '#FFFFFF' --export:
GHUD_pipe_Y = 0 --export:
GHUD_pipe_X = 22 --export:
GHUD_AR_sight_size = 50 --export: AR sight size
GHUD_AR_sight_color = "rgba(0, 191, 255, 0.7)" --export: AR sight color
GHUD_radar_notifications_border_radius = true --export:
GHUD_radar_notifications_border_color = 'black' --export:
GHUD_radar_notifications_background_color = 'rgb(255, 177, 44)' --export:
GHUD_radar_notifications_Y = 10 --export:
GHUD_print_hits = true --export: LUA chat hits
GHUD_show_hits = true --export: Show hits animations
GHUD_show_misses = true --export: Show misses animations
GHUD_hits_misses_Y = 46 --export:
GHUD_hit_X = 56.5 --export:
GHUD_miss_X = 47.5 --export:
GHUD_allies_count = 5 --export: Max count of displayed allies. Selected ally will always be displayed
GHUD_allies_color = "rgb(0, 191, 255)" --export:
GHUD_allied_names_color = "rgb(0, 191, 255)" --export:
GHUD_show_AR_allies_marks = true --export:
GHUD_AR_allies_border_size = 400 --export:
GHUD_AR_allies_border_color = "#0cf27b" --export:
GHUD_AR_allies_font_color = "#0cf27b" --export:
GHUD_targets_color = "#fc033d" --export:
GHUD_safeNotifications = false --export: on/off radar notifications in safe zone
GHUD_selected_border_color = "rgb(0, 191, 255)" --export:
GHUD_target_names_color = "#fc033d" --export:
GHUD_allies_distance_color = "rgb(0, 191, 255)" --export:
GHUD_distance_color = "rgb(0, 191, 255)" --export:
GHUD_speed_color = "rgb(0, 191, 255)" --export:
GHUD_count_color = "rgb(0, 191, 255)" --export:
GHUD_your_ship_ID_color = "#fca503" --export:
GHUD_border_color = "black" --export:
GHUD_allies_Y = 0 --export: set to 0 if playing in fullscreen mode
GHUD_windowed_mode = false --export: adds 2 to height GHUD_allies_Y
collectgarbages = false --export: experimental
--GHUD_radar_notifications_mac_os_style = false

wslot_1 = nil
wslot_2 = nil
if weapon_1 ~= nil then
   for i = 1, weapon_size do
      if i == GHUD_1_chance_weapon_slot then
         GHUD_1_chance_weapon_slot = weapon[i].getName()
         wslot_1 = weapon[i]
      end
      if i == GHUD_2_chance_weapon_slot then
         GHUD_2_chance_weapon_slot = weapon[i].getName()
         wslot_2 = weapon[i]
      end
   end
end

if wslot_1 ~= nil and GHUD_hit_chance_2_weapons == false then
   GHUD_selected_target_Y = GHUD_selected_target_Y + 3.7
end

if GHUD_radar_notifications_border_radius == true then
   GHUD_border_radius = '15px'
else
   GHUD_border_radius = 'none'
end

GHUD_allies_count1 = GHUD_allies_count + 1

if GHUD_windowed_mode then
   GHUD_allies_Y = 2
end

GHUD_show_echoes = false

if GHUD_show_echoes == true then
   statusY = 13.5
else
   statusY = 6
end

--vars
atlas = require("atlas")
clamp = utils.clamp
stellarObjects = atlas[0]
safeWorldPos = vec3({13771471,7435803,-128971})
activeRadar = radar_1
activeRadar.setSortMethod(1)
shift = false
lalt = false
radarIDs = {}
idN = 0
GHUD_show_allies = true
screenHeight = system.getScreenHeight()
screenWidth = system.getScreenWidth()
startTime = system.getArkTime()
lastHitTime = {}
lastMissTime = {}
hits = {}
misses = {}
hitAnimations = 0
missAnimations = 0
totalDamage = {}
mRadar = {}
mWeapons = {}
size = {'XL','L','M','S','XS','ALL'}
defaultSize = 'ALL'
sizeState = 6
focus = ''
gunnerHUD = ''
vectorHUD = ''
distS = ''
safetext=''
szsafe=true
planetzone = ''
downB = false
upB = false
atmovar = false
xDelta = -238
yDelta = -108
mapScale = .99999
planetScale = 1200
aliothsize = 8000
moonScale = 3000
map = 0
warpScan = 0
targetList = ''
leftB = false
rightB = false
safew=''
endload = 0
znak = ''
newcolor = "white"
znak2 = ''
newcolor2 = "white"
speedT = 0
lastspeed = 0
distT = 0
lastdist = 0
pr1 = 0
pr2 = 0
playerName = system.getPlayerName(player.getId())
warpScan = 0 --for 3D map
t_radarEnter = {}
lastAmmo = {}
loglist = {}
radarTarget = nil
newWhitelist = {}
radarStatic = {}
radarDynamic = {}
radarStaticWidget = {}
radarStaticData = {}
radarDynamicWidget = {}
radarDynamicData = {}
radarWidget = ''
targets = {}
target = {}
count = 0
gearB = false
helper = false
helper1 = false
friendsData = {}
pp1 = ''
shipName = construct.getName()
local scID = construct.getId()
system.print(''..shipName..': '..scID..'')
conID = tostring(scID):sub(-3)

GHUD_friendly_IDs = {}

local dbkeys = databank_2.getNbKeys()

if dbkeys > 0 then
   for i = 1, dbkeys do
      table.insert(GHUD_friendly_IDs,databank_2.getIntValue(i))
   end
   system.print('Databank whitelist loaded')
end

function checkWhitelist()
   local whitelist = GHUD_friendly_IDs
   local set = {}
   for _, l in ipairs(whitelist) do set[l] = true end
   return set
end

function table.contains(table, element)
   for _, value in pairs(table) do
      if value == element then
         return true
      end
   end
   return false
end

whitelist = checkWhitelist() --load IDs
local pauseAfter = 100 --radar widget coroutine

radarWidgetScale = 2
radarWidgetScaleDisplay = '<div class="measures"><span>0 SU</span><span>1 SU</span><span>2 SU</span></div>'

--radar widget
function defaultRadar()
   sizeState = 6
   defaultSize = 'ALL'
   if mRadar.friendlyMode == true then mRadar.friendlyMode = false end
end

function mRadar:createWidget()
   self.dataID = self.system.createData(activeRadar.getWidgetData())
   radarPanel = self.system.createWidgetPanel('')
   radarWidget = self.system.createWidget(radarPanel, activeRadar.getWidgetType())
   self.system.addDataToWidget(self.dataID, radarWidget)
end

function mRadar:createWidgetNew()
   self.dataID = self.system.createData(activeRadar.getWidgetData())
   radarWidget = self.system.createWidget(radarPanel, activeRadar.getWidgetType())
   self.system.addDataToWidget(self.dataID, radarWidget)
end

function mRadar:deleteWidget()
   self.system.destroyData(self.dataID)
   self.system.destroyWidget(radarWidget)
end

function mRadar:updateLoop()
   while true do
      self:updateStep()
      coroutine.yield()
   end
end

function mRadar:updateStep()
   local resultList = {}
   local data = activeRadar.getWidgetData()
   local constructList = data:gmatch('({"constructId":".-%b{}.-})')
   local isIDFiltered = next(self.idFilter) ~= nil
   local i = 0
   for str in constructList do
      i = i + 1
      if i%pauseAfter==0 then
         coroutine.yield()
      end
      local ID = tonumber(str:match('"constructId":"([%d]*)"'))
      local size = activeRadar.getConstructCoreSize(ID)
      local locked = activeRadar.isConstructIdentified(ID)
      local alive = activeRadar.isConstructAbandoned(ID)
      local selectedTarget = activeRadar.getTargetId(ID)
      if locked == 1 or alive == 0 or selectedTarget == ID and size ~= "" then --show only locked or alive or selected targets
         if defaultSize == 'ALL' then --default mode
            if ((whitelist[ID]==true or activeRadar.hasMatchingTransponder(ID)==1) ~= self.friendlyMode) and activeRadar.getThreatRateFrom(ID) <= 2 then  --show attacking traitor on widget
               goto continue1
            end
            if isIDFiltered and self.idFilter[ID%1000] ~= true then
               goto continue1
            end
            resultList[#resultList+1] = str:gsub('"name":"(.+)"', '"name":"' .. tostring(ID):sub(-3) .. ' - %1"')
            ::continue1::
         elseif size == defaultSize then
            if ((whitelist[ID]==true or activeRadar.hasMatchingTransponder(ID)==1) ~= self.friendlyMode) and activeRadar.getThreatRateFrom(ID) <= 2 then
               goto continue2
            end
            if isIDFiltered and self.idFilter[ID%1000] ~= true then
               goto continue2
            end
            resultList[#resultList+1] = str:gsub('"name":"(.+)"', '"name":"' .. tostring(ID):sub(-3) .. ' - %1"')
            ::continue2::
         end
      end
   end
   local filterMsg = (isIDFiltered and ''..focus..' - FOCUS - ' or '') .. (self.friendlyMode and ''..defaultSize..' - Friends' or ''..defaultSize..' - Enemies')
   --local postData = data:match('"elementId":".+') --deprecated
   local postData = data:match('"currentTargetId":".+')
   postData = postData:gsub('"errorMessage":""', '"errorMessage":"' .. filterMsg .. '"') --filter data
   data = '{"constructsList":[' .. table.concat(resultList, ",") .. "]," .. postData --completed json radar data
   self.system.updateData(self.dataID, data)
end

function mRadar:onUpdate()
   coroutine.resume(self.updaterCoroutine)
end

function mRadar:clearIDFilter()
   self.idFilter = {}
end

function mRadar:addIDFilter(id)
   self.idFilter[id] = true
end

--pvp focus mode
function mRadar:onTextInput(text)
   self:clearIDFilter()
   focus = text:sub(-3)
   defaultRadar()
   if focus == 'f' then
      system.print('Focus mode deactivated')
   else
      system.print('Focus ID: '..focus)
   end
   for id in text:gmatch('%D(%d%d%d)') do
      self:addIDFilter(tonumber(id))
   end
end

function mRadar:toggleFriendlyMode()
   self.friendlyMode = not self.friendlyMode
end

function mRadar:new(sys)
   local mRadar = {}
   setmetatable(mRadar, self)
   self.system = sys
   self.friendlyMode = false
   self.onlyIdentified = false
   self.idFilter = {}
   self:createWidget()
   --self.dataID = self.system.createData(activeRadar.getWidgetData())
   --self.radarPanel = self.system.createWidgetPanel('')
   --self.radarWidget = self.system.createWidget(self.radarPanel, activeRadar.getWidgetType())
   --self.system.addDataToWidget(self.dataID, self.radarWidget)
   self.updaterCoroutine = coroutine.create(function() self:updateLoop() end)
   return self
end

--weapon widgets
local oldAnimationTime = {}
local oldWeaponStatus = {}
local oldFireReady = {}
local OldoutOfZone = {}
local oldTargetConstruct = {}
local oldHitProbability = {}

function mWeapons:createWidgets()
   if not (type(self.weapons) == 'table' and #self.weapons > 0) then
      return
   end
   local widgetPanelID
   for i, weap in ipairs(self.weapons) do
      if (i-1) % self.weaponsPerPanel == 0 then
         widgetPanelID = self.system.createWidgetPanel('')
      end
      local weaponDataID = self.system.createData(weap.getWidgetData())
      self.weaponData[weaponDataID] = weap
      oldAnimationTime[weaponDataID] = 0
      self.system.addDataToWidget(weaponDataID, self.system.createWidget(widgetPanelID, weap.getWidgetType()))
   end
end

function mWeapons:onUpdate()
   for weaponDataID, weap in pairs(self.weaponData) do
      local weaponData = weap.getWidgetData()
      local weaponStatus = weaponData:match('"weaponStatus":(%d+)')
      local animationTime = tonumber(weaponData:match('"cycleAnimationRemainingTime":(.-),'))
      local fireReady = weaponData:match('"fireReady":(.-),')
      local outOfZone = weaponData:match('"outOfZone":(.-),')
      local targetConstructID = weaponData:match('"constructId":"(.-)"')
      local hitProbability = weaponData:match('"hitProbability":(.-),')
      local hitP = math.floor(tonumber(hitProbability) * 100)
      local animationChanged = animationTime > oldAnimationTime[weaponDataID]
      oldAnimationTime[weaponDataID] = animationTime

      if weaponStatus == oldWeaponStatus[weaponDataID] and oldTargetConstruct[weaponDataID] == targetConstructID and oldFireReady[weaponDataID] == fireReady and OldoutOfZone[weaponDataID] == outOfZone and oldHitProbability[weaponDataID] == hitProbability and not animationChanged then
         goto continue
      end
      oldWeaponStatus[weaponDataID] = weaponStatus
      oldFireReady[weaponDataID] = fireReady
      OldoutOfZone[weaponDataID] = outOfZone
      oldTargetConstruct[weaponDataID] = targetConstructID
      oldHitProbability[weaponDataID] = hitProbability

      local ammoName = weaponData:match('"ammoName":"(.-)"')
      local stasisStatus = false
      local ammoType1 = ""
      if ammoName:match("Antimatter") then
         ammoType1 = "AM"
      elseif ammoName:match("Electromagnetic") then
         ammoType1 = "EM"
      elseif ammoName:match("Kinetic") then
         ammoType1 = "KI"
      elseif ammoName:match("Thermic") then
         ammoType1 = "TH"
      elseif ammoName:match("Stasis") then
         ammoType1 = "Stasis"
      end

      local ammoType2 = ""
      if ammoName:match("Precision") then
         ammoType2 = "Precision"
      elseif ammoName:match("Heavy") then
         ammoType2 = "Heavy"
      elseif ammoName:match("Agile") then
         ammoType2 = "Agile"
      elseif ammoName:match("Defense") then
         ammoType2 = "Def"
      end

      if string.find(weaponData,'Stasis') then
         weaponData = weaponData:gsub('"helperId":"(.-)","name":"(.-)"', '"helperId":"%1","name":"%2 - ' .. hitP .. '%%"')
      else
         local maxDist = tonumber(weaponData:match('"maxDistance":(.-),'))
         local optDist = tonumber(weaponData:match('"optimalDistance":(.-),'))
         if maxDist >= 100000 then
            maxDist = string.format('%0.2f', maxDist/200000)..'SU'
         else
            maxDist = string.format('%0.1f', maxDist/1000)..'KM'
         end

         if optDist >= 100000 then
            optDist = string.format('%0.2f', optDist/200000)..'SU'
         else
            optDist = string.format('%0.1f', optDist/1000)..'KM'
         end
         weaponData = weaponData:gsub('"helperId":"(.-)","name":"(.-)"', '"helperId":"%1","name":"%2 '..optDist..' - '..maxDist..' - ' .. hitP .. '%%"')
      end
      weaponData = weaponData:gsub('"constructId":"(%d+(%d%d%d))","name":"(.-)"', '"constructId":"%1","name":"%2 - %3"')
      weaponData = weaponData:gsub('"ammoName":"(.-)"', '"ammoName":"' .. ammoType1 .. ' ' .. ammoType2 .. '"')

      if self.system.updateData(weaponDataID, weaponData) ~= 1 then
         self.system.print('update error')
      end

      ::continue::
   end
end

function mWeapons:new(sys, weapons, weaponsPerPanel)
   local mWeapons = {}
   setmetatable(mWeapons, self)
   self.system = sys
   self.weapons = weapons
   self.weaponsPerPanel = weaponsPerPanel or 3
   self.weaponData = {}
   self:createWidgets()
   return self
end

--debug coroutine
function coroutine.xpcall(co)
   local output = {coroutine.resume(co)}
   if output[1] == false then
      local tb = traceback(co)

      local message = tb:gsub('"%-%- |STDERROR%-EVENTHANDLER[^"]*"', 'chunk')
      system.print(message)

      message = output[2]:gsub('"%-%- |STDERROR%-EVENTHANDLER[^"]*"', 'chunk')
      system.print(message)
      return false, output[2], tb
   end
   return table.unpack(output)
end

function hitFnc(slotname,dmg,targetId)
   local ammo = ''
   if slotname.isOutOfAmmo() ~= 1 then
      ammo = slotname.getAmmo()
      ammo = system.getItem(ammo)['displayName']
      if ammo:match("Antimatter") then
         ammo = "AM"
      elseif ammo:match("Electromagnetic") then
         ammo = "EM"
      elseif ammo:match("Kinetic") then
         ammo = "KI"
      elseif ammo:match("Thermic") then
         ammo = "TH"
      end
   end

   if ammo ~= '' then lastAmmo[slotname] = {ammoName = ammo} end
   if ammo == '' then
      if lastAmmo[slotname] ~= nil then
         ammo = lastAmmo[slotname].ammoName
      end
   end

   local strd = 'HIT '..ammo..' '..dmg

   if GHUD_show_hits == true then
      hitAnimations = hitAnimations + 1
      lastHitTime[hitAnimations] = {damage = strd, time = 0, hitOpacity = 1, anims = hitAnimations}
   end

   if GHUD_print_hits == true then
      system.print('HIT '..ammo..' '..dmg)
   end

   if totalDamage[targetId] ~= nil then --target damage calculation concept (DeadRank)
      totalDamage[targetId].damage = totalDamage[targetId].damage + dmg
   else
      totalDamage[targetId] = {damage = dmg}
   end
end

function ConvertLocalToWorld(x,y,z)
   local xOffset = x * vec3(construct.getWorldRight())
   local yOffset = y * vec3(construct.getWorldForward())
   local zOffset = z * vec3(construct.getWorldUp())

   return xOffset + yOffset + zOffset + vec3(construct.getWorldPosition())
end

if GHUD_radarWidget_on_top == true then
   mRadar = mRadar:new(system) --radar widget
   if weapon_1 ~= nil then
      mWeapons = mWeapons:new(system, weapon, GHUD_weapon_panels) --weapon widgets
   end
else
   if weapon_1 ~= nil then
      mWeapons = mWeapons:new(system, weapon, GHUD_weapon_panels)
   end
   mRadar = mRadar:new(system)
end

function zeroConvertToWorldCoordinates(pos)
   local num  = ' *([+-]?%d+%.?%d*e?[+-]?%d*)'
   local posPattern = '::pos{' .. num .. ',' .. num .. ',' ..  num .. ',' .. num ..  ',' .. num .. '}'
   local systemId, bodyId, latitude, longitude, altitude = string.match(pos, posPattern)

   if systemId==nil or bodyId==nil or latitude==nil or longitude==nil or altitude==nil then
      system.print("Invalid pos!")
      return vec3()
   end

   if (systemId == "0" and bodyId == "0") then
      --convert space bm
      return vec3(latitude,
      longitude,
      altitude)
   end
   longitude = math.rad(longitude)
   latitude = math.rad(latitude)
   local planet = atlas[tonumber(systemId)][tonumber(bodyId)]
   local xproj = math.cos(latitude);
   local planetxyz = vec3(xproj*math.cos(longitude),
   xproj*math.sin(longitude),
   math.sin(latitude));
   return vec3(planet.center) + (planet.radius + altitude) * planetxyz
end

if databank_1.getStringValue(15) ~= "" then
   asteroidPOS = databank_1.getStringValue(15)
else
   asteroidPOS = ''
end

if GHUD_marker_name == "" then GHUD_marker_name = "Asteroid" end
asteroidcoord = {}
if asteroidPOS ~= "" then
   asteroidcoord = zeroConvertToWorldCoordinates(asteroidPOS)
else
   asteroidcoord = {0,0,0}
end

--icons
local icons = {}
function iconStatusCheck(status)
   if status == 'on' or status == 1 then
      return 'on'
   else
      return ''
   end
end

function icons.space(status)
   return [[<svg class="icon ]] .. iconStatusCheck(status) .. [[" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 197.6 107.43">
   <path class="a" d="M197.19,25.35c-4.31-15-38.37-12.36-60-9.09A53.64,53.64,0,0,0,46.29,42.48C26.28,51.21-3.9,67.12.42,82.08,2.81,90.36,14.68,93.74,31.3,93.74a197.4,197.4,0,0,0,29.09-2.56A53.64,53.64,0,0,0,151.31,65C179.87,52.59,200.82,37.94,197.19,25.35Zm-98.38-16A44.44,44.44,0,0,1,143.2,53.71,45.3,45.3,0,0,1,143,58.4a363,363,0,0,1-38.9,13.51,361.77,361.77,0,0,1-40,9.27A44.32,44.32,0,0,1,98.81,9.32ZM9.37,79.5c-.83-2.89,7.34-13.18,35.74-26.27,0,.16,0,.32,0,.48a53.27,53.27,0,0,0,8.58,29C26.33,86.24,10.55,83.58,9.37,79.5ZM98.81,98.11a44.13,44.13,0,0,1-26.65-9c11.34-2.18,23.07-5,34.47-8.28s22.84-7.12,33.6-11.31A44.43,44.43,0,0,1,98.81,98.11ZM152.5,54.2c0-.16,0-.32,0-.49a53.34,53.34,0,0,0-8.56-29c31-4.05,43.45.32,44.28,3.2C189.42,32,177.43,42.64,152.5,54.2Z" />
   </svg>
   ]]
end

function icons.marker(status)
   return [[<svg class="icon ]] .. iconStatusCheck(status) .. [[" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 148.21 197.07">
   <path class="a" d="M74.1,42.8a31.32,31.32,0,1,0,31.32,31.32A31.35,31.35,0,0,0,74.1,42.8Zm0,52A20.73,20.73,0,1,1,94.83,74.1,20.75,20.75,0,0,1,74.1,94.83Z" />
   <path class="a" d="M74.12,0A74.21,74.21,0,0,0,0,74.13c0,18.39,6.93,32.36,18.88,50.26,12.45,18.7,49.42,68.42,51,70.54a5.28,5.28,0,0,0,8.49,0c1.57-2.11,38.53-51.84,51-70.53,11.95-17.9,18.88-31.87,18.88-50.26A74.18,74.18,0,0,0,74.12,0Zm46.42,118.51c-9.84,14.77-36.1,50.4-46.42,64.36-10.33-14-36.59-49.59-46.43-64.36-12.78-19.15-17.1-30.35-17.1-44.39a63.53,63.53,0,1,1,127,0C137.64,88.16,133.32,99.36,120.54,118.51Z" />
   </svg>
   ]]
end

function icons.ship(status)
   return [[<svg class="icon ]] .. iconStatusCheck(status) .. [[" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 196.27 188.83">
   <path class="a" d="M183.91,132c-11.23-12.44-48.54-50.86-55.11-57.61V45.16C128.8,13.89,106.58,0,98.14,0S67.47,13.89,67.47,45.16V74.43C60.91,81.18,23.6,119.6,12.36,132-.2,146-.06,162.53,0,170.49v1.41a3.8,3.8,0,0,0,3.8,3.8H57.45a40.18,40.18,0,0,1-5.55,6.53,3.8,3.8,0,0,0,2.58,6.6H141.8a3.8,3.8,0,0,0,2.57-6.6,39.67,39.67,0,0,1-5.54-6.53h53.62a3.8,3.8,0,0,0,3.8-3.8v-1.41C196.33,162.53,196.47,146,183.91,132ZM98.14,7.61c3.91,0,23.06,10.23,23.06,37.55v90.08H75.08V45.16C75.08,17.84,94.22,7.61,98.14,7.61Zm8.8,135.23,7.14,38.39H82.19l7.14-38.39ZM7.61,168.1c0-7.87.84-20.37,10.4-31,9.31-10.31,36.81-38.75,49.46-51.79v60.27c0,7.76-2.34,15.68-5.64,22.48Zm67.47-22.48v-2.78H81.6l-7.14,38.39H62.86C69.54,172.09,75.08,158.76,75.08,145.62Zm46.73,35.6-7.14-38.38h6.53v2.78c0,13.14,5.53,26.47,12.22,35.6Zm12.64-13.12c-3.31-6.8-5.65-14.72-5.65-22.48V85.35c12.65,13,40.15,41.48,49.46,51.79,9.57,10.6,10.38,23.09,10.41,31Z" />
   </svg>
   ]]
end

function icons.player(status)
   return [[<svg class="icon ]] .. iconStatusCheck(status) .. [[" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 63.36 198">
   <circle class="a" cx="31.68" cy="17.82" r="17.82" />
   <path class="a" d="M43.56,41.58H19.8A19.86,19.86,0,0,0,0,61.38v45.54A19.85,19.85,0,0,0,11.88,125v57.12A15.89,15.89,0,0,0,27.72,198h7.92a15.89,15.89,0,0,0,15.84-15.84V125a19.85,19.85,0,0,0,11.88-18.12V61.38A19.86,19.86,0,0,0,43.56,41.58Z" />
   </svg>
   ]]
end

function calcDistance(origCenter, destCenter, location)
   local pipe = (destCenter - origCenter):normalize()
   local r = (location-origCenter):dot(pipe) / pipe:dot(pipe)
   if r <= 0. then
      return (location-origCenter):len()
   elseif r >= (destCenter - origCenter):len() then
      return (location-destCenter):len()
   end
   local L = origCenter + (r * pipe)
   pipeDistance =  (L - location):len()

   return pipeDistance
end

function calcDistanceStellar(stellarObjectOrigin, stellarObjectDestination, currenLocation)
   local origCenter = vec3(stellarObjectOrigin.center)
   local destCenter = vec3(stellarObjectDestination.center)

   return calcDistance(origCenter, destCenter, currenLocation)
end

closestPlanet = stellarObjects[1]
closestPlanetT = stellarObjects[1]

function closestPipe()
   while true do
      local smallestDistance = nil
      local nearestPlanet = nil
      local i = 0
      local pos = vec3(construct.getWorldPosition())
      for obj in pairs(stellarObjects) do
         i = i + 1
         if stellarObjects[obj].type[1] ~= 'Asteroid' then
            local planetCenter = vec3(stellarObjects[obj].center)
            local distance = vec3(pos - planetCenter):len()

            if (smallestDistance == nil or distance < smallestDistance) then
               smallestDistance = distance
               nearestPlanet = obj
            end
         end
         if i > 30 then
            i = 0
            coroutine.yield()
         end
      end
      i = 0
      closestPlanet = stellarObjects[nearestPlanet]
      nearestPipeDistance = nil
      --nearestAliothPipeDistance= nil
      for obj in pairs(stellarObjects) do
         i = i + 1
         if (stellarObjects[obj].type[1] == 'Planet' or stellarObjects[obj].isSanctuary == true) then
            for obj2 in pairs(stellarObjects) do
               if (obj2 > obj and (stellarObjects[obj2].type[1] == 'Planet' or stellarObjects[obj2].isSanctuary == true)) then
                  pipeDistance = calcDistanceStellar(stellarObjects[obj], stellarObjects[obj2], pos)
                  if nearestPipeDistance == nil or pipeDistance < nearestPipeDistance then
                     nearestPipeDistance = pipeDistance;
                     sortestPipeKeyId = obj;
                     sortestPipeKey2Id = obj2;
                  end
               end
            end
         end
         if i > 30 then
            i = 0
            coroutine.yield()
         end
      end
      if pos:dist(vec3(stellarObjects[sortestPipeKeyId].center)) < pos:dist(vec3(stellarObjects[sortestPipeKey2Id].center)) then
         closestPipeData = stellarObjects[sortestPipeKeyId].name[1] .. " - " .. stellarObjects[sortestPipeKey2Id].name[1]
      else
         closestPipeData = stellarObjects[sortestPipeKey2Id].name[1] .. " - " .. stellarObjects[sortestPipeKeyId].name[1]
      end
   end
end

corpos = false
corTime = 0

function closestPipe1(pos)
   while true do
      local smallestDistance1 = nil
      local nearestPlanet1 = nil
      local i = 0
      for obj in pairs(stellarObjects) do
         i = i + 1
         if stellarObjects[obj].type[1] ~= 'Asteroid' then
            local planetCenter = vec3(stellarObjects[obj].center)
            local distance = vec3(pos - planetCenter):len()

            if (smallestDistance1 == nil or distance < smallestDistance1) then
               smallestDistance1 = distance
               nearestPlanet1 = obj
            end
         end
         if i > 5 then
            i = 0
            coroutine.yield()
         end
      end
      i = 0
      closestPlanetT = stellarObjects[nearestPlanet1]
      local nearestPipeDistance1 = nil
      --local nearestAliothPipeDistance1= nil
      for obj in pairs(stellarObjects) do
         i = i + 1
         if stellarObjects[obj].type[1] ~= 'Asteroid' then
            for obj2 in pairs(stellarObjects) do
               if (obj2 > obj) and stellarObjects[obj2].type[1] ~= 'Asteroid' then
                  pipeDistance1 = calcDistanceStellar(stellarObjects[obj], stellarObjects[obj2], pos)
                  if nearestPipeDistance1 == nil or pipeDistance1 < nearestPipeDistance1 then
                     nearestPipeDistance1 = pipeDistance1;
                     sortestPipeKeyId1 = obj;
                     sortestPipeKey2Id1 = obj2;
                  end
               end
            end
         end
         if i > 5 then
            i = 0
            coroutine.yield()
         end
      end
      distCP = vec3(pos):dist(vec3(closestPlanetT.center))
      if distCP > 100000 then
         distCP = ''..string.format('%0.2f', distCP/200000)..' su'
      elseif distCP > 1000 and distCP < 100000 then
         distCP = ''..string.format('%0.1f', distCP/1000)..' km'
      else
         distCP = ''..string.format('%0.0f', distCP)..' m'
      end
      distS1 = ''
      if nearestPipeDistance1 >= 100000 then
         distS1 = ''..string.format('%0.2f', nearestPipeDistance1/200000)..' su'
      elseif nearestPipeDistance1 >= 1000 and nearestPipeDistance1 < 100000 then
         distS1 = ''..string.format('%0.1f', nearestPipeDistance1/1000)..' km'
      else
         distS1 = ''..string.format('%0.0f', nearestPipeDistance1)..' m'
      end
      if vec3(pos):dist(vec3(stellarObjects[sortestPipeKeyId1].center)) < vec3(pos):dist(vec3(stellarObjects[sortestPipeKey2Id1].center)) then
         closestpip = stellarObjects[sortestPipeKeyId1].name[1] .. " - " .. stellarObjects[sortestPipeKey2Id1].name[1]
      else
         closestpip = stellarObjects[sortestPipeKey2Id1].name[1] .. " - " .. stellarObjects[sortestPipeKeyId1].name[1]
      end
      if system.getArkTime() - corTime > 4 then
         corpos = false
         system.print('Closest planet: '..closestPlanetT.name[1]..' - '..distCP)
         system.print('Closest pipe: '..closestpip..' - '..distS1)
         system.print(safeZone1(asteroidcoord))
      end
   end
end

function safeZone1(pos)
   local WorldPos = pos
   local mabs = math.abs
   local safeRadius = 18000000
   local szradius = 500000
   local distsz1, distp1 = math.huge
   local szsafe1 = false
   local distsz1 = vec3(WorldPos):dist(safeWorldPos)
   if distsz1 < safeRadius then
      szsafe1=true
      local distS = mabs(distsz1 - safeRadius)
      if distS > 100000 then
         distS = ''..string.format('%0.2f', distS/200000)..' su'
      elseif distS > 1000 and distS < 100000 then
         distS = ''..string.format('%0.1f', distS/1000)..' km'
      else
         distS = ''..string.format('%0.0f', distS)..' m'
      end
      local a1 = 'Central SZ, distance to PvP - '..distS
      return a1
   end

   local distp1 = vec3(WorldPos):dist(vec3(closestPlanetT.center))
   if distp1 < szradius then szsafe1 = true else szsafe1 = false end
   if mabs(distp1 - szradius) < mabs(distsz1 - safeRadius) then
      local distS = mabs(distp1 - szradius)
      if distS > 100000 then
         distS = ''..string.format('%0.2f', distS/200000)..' su'
      elseif distS > 1000 and distS < 100000 then
         distS = ''..string.format('%0.1f', distS/1000)..' km'
      else
         distS = ''..string.format('%0.0f', distS)..' m'
      end
      if szsafe1 == true then
         local a1 = closestPlanetT.name[1]..' - SAFE zone, distance to PvP - '..distS
         return a1
      else
         local a1 = 'PvP zone, closest safe zone - '..closestPlanetT.name[1]..' - '..distS
         return a1
      end
   else
      local distS = mabs(distsz1 - safeRadius)
      if distS > 100000 then
         distS = ''..string.format('%0.2f', distS/200000)..' su'
      elseif distS > 1000 and distS < 100000 then
         distS = ''..string.format('%0.1f', distS/1000)..' km'
      else
         distS = ''..string.format('%0.0f', distS)..' m'
      end
      local a1 = 'PvP zone, closest safe zone - Central SZ - '..distS
      return a1
   end
end

--2D Planet radar and AR planets
DisplayRadar = false
function drawonradar(coordonate,PlaneteName)
   local constructUp = vec3(construct.getWorldOrientationUp())
   local constructForward = vec3(construct.getWorldOrientationForward())
   local constructRight = vec3(construct.getWorldOrientationRight())
   local ConstructWorldPos = vec3(construct.getWorldPosition())
   local ToCible=coordonate-ConstructWorldPos
   local Xcoord = mySignedAngleBetween(ToCible, constructForward, constructUp)/math.pi --*RadarR
   local Ycoord = mySignedAngleBetween(ToCible, constructForward, constructRight)/math.pi --*RadarR+RadarY
   local XcoordR=Xcoord*math.sqrt(1-Ycoord*Ycoord/2)*RadarR+RadarX
   local YcoordR=Ycoord*math.sqrt(1-Xcoord*Xcoord/2)*RadarR+RadarY
   svgradar=svgradar..string.format([[
   <circle cx="%f" cy="%f" r="4" fill="red" />
   <text x="%f" y="%f" font-size="11px" fill="yellow">%s</text>
   ]],XcoordR,YcoordR,XcoordR+4,YcoordR,PlaneteName)
end

function mySignedAngleBetween(vecteur1, vecteur2, planeNormal)

   local normVec1 = vecteur1:project_on_plane(planeNormal):normalize()
   local normVec2 = vecteur2:normalize()

   local angle = math.acos(normVec1:dot(normVec2))
   local crossProduct = vecteur1:cross(vecteur2)

   if crossProduct:dot(planeNormal) < 0 then
      return -angle
   else
      return angle
   end
end

function pD()
   if nearestPipeDistance ~= nil and closestPipeData ~= nil then
      local pipeD = ''
      if nearestPipeDistance >= 100000 then
         pipeD = ''..string.format('%0.2f', nearestPipeDistance/200000)..' su'
      elseif nearestPipeDistance >= 1000 and nearestPipeDistance < 100000 then
         pipeD = ''..string.format('%0.1f', nearestPipeDistance/1000)..' km'
      else
         pipeD = ''..string.format('%0.0f', nearestPipeDistance)..' m'
      end
      if nearestPipeDistance >= 600000 then
         return closestPipeData.. '<br>' .. '<green1>'..pipeD..'</green1>'
      elseif nearestPipeDistance >= 400000 and nearestPipeDistance <= 600000 then
         return closestPipeData.. '<br>' .. '<orange1>'..pipeD..'</orange1>'
      elseif nearestPipeDistance < 400000 then
         return closestPipeData.. '<br>' .. '<red1>'..pipeD..'<red1>'
      end
   else
      return ""
   end
end

for BodyId in pairs(atlas[0]) do
   local planet=atlas[0][BodyId]
   if planet.name[1] == GHUD_destination_planet then
      DestinationCenter = vec3(planet.center)
      DestinationCenterName = planet.name[1]
   end
   if planet.name[1] == GHUD_departure_planet then
      DepartureCenter = vec3(planet.center)
      DepartureCenterName = planet.name[1]
   end
end

function safeZone()
   local WorldPos = vec3(construct.getWorldPosition())
   local mabs = math.abs
   local safeRadius = 18000000
   local szradius = 500000
   local distsz, distp = math.huge
   szsafe = false
   planetzone = ''
   local distsz = vec3(WorldPos):dist(safeWorldPos)
   if distsz < safeRadius then
      szsafe=true
      distS = mabs(distsz - safeRadius)
      local a3 = ''
      local vector1 = vectorLengthen(safeWorldPos, WorldPos, distS)
      if distS > 100000 then
         distS = string.format('%0.2f', distS/200000)
         a3 = 'su'
      elseif distS > 1000 and distS < 100000 then
         distS = string.format('%0.1f', distS/1000)
         a3 = 'km'
      else
         distS = string.format('%0.0f', distS)
         a3 = 'm'
      end
      local a1 = 'PvP ZONE'
      local a2 = distS
      return a1, vector1, a2, a3
   end

   distp = vec3(WorldPos):dist(vec3(closestPlanet.center))
   if distp < szradius then szsafe = true else szsafe = false end
   if mabs(distp - szradius) < mabs(distsz - safeRadius) then
      distS = mabs(distp - szradius)
      local distS1 = distS
      local a3 = ''
      if distS > 100000 then
         distS = string.format('%0.2f', distS/200000)
         a3 = 'su'
      elseif distS > 1000 and distS < 100000 then
         distS = string.format('%0.1f', distS/1000)
         a3 = 'km'
      else
         distS = string.format('%0.0f', distS)
         a3 = 'm'
      end
      if szsafe == true then
         local a1 = closestPlanet.name[1]..' PvP ZONE'
         local vector1 = vectorLengthen(vec3(closestPlanet.center), WorldPos, distS1)
         local a2 = distS
         return a1, vector1, a2, a3
      else
         local a1 = closestPlanet.name[1]..' SAFE ZONE'
         local vector1 = vec3(closestPlanet.center)
         planetzone = closestPlanet.name[1]
         local a2 = distS
         return a1, vector1, a2, a3
      end
   else
      distS = mabs(distsz - safeRadius)
      local a3 = ''
      local vector1 = safeWorldPos
      if distS > 100000 then
         distS = string.format('%0.2f', distS/200000)
         a3 = 'su'
      elseif distS > 1000 and distS < 100000 then
         distS = string.format('%0.1f', distS/1000)
         a3 = 'km'
      else
         distS = string.format('%0.0f', distS)
         a3 = 'm'
      end
      local a1 = 'SAFE ZONE'
      local a2 = distS
      return a1, vector1, a2, a3
   end
end

function customDistance(distance)
   local distanceS=''
   if distance < 1000 then
      distanceS = ''..string.format('%0.0f', distance)..' m'
   elseif distance < 100000 then
      distanceS = ''..string.format('%0.1f', distance/1000)..' km'
   else
      distanceS = ''..string.format('%0.2f', distance/200000)..' su'
   end
   return distanceS
end

local function signedAngleBetween(vec1, vec2, planeNormal)
   local normVec1 = vec1:normalize()
   local normVec2 = vec2:normalize()
   local cosAngle = normVec1:dot(normVec2)
   cosAngle = utils.clamp(cosAngle, -1, 1)
   local angle = math.acos(cosAngle)
   local crossProduct = vec1:cross(vec2)
   if crossProduct:dot(planeNormal) < 0 then
      return -angle - math.pi
   else
      return angle + math.pi
   end
end
local function directionToBearing (direction, worldVertical)
   local north = vec3(0, 0, 1)
   local northOnGround = north:project_on_plane(worldVertical)
   local directionOnGround = direction:project_on_plane(worldVertical)
   return signedAngleBetween(northOnGround, directionOnGround, worldVertical)
end
function rotateX3D(point, theta)
   theta = theta * math.pi / 180
   local sinTheta = math.sin(theta);
   local cosTheta = math.cos(theta);
   local y = point.y * cosTheta - point.z * sinTheta
   local z = point.z * cosTheta + point.y * sinTheta
   point.y = y
   point.z = z
   return point
end
function rotateY3D(point, theta)
   theta = theta * math.pi / 180
   local sinTheta = math.sin(theta);
   local cosTheta = math.cos(theta);
   local x = point.x * cosTheta - point.y * sinTheta
   local y = point.y * cosTheta + point.x * sinTheta
   point.x = x
   point.y = y
   return point
end
function rotateZ3D(point, theta)
   theta = theta * math.pi / 180
   local sinTheta = math.sin(theta);
   local cosTheta = math.cos(theta);
   local x = point.x * cosTheta + point.z * sinTheta
   local z = point.z * cosTheta - point.x * sinTheta
   point.x = x
   point.y = y
   return point
end

--3D galaxy map
function drawMap()
   local asteroid=""
   local planet=""
   local asterunits=""
   local asternumbers=""
   local galaxyMap = ''

   galaxyMap = [[
   <div class="system-map">
   <div class="map-actual" style="transform: perspective(1920px) translateZ(-250px);">
   <div class="map-center" style="transform: translate(-50%, -50%) rotateX(]]..yDelta..[[deg) rotateY(0deg) rotateZ(]]..xDelta..[[deg);"></div>
   ]]

   for BodyId in pairs(stellarObjects) do
      --local planetBody = helios[v.bodyId]
      local v = stellarObjects[BodyId]
      local planetName = v.name[1]
      local typeplanet = v.type[1]
      local center = vec3(v.center)
      local distance = customDistance(vec3(vec3(construct.getWorldPosition()) - vec3(v.center)):len())

      local coords = {x=center.x + (-center.x * mapScale), y=center.y + (-center.y * mapScale), z=center.z + (-center.z * mapScale)}
      rotateY3D(coords, xDelta)
      rotateX3D(coords, yDelta)
      local mainPlanet = true;
      local size = planetScale

      if vec3(vec3(construct.getWorldPosition()) - vec3(v.center)):len() > 12000000 then
         size = planetScale
      else
         size = aliothsize
      end
      local display = "block"
      if typeplanet ~= 'Planet' then
         size = moonScale
         display = "none"
      end

      local planet = [[
      <div class="map-pin" style="display: ]]..display..[[; transform: translate(-50%, -50%) translateX(]]..coords.x..[[px) translateY(]]..coords.y..[[px) translateZ(]]..coords.z..[[px);">
      <div class="pin-data" style="display: ]]..display..[[;">
      <div class="name">]]..planetName..[[</div>
      <div class="units">]]..distance..[[</div>
      </div>
      <div class="planet" style="width: ]]..(v.radius/size)..[[px; height: ]]..(v.radius/size)..[[px;"></div>
      </div>
      ]]

      galaxyMap = galaxyMap .. planet
   end

   local shipPosition = construct.getWorldPosition()
   local shipCoords = {x=shipPosition[1] + (-shipPosition[1] * mapScale), y=shipPosition[2] + (-shipPosition[2] * mapScale), z=shipPosition[3] + (-shipPosition[3] * mapScale)}
   rotateY3D(shipCoords, xDelta)
   rotateX3D(shipCoords, yDelta)

   local playerPosition = [[
   <div class="map-pin player" style="transform: translate(-50%, -50%) translateX(]]..shipCoords.x..[[px) translateY(]]..shipCoords.y..[[px) translateZ(]]..shipCoords.z..[[px);">
   <div class="pin-data">
   <div class="name"></div>
   </div>
   ]]..icons.player()..[[
   </div>
   ]]
   galaxyMap = galaxyMap.. playerPosition

   if asteroidPOS ~= "" then
      local aPosition = asteroidcoord
      local distance = customDistance(vec3(aPosition - vec3(construct.getWorldPosition())):len())
      local asteroidC = {x=aPosition.x + (-aPosition.x * mapScale), y=aPosition.y + (-aPosition.y * mapScale), z=aPosition.z + (-aPosition.z * mapScale)}
      rotateY3D(asteroidC, xDelta)
      rotateX3D(asteroidC, yDelta)
      local asteroid = [[
      <div class="map-pin" style="transform: translate(-50%, -50%) translateX(]]..asteroidC.x..[[px) translateY(]]..asteroidC.y..[[px) translateZ(]]..asteroidC.z..[[px);">
      <div class="pin-data">
      <div class="name">]]..GHUD_marker_name..[[</div>
      <div class="units">]]..distance..[[</div>
      </div>
      <div class="warp-scan"></div>
      </div>
      ]]
      galaxyMap = galaxyMap..asteroid..'</div></div>'
   end
   galaxyMap = galaxyMap .. '</div></div>'

   return galaxyMap
end

mapGalaxy = [[
<style>
.system-map {
   position: absolute;
   top: 0;
   width: 100%;
   height: 100%;
   background: rgba(7, 44, 82, .81);
   left: 0;
}
.planet {
   width: 20px;
   height: 20px;
   border-radius: 50%;
   border: 2px solid;
   box-sizing: border-box;
   background: rgba(148, 206, 255, .29);
}
.map-actual {
   position: absolute;
   width: 100%;
   height: 100%;
   top: 0;
   left: 0;
   transform-style: preserve-3d;
}
.map-center {
   position: absolute;
   content: '';
   width: 2000px;
   height: 2000px;
   top: 50%;
   left: 50%;
   background: repeating-radial-gradient(rgba(0, 17, 35, .23), transparent 112px), repeating-radial-gradient(rgba(148, 206, 255, .34), transparent 75%);
   border-radius: 50%;
}
.map-pin {
   position: absolute;
   top: 50%;
   left: 50%;
}
.map-pin .icon,
.map-pin .planet {
   height: 30px;
   width: 30px;
}
.pin-data {
   position: absolute;
   bottom: 100%;
   margin-bottom: 10px;
   white-space: nowrap;
   text-align: center;
   width: 200px;
   left: 50%;
   transform: translateX(-50%);
}
.pin-data .name {
   font-size: 16px;
   color: white;
   line-height: 16px;
}
.pin-data .units {
   font-family: monospace;
   font-size: 14px;
   font-weight: bold;
   line-height: 14px;
}
.map-pin.player {
   filter: drop-shadow(0px 0px 20px #edf7ff);
}
.map-pin.player .icon {
   fill: #ffde56;
}
.con-size {
   width: 20px;
   text-align: center;
   background: #235f92;
   margin-right: 4px;
   color: white;
   height: 18px;
}
.warp-scan {
   width: 15px;
   height: 15px;
   border-radius: 50%;
   box-sizing: border-box;
   background: #ff3a56;
}
</style>]]

--main gunner function
function main()
   while true do
      local i = 0
      local htmltext = ""
      local hudver = ""
      local htmltext2 = ""
      local friendlies = 0
      local countLock = 0
      local countAttacked = 0
      local list, list2, lockList = "", "", ""
      local islockList = ""
      local caption = ""
      local captionL = ""
      local target1 = ""
      local locks = ""
      local statusSVG = ""
      local captionText = ""
      local okcolor = ""
      local captionLcolor = ""
      radarTarget = {}
      radarStatic = {}
      radarDynamic = {}
      radarDynamicData = radarDynamicWidget
      radarDynamicWidget = {}
      radarStaticData = radarStaticWidget
      radarStaticWidget = {}
      if radar_2 ~= nil then
         if radar_1.getOperationalState() == -1 and atmovar == false then
            atmovar = true
            activeRadar = radar_2
            mRadar:deleteWidget()
            mRadar:createWidgetNew()
            radarWidgetScale = 160
            radarWidgetScaleDisplay = '<div class="measures"><span>0 KM</span><span>2.5 KM</span><span>5 KM</span></div>'
            activeRadar.setSortMethod(1)
         end
         if radar_1.getOperationalState() == 1 and atmovar == true then
            atmovar = false
            activeRadar = radar_1
            mRadar:deleteWidget()
            mRadar:createWidgetNew()
            radarWidgetScale = 2
            radarWidgetScaleDisplay = '<div class="measures"><span>0 SU</span><span>1 SU</span><span>2 SU</span></div>'
            activeRadar.setSortMethod(1)
         end
      end
      for k,v in pairs(radarIDs) do
         i = i + 1
         local size = activeRadar.getConstructCoreSize(v)
         local constructRow = {}
         if t_radarEnter[v] ~= nil then
            if activeRadar.hasMatchingTransponder(v) == 0 and not whitelist[v] and size ~= "" and activeRadar.getConstructDistance(v) < 600000 then --do not show far targets during warp and server lag
               local name = activeRadar.getConstructName(v)
               local typeC = activeRadar.getConstructKind(v)
               if activeRadar.isConstructAbandoned(v) == 0 then
                  local msg = 'NEW TARGET: '..name..' - Size: '..size..' - '..v..'\n '..t_radarEnter[v].pos..''
                  table.insert(loglist, msg)
                  if count < 10 then --max 10 notifications
                     count = count + 1
                     if target[count] == nil then
                        if typeC == 5 then
                           target[count] = {left = 100, opacity = 1, cnt = count, name1 = name, size1 = size, id = tostring(v):sub(-3), one = true, check = true, delay = 0, color = '#0258ba'}
                        else
                           target[count] = {left = 100, opacity = 1, cnt = count, name1 = name, size1 = size, id = tostring(v):sub(-3), one = true, check = true, delay = 0, color = '#9202ba'}
                        end
                     end
                     system.playSound('enter.mp3')
                  end
               else
                  local pos = activeRadar.getConstructWorldPos(v)
                  pos = '::pos{0,0,'..pos[1]..','..pos[2]..','..pos[3]..'}'
                  local msg = 'NEW TARGET (abandoned): '..name..' - Size: '..size..' - '..v..'\n '..pos..''
                  table.insert(loglist, msg)
                  if count < 10 then --max 10 notifications
                     count = count + 1
                     if target[count] == nil then
                        target[count] = {left = 100, opacity = 1, cnt = count, name1 = name, size1 = size, id = tostring(v):sub(-3), one = true, check = true, delay = 0, color = 'black'}
                     end
                  end
                  system.playSound('sonar.mp3')
               end
            end
            t_radarEnter[v] = nil
         end
         if GHUD_show_echoes == true then
            if size ~= "" then
               constructRow.widgetDist = math.ceil(activeRadar.getConstructDistance(v) / 1000 * radarWidgetScale)
            end
         end
         --radarlist
         if GHUD_show_allies == true and size ~= "" then
            if activeRadar.hasMatchingTransponder(v) == 1 or whitelist[v] then
               local name = activeRadar.getConstructName(v)
               local dist = math.floor(activeRadar.getConstructDistance(v))
               local ownerTag = ''
               if activeRadar.hasMatchingTransponder(v) == 1 then
                  local owner = activeRadar.getConstructOwnerEntity(v)
                  if owner['isOrganization'] then
                     ownerTag = system.getOrganization(owner['id']).tag
                     friendsData[v] = {tag = ownerTag}
                  else
                     ownerTag = system.getPlayerName(owner['id'])
                     friendsData[v] = {tag = ownerTag}
                  end
               else
                  ownerTag = 'DB'
               end
               if dist >= 1000 then
                  dist = ''..string.format('%0.1f', dist/1000)..' km ('..string.format('%0.2f', dist/200000)..' su)'
               else
                  dist = ''..dist..' m'
               end
               local allID = tostring(v):sub(-3)
               local nameA = ''..allID..' '..name..''
               friendlies = friendlies + 1
               if activeRadar.getTargetId(v) ~= v and friendlies < GHUD_allies_count1 then
                  list = list..[[
                  <div class="table-row3 th3">
                  <div class="table-cell3">
                  ]]..'['..size..'] '..nameA.. [[ <allyborder>]]..ownerTag..[[</allyborder><br><distalliescolor>]] ..dist.. [[</distalliescolor>
                  </div>
                  </div>]]
               end
               if activeRadar.getTargetId(v) == v and friendlies < GHUD_allies_count1 then
                  list = list..[[
                  <div class="table-row3 th3S">
                  <div class="table-cell3S">
                  ]]..'['..size..'] '..nameA.. [[ <allyborder>]]..ownerTag..[[</allyborder><br><distalliescolor>]] ..dist.. [[</distalliescolor>
                  </div>
                  </div>]]
               end
               if activeRadar.getTargetId(v) == v and friendlies >= GHUD_allies_count1 then
                  list = list..[[
                  <div class="table-row3 th3S">
                  <div class="table-cell3S">
                  ]]..'['..size..'] '..nameA.. [[ <allyborder>]]..ownerTag..[[</allyborder><br><distalliescolor>]] ..dist.. [[</distalliescolor>
                  </div>
                  </div>]]
               end
            end
         end
         --targets
         local speed = 0
         local radspeed = 0
         local angspeed = 0
         if activeRadar.isConstructIdentified(v) == 1 and size ~= "" then
            local name = activeRadar.getConstructName(v)
            local dist = math.floor(activeRadar.getConstructDistance(v))
            if dist >= 1000 then
               dist = ''..string.format('%0.1f', dist/1000)..' km ('..string.format('%0.2f', dist/200000)..' su)'
            else
               dist = ''..dist..' m'
            end
            local IDT = tostring(v):sub(-3)
            local nameIDENT = ''..IDT..' '..name..''
            --local nameT = string.sub((""..nameIDENT..""),1,11)
            --table.insert(radarTarget, constructRow)
            isILock = true
            speed = math.floor(activeRadar.getConstructSpeed(v) * 3.6)
            if activeRadar.getTargetId(v) == v then
               islockList = islockList..[[
               <div class="table-row2 thS">
               <div class="table-cellS">
               ]]..'['..size..'] '..nameIDENT.. [[ <speedcolor> ]] ..speed.. [[ km/h</speedcolor><br><distcolor>]] ..dist.. [[</distcolor>
               </div>
               </div>]]
            else
               islockList = islockList..[[
               <div class="table-row2 th2">
               <div class="table-cell2">
               ]]..'['..size..'] '..nameIDENT.. [[ <speedcolor> ]] ..speed.. [[ km/h</speedcolor><br><distcolor>]] ..dist.. [[</distcolor>
               </div>
               </div>]]
            end
         else

            if GHUD_show_echoes == true then
               if size ~= "" then
                  if activeRadar.getConstructKind(v) == 5 then
                     table.insert(radarDynamic, constructRow)
                     if radarDynamicWidget[constructRow.widgetDist] ~= nil then
                        radarDynamicWidget[constructRow.widgetDist] = radarDynamicWidget[constructRow.widgetDist] + 1
                     else
                        radarDynamicWidget[constructRow.widgetDist] = 1
                     end
                  else
                     table.insert(radarStatic, constructRow)
                     if radarStaticWidget[constructRow.widgetDist] ~= nil then
                        radarStaticWidget[constructRow.widgetDist] = radarStaticWidget[constructRow.widgetDist] + 1
                     else
                        radarStaticWidget[constructRow.widgetDist] = 1
                     end
                  end
               end
            end
         end
         --lockstatus
         if (activeRadar.getThreatRateFrom(v) == 2 or activeRadar.getThreatRateFrom(v) == 3 or activeRadar.getThreatRateFrom(v) == 5) and size ~= "" then
            countLock = countLock + 1
            local name = string.sub((""..activeRadar.getConstructName(v)..""),1,11)
            local dist = math.floor(activeRadar.getConstructDistance(v))
            if dist >= 1000 then
               dist = ''..string.format('%0.1f', dist/1000)..' km ('..string.format('%0.2f', dist/200000)..' su)'
            else
               dist = ''..dist..' m'
            end
            local loclIDT = tostring(v):sub(-3)
            local nameLOCK = ''..loclIDT..' '..name..''
            if activeRadar.getThreatRateFrom(v) == 5 then
               countAttacked = countAttacked + 1
               lockList = lockList..[[
               <div class="table-row th">
               <div class="lockedT">
               <redcolor1>]]..'['..size..'] '..nameLOCK.. [[</redcolor1><br><distcolor>]] ..dist.. [[</distcolor>
               </div>
               </div>]]
            else
               lockList = lockList..[[
               <div class="table-row th">
               <div class="lockedT">
               <orangecolor>]]..'['..size..'] '..nameLOCK.. [[</orangecolor><br><distcolor>]] ..dist.. [[</distcolor>
               </div>
               </div>]]
            end
         end
         if i > 50 then
            i = 0
            coroutine.yield()
         end
      end
      if GHUD_show_allies == true then
         if friendlies > 0 then
            caption = "<alliescolor>Allies:</alliescolor><br><countcolor>"..friendlies.."</countcolor> <countcolor2>"..conID.."</countcolor2>"
         else
            caption = "<alliescolor>Allies:</alliescolor><br><countcolor>0</countcolor> <countcolor2>"..conID.."</countcolor2>"
         end
         htmltext = htmlbasic .. [[
         <style>
         .th3>.table-cell3 {
            color: ]]..GHUD_allied_names_color..[[;
            font-weight: bold;
         }
         </style>
         <div class="table3">
         <div class="table-row3 th3">
         <div class="table-cell3">
         ]]..caption..[[
         </div>
         </div>
         ]]..list..[[
         </div>]]
      end
      caption = "<targetscolor>Targets:</targetscolor>"
      target1 = targetshtml .. [[
      <style>
      .th2>.table-cell2 {
         color: ]]..GHUD_target_names_color..[[;
         font-weight: bold;
      }
      </style>
      <div class="table2">
      <div class="table-row2 th2">
      <div class="table-cell2">
      ]] .. caption .. [[<br><countcolor>]]..idN-friendlies..[[</colorcount>
      </div>
      </div>
      ]] .. islockList .. [[
      </div>]]
      --threat status
      if countLock == 0 then
         captionL = "LOCK"
         captionLcolor = "#07e88e"
         captionText = "OK"
         okcolor = captionLcolor
      else
         captionL = "LOCKED:"
         captionLcolor = "#FFB12C"
         captionText = countLock
         okcolor = "rgb(0, 191, 255)"
      end
      --attackers count
      if countAttacked > 0 then
         captionL = "ATTACKED:"
         captionLcolor = "#fc033d"
         captionText = countAttacked
         okcolor = "rgb(0, 191, 255)"
      end
      --threat icon
      statusSVG = [[<style>.radarLockstatus {
         position: fixed;
         background: transparent;
         width: 6em;
         padding: 1vh;
         top: ]]..statusY..[[vh;
         left: 50%;
         transform: translateX(-50%);
         text-align: center;
         fill: ]]..captionLcolor..[[;
      }
      </style>
      <div class="radarLockstatus">
      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512">
      <g>
      <path d="m501,245.6h-59.7c-5.3-93.9-81-169.6-174.9-174.9v-59.7h-20.9v59.7c-93.8,5.3-169.5,81-174.8,174.9h-59.7v20.9h59.7c5.3,93.8 81,169.5 174.9,174.8v59.7h20.9v-59.7c93.9-5.3 169.6-80.9 174.8-174.8h59.7v-20.9zm-80.6,0h-48.1c-4.9-56.3-49.6-100.9-105.9-105.9v-48.1c82.5,5.2 148.8,71.5 154,154zm-69.1,20.8c-4.9,44.7-40.9,80-84.9,84.9v-31.7h-20.9v31.8c-44.8-4.8-80.1-40.1-84.9-84.9h31.8v-20.9h-31.7c4.9-44.7 40.9-80 84.9-84.9v31.7h20.9v-31.7c44,4.9 80,40.2 84.9,84.9h-31.7v20.9h31.6zm-105.7-174.9v48.1c-56.3,4.9-100.9,49.6-105.9,105.9h-48.1c5.2-82.5 71.5-148.8 154-154zm-154,174.8h48.1c4.9,56.3 49.6,100.9 105.9,105.9v48.1c-82.5-5.2-148.8-71.5-154-154zm174.8,154v-48.1c56.3-4.9 100.9-49.6 105.9-105.9h48.1c-5.2,82.5-71.5,148.8-154,154z"/>
      </g>
      <text style="fill: ]]..okcolor..[[; font-size: 110px; font-weight: bold; text-anchor: middle;" x="256" y="294.054">]]..captionText..[[</text>
      </svg>
      </div>]]
      locks = lockhtml .. [[
      <style>
      .th>.table-cell {
         font-weight: bold;
      }
      </style>
      <div class="table">
      <div class="table-row th">
      <div class="table-cell">
      <rightlocked style="color: ]]..captionLcolor..[[;">]] .. captionL  .. [[</rightlocked>
      </div>
      </div>
      ]] .. lockList .. [[
      </div>]]
      --Echoes widget
      if GHUD_show_echoes == true then
         local dynamic = ''
         for k,v in pairs(radarDynamicData) do
            dynamic = dynamic .. '<span style="left:'..k..'px;height:'..v..'px;"></span>'
         end
         local static = ''
         for k,v in pairs(radarStaticData) do
            static = static .. '<span style="left:'..k..'px;height:'..v..'px;"></span>'
         end
         local htmlRadar = htmlRadar .. [[
         <div class="radar-widget">
         <div class="d-widget">]] .. dynamic .. [[</div>
         <div class="s-widget">]] .. static .. [[</div>
         <div class="labels">
         <span style="color: #6fc9ff;">DYNAMIC</span>
         <span style="color: #ff8d00;">STATIC</span>
         </div>
         ]]..radarWidgetScaleDisplay..[[
         </div>
         ]]
         radarWidget = htmlRadar
      else
         radarWidget = ''
      end

      hudver = hudvers .. [[<div class="hudversion">GHUD v]]..HUD_version..[[</div>]]

      if GHUD_show_echoes == true then
         if GHUD_show_allies == true then
            --system.setScreen(htmltext .. target1 .. locks .. hudver .. radarWidget ..statusSVG)
            gunnerHUD = htmltext .. target1 .. locks .. hudver .. radarWidget ..statusSVG
         else
            --system.setScreen(target1 .. locks .. hudver .. radarWidget ..statusSVG)
            gunnerHUD = target1 .. locks .. hudver .. radarWidget ..statusSVG
         end

      else

         if GHUD_show_allies == true then
            --system.setScreen(htmltext .. target1 .. locks .. hudver ..statusSVG)
            gunnerHUD = htmltext .. target1 .. locks .. hudver ..statusSVG
         else
            --system.setScreen(target1 .. locks .. hudver ..statusSVG)
            gunnerHUD = target1 .. locks .. hudver ..statusSVG
         end
      end
      coroutine.yield()
   end
end

--HUD design
lockhtml = [[<style>
.table {
   display: table;
   background: ]]..GHUD_background_color..[[;
   left: 0;
   top: 5vh;
   position: fixed;
}
.table-row {
   display: table-row;
}
.table-cell {
   display: table-cell;
   padding: 6px;
   border: 1px solid ]]..GHUD_border_color..[[;
   color: white;
}
.lockedT {
   display: table-cell;
   padding: 6px;
   border: 1px solid ]]..GHUD_border_color..[[;
   border-top: none;
   color: white;
   font-weight: bold;
}
orangecolor {
   color: #fca503;
}
redcolor1 {
   color: #fc033d;
}
rightlocked {
}</style>]]
targetshtml = [[<style>
.table2 {
   display: table;
   background: ]]..GHUD_background_color..[[;
   position: fixed;
   top: 0;
   left: 0;
}
.table-row2 {
   display: table-row;
   float: left;
}
.table-cell2 {
   display: table-cell;
   padding: 6px;
   border: 1px solid ]]..GHUD_border_color..[[;
   color: white;
}
.table-cellS {
   display: table-cell;
   padding: 6px;
   border: 1px solid ]]..GHUD_selected_border_color..[[;
   color: white;
}
.thS>.table-cellS {
   color: ]]..GHUD_target_names_color..[[;
   font-weight: bold;
}
distcolor {
   font-weight: bold;
   color: ]]..GHUD_distance_color..[[;
}
distalliescolor {
   font-weight: bold;
   color: ]]..GHUD_allies_distance_color..[[;
}
speedcolor {
   font-weight: bold;
   color: ]]..GHUD_speed_color..[[;
   outline: 1px inset black;
}
countcolor {
   font-weight: bold;
   color: ]]..GHUD_count_color..[[;
}
countcolor2 {
   font-weight: bold;
   color: ]]..GHUD_your_ship_ID_color..[[;
   float: right;
}
chancecolor {
   color: #6affb1;
}
targetscolor {
   color: ]]..GHUD_targets_color..[[;
}
alliescolor {
   color: ]]..GHUD_allies_color..[[;
}
.txgrenright {
   font-weight: bold;
   text-align: right;
   color: #0cf27b;
}
</style>]]
htmlbasic = [[<style>
.table3 {
   display: table;
   background: ]]..GHUD_background_color..[[;
   font-weight: bold;
   position: fixed;
   bottom: ]]..GHUD_allies_Y..[[vh;
   left: 0;
}
allyborder {
   color: white;
   background-color: green;
   padding-right: 3px;
   padding-left: 3px;
   padding-top: 0.5px;
   padding-bottom: 0.5px;
   border-radius: 5px;
   border: 2px solid white;
}
.table-row3 {
   display: table-row;
   float: left;
}
.table-cell3 {
   display: table-cell;
   padding: 5px;
   border: 1px solid ]]..GHUD_border_color..[[;
   color: white;
   font-weight: bold;
}
.table-cell3S {
   display: table-cell;
   padding: 5px;
   border: 1px solid ]]..GHUD_selected_border_color..[[;
   color: white;
}
.th3S>.table-cell3S {
   color: ]]..GHUD_allied_names_color..[[;
   font-weight: bold;
}</style>]]
hudvers = [[
<style>
.hudversion {
   position: absolute;
   bottom: 0.15vh;
   color: white;
   right: 5.25vw;
   font-family: verdana;
   letter-spacing: 0.5px;
   font-size: 1.2em;
}</style>]]

htmlRadar = [[
<style>
.radar-widget {
   width: 800px;
   height: 50px;
   position: absolute;
   margin-left: auto;
   margin-right: auto;
   left: 0;
   right: 0;
   top: 8vh;
   background: radial-gradient(60% 50% at 50% 50%, rgba(60, 166, 255, .34), transparent);
   border-right: 1px solid;
   border-left: 1px solid;
   transform-style: preserve-3d;
   transform-origin: top;
   transform: perspective(120px) rotateX(-4deg);
}
.d-widget,
.s-widget {
   height: 25px;
   width: 100%;
   overflow: hidden;
   position: relative;
}
.s-widget {
   border-top: 1px solid;
}
.d-widget span {
   background: linear-gradient(0deg, #b6ddff, #3ea7ff 25px);
   width: 2px;
   bottom: 0;
   position: absolute;
}
.s-widget span {
   background: linear-gradient(180deg, #ffd322, #ff7600 25px);
   width: 2px;
   top: 0;
   position: absolute;
}
.measures {
   display: flex;
   justify-content: space-between;
   font-size: 20px;
}
.measures span:first-child {
   transform: translateX(-50%);
}
.measures span:last-child {
   transform: translateX(50%);
}
.labels {
   display: flex;
   flex-direction: column;
   position: absolute;
   right: -60px;
   top: 0;
   height: 100%;
   justify-content: space-evenly;
   font-size: 12px;
}
.con-size {
   width: 20px;
   text-align: center;
   background: #235f92;
   margin-right: 4px;
   color: white;
   height: 18px;
}
.warp-scan {
   width: 15px;
   height: 15px;
   border-radius: 50%;
   box-sizing: border-box;
   background: #ff3a56;
}
</style>]]

--interception concept, be careful
--Dear programmer:
--When I wrote this code, only God and I know how the next code works, don't try to edit it!

function getPipeD(system)
   if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
      local distanceS = ""

      local length1 = -700 * 200000
      local length2 = 800 * 200000

      local pos123 = pos1
      local pos234 = pos2

      local pos111 = zeroConvertToWorldCoordinates(pos123)
      local pos222 = zeroConvertToWorldCoordinates(pos234)

      local DestinationCenter = vectorLengthen(pos111, pos222, length1)
      local DepartureCenter = vectorLengthen(pos111, pos222, length2)

      local worldPos = vec3(construct.getWorldPosition())
      local pipe = (DestinationCenter - DepartureCenter):normalize()
      local r = (worldPos - DepartureCenter):dot(pipe) / pipe:dot(pipe)
      if r <= 0. then
         return (worldPos - DepartureCenter):len()
      elseif r >= (DestinationCenter - DepartureCenter):len() then
         return (worldPos - DestinationCenter):len()
      end
      local L = DepartureCenter + (r * pipe)
      local distance = (L - worldPos):len()
      if distance < 1000 then
         distanceS = "" .. string.format("%0.0f", distance) .. " m"
      elseif distance < 100000 then
         distanceS = "" .. string.format("%0.1f", distance / 1000) .. " km"
      else
         distanceS = "" .. string.format("%0.2f", distance / 200000) .. " su"
      end
      return distanceS
   end
end

function getPipeW(system)
   if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
      showMarker = false

      local length1 = -700 * 200000
      local length2 = 800 * 200000

      local pos123 = pos1
      local pos234 = pos2

      local pos111 = zeroConvertToWorldCoordinates(pos123)
      local pos222 = zeroConvertToWorldCoordinates(pos234)

      local DestinationCenter = vectorLengthen(pos111, pos222, length1)
      local DepartureCenter = vectorLengthen(pos111, pos222, length2)

      local worldPos = vec3(construct.getWorldPosition())
      local pipe = (DestinationCenter - DepartureCenter):normalize()
      local r = (worldPos - DepartureCenter):dot(pipe) / pipe:dot(pipe)
      if r <= 0. then
         return (worldPos - DepartureCenter):len()
      elseif r >= (DestinationCenter - DepartureCenter):len() then
         return (worldPos - DestinationCenter):len()
      end
      local L = DepartureCenter + (r * pipe)
      local PipeWaypoint = "::pos{0,0," .. math.floor(L.x) .. "," .. math.floor(L.y) .. "," .. math.floor(L.z) .. "}"
      system.print("Pipe center")
      system.setWaypoint(PipeWaypoint)
   end
end

function getPos4Vector(coordinate)
   return "::pos{0,0," .. vec3(coordinate).x .. "," .. vec3(coordinate).y .. "," .. vec3(coordinate).z .. "}"
end

-- делает вектор из двух координат
function makeVector(coordinateBegin, coordinateEnd)
   local x = vec3(coordinateEnd).x - vec3(coordinateBegin).x
   local y = vec3(coordinateEnd).y - vec3(coordinateBegin).y
   local z = vec3(coordinateEnd).z - vec3(coordinateBegin).z
   return vec3(x, y, z)
end

function UTC()
   local T = curTime - timeZone * 3600
   return T
end

function UTCscaner(system)
   local T = system.getArkTime() - timeZone * 3600
   return T
end

-- прибавляет к вектору, из двух координат, кусочек длины
-- и воозращает координату окончания вектора, с учетом прибалвенной длины
function vectorLengthen(coordinateBegin, coordinateEnd, deltaLen)
   local vector = makeVector(coordinateBegin, coordinateEnd)
   --длина вектора
   local lenVector = vec3(vector):len()
   -- новая длина вектора
   local newLen = lenVector + deltaLen
   local factor = newLen / lenVector
   --новый вектор с удлиненной координатой
   local newVector = vector * factor
   -- надо прибавить к первой начальной координате полученый вектор
   local x = vec3(coordinateBegin).x + vec3(newVector).x
   local y = vec3(coordinateBegin).y + vec3(newVector).y
   local z = vec3(coordinateBegin).z + vec3(newVector).z
   -- итого координата окончания удлиненного вектора
   local resultCoordinate = vec3(x, y, z)
   return resultCoordinate
end

function start(unit, system, text)
   pos1time = 0
   pos2time = 0
   tspeed = 0
   tspeed1 = 0
   mmode = true
   --lalt = false

   --system.createWidgetPanel("Target Vector")
   deg2rad = math.pi / 180
   rad2deg = 180 / math.pi
   ms2kmh = 3600 / 1000
   kmh2ms = 1000 / 3600

   showMarker = true

   if GHUD_export_mode == true then
      system.print("---------------")
      system.print("The export mode is enabled ALT+G")
   else
      system.print("---------------")
      system.print("The export mode is disabled ALT+G")
   end

   SU = 10
   calcTargetSpeed = targetSpeed / 3.6
   meterMarker = 0

   if
   databank_1.getStringValue(1) ~= "" and databank_1.getFloatValue(2) ~= 0 and databank_1.getStringValue(3) ~= "" and
   databank_1.getFloatValue(4) ~= 0
   then
      system.print("Coordinates from DB are used!")

      pos1 = databank_1.getStringValue(1)
      pos2 = databank_1.getStringValue(3)
      pos1time = databank_1.getFloatValue(2)
      pos2time = databank_1.getFloatValue(4)

      pos11 = zeroConvertToWorldCoordinates(pos1)

      pos22 = zeroConvertToWorldCoordinates(pos2)

      Pos1 = pos1
      Pos2 = pos2

      privMySignAngleR = 0
      privMySignAngleUp = 0
      privTargetSignAngleR = 0
      privTargetSignAngleUp = 0
      targetVector = vec3.new(0, 0, 0)
      myAngleR = 0
      myAngleUp = 0
      targetAngleR = 0
      targetAngleUp = 0

      targetVector =
      makeVector(zeroConvertToWorldCoordinates(Pos1), zeroConvertToWorldCoordinates(Pos2))
      targetTracker = true

      curTime = system.getUtcTime()

      --local dt1 = math.floor(UTC() - pos1time)
      --local dt2 = math.floor(UTC() - pos2time)
      local lasttime = math.floor(curTime - pos2time)
      local dist1 = pos11:dist(pos22)
      local timeroute = pos2time - pos1time
      tspeed = dist1 / timeroute
      tspeed1 = math.floor((dist1 / timeroute) * 3.6)
      meterMarker1 = (lasttime * tspeed) + tspeed * 4

      --length = SU*200000
      length1 = meterMarker1
      --lengthSU1=math.floor((length1/200000) * 100)/100
      lengthSU1 = string.format("%0.2f", ((length1 / 200000) * 100) / 100)

      meterMarker = (lasttime * calcTargetSpeed) + calcTargetSpeed * 4

      --length = SU*200000
      length = meterMarker
      --lengthSU=math.floor((length/200000) * 100)/100
      lengthSU = string.format("%0.2f", ((length / 200000) * 100) / 100)

      resultVector1 = vectorLengthen(pos11, pos22, length1)
      Waypoint1 = getPos4Vector(resultVector1)

      system.setWaypoint(Waypoint1)

      system.print("The target flew 20 km " .. lengthSU1 .. " su, speed " .. tspeed1 .. " km/h")

      unit.setTimer("marker", 1)
      --system.showScreen(1)
      unit.setTimer("vectorhud", 0.02)
   else
      --databank_1.clear()
      databank_1.setStringValue(1, "")
      databank_1.setFloatValue(2, 0)
      databank_1.setStringValue(3, "")
      databank_1.setFloatValue(4, 0)
      pos1 = 0
      pos2 = 0
      lasttime = 0
      pos1time = 0
      pos2time = 0
      meterMarker = 0
      meterMarker1 = 0

      Pos1 = 0
      Pos2 = 0
      privMySignAngleR = 0
      privMySignAngleUp = 0
      privTargetSignAngleR = 0
      privTargetSignAngleUp = 0
      targetVector = vec3.new(0, 0, 0)
      targetTracker = false
      myAngleR = 0
      myAngleUp = 0
      targetAngleR = 0
      targetAngleUp = 0

      system.print("Coordinates are missing set new or export")
   end
end

function inTEXT(unit, system, text)
   if pos1 ~= 0 and string.find(text, "::pos") and not string.find(text, "m::pos") and pos2 == 0 and GHUD_export_mode == false then
      --local lasttime = UTCscaner()

      pos2 = text
      databank_1.setStringValue(3, pos2)
      pos2time = math.floor(system.getUtcTime())
      databank_1.setFloatValue(4, pos2time)
      system.print(text .. " pos2 saved")

      pos11 = zeroConvertToWorldCoordinates(pos1)

      pos22 = zeroConvertToWorldCoordinates(pos2)

      local dist1 = pos11:dist(pos22)
      local timeroute = pos2time - pos1time
      tspeed = dist1 / timeroute
      tspeed1 = math.floor((dist1 / timeroute) * 3.6)
      Pos1 = pos1
      Pos2 = pos2

      targetVector =
      makeVector(zeroConvertToWorldCoordinates(Pos1), zeroConvertToWorldCoordinates(Pos2))
      targetTracker = true

      --length = SU*200000
      --meterMarker = meterMarker + 33333.32
      --meterMarker = meterMarker + calcTargetSpeed*4
      meterMarker1 = meterMarker1 + tspeed * 4
      length1 = meterMarker1

      resultVector1 = vectorLengthen(pos11, pos22, length1)
      Waypoint1 = getPos4Vector(resultVector1)

      system.setWaypoint(Waypoint1)
      meterMarker = meterMarker + calcTargetSpeed * 4
      length = meterMarker

      resultVector = vectorLengthen(pos11, pos22, length)
      Waypoint = getPos4Vector(resultVector)

      --system.setWaypoint(Waypoint)

      system.print("---------------")
      system.print("The coordinates are set manually!")
      posExport1 = databank_1.getStringValue(1)
      posExport2 = databank_1.getStringValue(3)
      timeExport1 = math.floor(databank_1.getFloatValue(2))
      timeExport2 = math.floor(databank_1.getFloatValue(4))

      system.print("The coordinates were exported to screen")

      screen_1.setCenteredText(posExport1 .. "/" .. timeExport1 .. "/" .. posExport2 .. "/" .. timeExport2)
      system.print("Target speed: " .. tspeed1 .. " km/h")
      unit.setTimer("marker", 1)
      --system.showScreen(1)
      unit.setTimer("vectorhud", 0.02)
   end

   if pos1 == 0 and string.find(text, "::pos") and not string.find(text, "m::pos") and GHUD_export_mode == false then
      pos1 = text
      databank_1.setStringValue(1, pos1)
      pos1time = math.floor(system.getUtcTime())
      databank_1.setFloatValue(2, pos1time)
      system.print(text .. " pos1 saved")
   end

   if text == "n" then
      pp1 = ''
      unit.stopTimer("marker")
      --databank_1.clear()
      showMarker = true
      databank_1.setStringValue(1, "")
      databank_1.setFloatValue(2, 0)
      databank_1.setStringValue(3, "")
      databank_1.setFloatValue(4, 0)
      pos1 = 0
      pos2 = 0
      lasttime = 0
      pos1time = 0
      pos2time = 0
      meterMarker = 0
      meterMarker1 = 0
      SU = 10

      --system.showScreen(0)
      unit.stopTimer("vectorhud")
      vectorHUD = ''
      Pos1 = 0
      Pos2 = 0
      privMySignAngleR = 0
      privMySignAngleUp = 0
      privTargetSignAngleR = 0
      privTargetSignAngleUp = 0
      targetVector = vec3.new(0, 0, 0)
      targetTracker = false
      myAngleR = 0
      myAngleUp = 0
      targetAngleR = 0
      targetAngleUp = 0

      system.print("---------------")
      system.print("Coordinates have been deleted, set new coordinates")
   end

   if GHUD_export_mode == true and string.find(text, "/") and not string.find(text, "/::pos") then
      unit.stopTimer("marker")
      --databank_1.clear()
      showMarker = true
      databank_1.setStringValue(1, "")
      databank_1.setFloatValue(2, 0)
      databank_1.setStringValue(3, "")
      databank_1.setFloatValue(4, 0)
      pos1 = 0
      pos2 = 0
      lasttime = 0
      pos1time = 0
      pos2time = 0
      meterMarker = 0
      meterMarker1 = 0
      SU = 10

      --system.showScreen(0)
      unit.stopTimer("vectorhud")
      vectorHUD = ''
      Pos1 = 0
      Pos2 = 0
      privMySignAngleR = 0
      privMySignAngleUp = 0
      privTargetSignAngleR = 0
      privTargetSignAngleUp = 0
      targetVector = vec3.new(0, 0, 0)
      targetTracker = false
      myAngleR = 0
      myAngleUp = 0
      targetAngleR = 0
      targetAngleUp = 0

      local start = 0
      local fin = string.find(text, "/", start) - 1
      pos1 = string.sub(text, start, fin)
      system.print(pos1)

      start = fin + 2
      fin = string.find(text, "/", start) - 1
      pos1time = tonumber(string.sub(text, start, fin))
      system.print(pos1time)

      start = fin + 2
      fin = string.find(text, "/", start) - 1
      pos2 = string.sub(text, start, fin)
      system.print(pos2)

      start = fin + 2
      fin = string.find(text, "/", start)
      pos2time = tonumber(string.sub(text, start, fin))
      system.print(pos2time)

      system.print("---------------")
      --system.print(pos1.."/"..pos2.."/"..oldTime)
      system.print("The coordinates have been loaded successfully!")
      databank_1.setStringValue(1, pos1)
      databank_1.setFloatValue(2, pos1time)
      databank_1.setStringValue(3, pos2)
      databank_1.setFloatValue(4, pos2time)

      pos11 = zeroConvertToWorldCoordinates(pos1)

      pos22 = zeroConvertToWorldCoordinates(pos2)

      Pos1 = pos1
      Pos2 = pos2

      targetVector =
      makeVector(zeroConvertToWorldCoordinates(Pos1), zeroConvertToWorldCoordinates(Pos2))
      targetTracker = true

      oldTime = tonumber(string.sub(text, start, fin))
      curTime = system.getUtcTime()

      --local dt1 = math.floor(UTC() - pos1time)
      --local dt2 = math.floor(UTC() - pos2time)
      local lasttime = math.floor(curTime - pos2time)
      local dist1 = pos11:dist(pos22)
      local timeroute = pos2time - pos1time
      tspeed = dist1 / timeroute
      tspeed1 = math.floor((dist1 / timeroute) * 3.6)
      meterMarker1 = (lasttime * tspeed) + tspeed * 4

      --length = SU*200000
      length1 = meterMarker1
      --lengthSU1=math.floor((length1/200000) * 100)/100
      lengthSU1 = string.format("%0.2f", ((length1 / 200000) * 100) / 100)

      meterMarker = (lasttime * calcTargetSpeed) + calcTargetSpeed * 4

      --length = SU*200000
      length = meterMarker
      --lengthSU=math.floor((length/200000) * 100)/100
      lengthSU = string.format("%0.2f", ((length / 200000) * 100) / 100)

      resultVector1 = vectorLengthen(pos11, pos22, length1)
      Waypoint1 = getPos4Vector(resultVector1)

      system.setWaypoint(Waypoint1)

      system.print("The target flew " .. lengthSU1 .. " su, speed " .. tspeed1 .. " km/h")

      system.setWaypoint(Waypoint1)
      unit.setTimer("marker", 1)
      --system.showScreen(1)
      unit.setTimer("vectorhud", 0.02)
   end
   if GHUD_export_mode == true and string.find(text, "/::pos") then
      unit.stopTimer("marker")
      --databank_1.clear()
      showMarker = true
      databank_1.setStringValue(1, "")
      databank_1.setFloatValue(2, 0)
      databank_1.setStringValue(3, "")
      databank_1.setFloatValue(4, 0)
      pos1 = 0
      pos2 = 0
      lasttime = 0
      pos1time = 0
      pos2time = 0
      meterMarker = 0
      meterMarker1 = 0
      SU = 10

      --system.showScreen(0)
      unit.stopTimer("vectorhud")
      vectorHUD = ''
      Pos1 = 0
      Pos2 = 0
      privMySignAngleR = 0
      privMySignAngleUp = 0
      privTargetSignAngleR = 0
      privTargetSignAngleUp = 0
      targetVector = vec3.new(0, 0, 0)
      targetTracker = false
      myAngleR = 0
      myAngleUp = 0
      targetAngleR = 0
      targetAngleUp = 0

      local start = 0
      local fin = string.find(text, "/", start) - 1
      pos1 = string.sub(text, start, fin)
      system.print(pos1)

      start = fin + 2
      fin = string.find(text, "/", start) - 1
      pos1time = tonumber(string.sub(text, start, fin))
      system.print(pos1time)

      start = fin + 2
      fin = string.find(text, "/", start) - 1
      pos2 = string.sub(text, start, fin)
      system.print(pos2)

      start = fin + 2
      fin = string.find(text, "/", start)
      pos2time = tonumber(string.sub(text, start, fin))
      system.print(pos2time)

      system.print("---------------")
      --system.print(pos1.."/"..pos2.."/"..oldTime)
      system.print("The coordinates have been loaded successfully!")
      databank_1.setStringValue(1, pos1)
      databank_1.setFloatValue(2, pos1time)
      databank_1.setStringValue(3, pos2)
      databank_1.setFloatValue(4, pos2time)

      pos11 = zeroConvertToWorldCoordinates(pos1)

      pos22 = zeroConvertToWorldCoordinates(pos2)

      Pos1 = pos1
      Pos2 = pos2

      targetVector =
      makeVector(zeroConvertToWorldCoordinates(Pos1), zeroConvertToWorldCoordinates(Pos2))
      targetTracker = true

      oldTime = tonumber(string.sub(text, start, fin))
      curTime = system.getUtcTime()

      --local dt1 = math.floor(UTC() - pos1time)
      --local dt2 = math.floor(UTC() - pos2time)
      local lasttime = math.floor(curTime - pos2time)
      local dist1 = pos11:dist(pos22)
      local timeroute = pos2time - pos1time
      tspeed = dist1 / timeroute
      tspeed1 = math.floor((dist1 / timeroute) * 3.6)
      meterMarker1 = (lasttime * tspeed) + tspeed * 4

      --length = SU*200000
      length1 = meterMarker1
      --lengthSU1=math.floor((length1/200000) * 100)/100
      lengthSU1 = string.format("%0.2f", ((length1 / 200000) * 100) / 100)

      meterMarker = (lasttime * calcTargetSpeed) + calcTargetSpeed * 4

      --length = SU*200000
      length = meterMarker
      --lengthSU=math.floor((length/200000) * 100)/100
      lengthSU = string.format("%0.2f", ((length / 200000) * 100) / 100)

      resultVector1 = vectorLengthen(pos11, pos22, length1)
      Waypoint1 = getPos4Vector(resultVector1)

      system.setWaypoint(Waypoint1)

      system.print("The target flew " .. lengthSU1 .. " su, speed " .. tspeed1 .. " km/h")

      system.setWaypoint(Waypoint1)
      unit.setTimer("marker", 1)
      --system.showScreen(1)
      unit.setTimer("vectorhud", 0.02)
   end
   if string.find(text, "mar") then
      if showMarker == true then
         showMarker = false
         system.print("Current target position - OFF")
      end
      local mar = tonumber((text):sub(4))
      if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
         local length2 = mar * 200000

         local pos123 = databank_1.getStringValue(1)
         local pos234 = databank_1.getStringValue(3)

         pos111 = zeroConvertToWorldCoordinates(pos123)
         pos222 = zeroConvertToWorldCoordinates(pos234)

         local resultVector2 = vectorLengthen(pos111, pos222, length2)
         local Waypoint3 = getPos4Vector(resultVector2)

         system.print(Waypoint3 .. " waypoint " .. mar .. " su")
      end
   end
end

function tickVector(unit, system, text)
   if targetTracker == true and targetVector.x ~= 0 and targetVector.y ~= 0 and targetVector.z ~= 0 then
      local pipeDist = getPipeD(system)
      local worldOrintUp = vec3(construct.getWorldOrientationUp()):normalize()
      local worldOrintRight = vec3(construct.getWorldOrientationRight()):normalize()
      local worldOrintForw = vec3(construct.getWorldOrientationForward()):normalize()
      local mySpeedVectorNorm = vec3(construct.getWorldVelocity()):normalize()
      local projectedWorldUp = mySpeedVectorNorm:project_on_plane(worldOrintUp)
      local projectedWorldR = mySpeedVectorNorm:project_on_plane(worldOrintRight)
      local projectedWorldF = mySpeedVectorNorm:project_on_plane(worldOrintForw)

      local myRotateDirR = projectedWorldF:cross(worldOrintUp):normalize()
      myAngleR = projectedWorldUp:angle_between(worldOrintForw)
      local mySignAngleR = utils.sign(myRotateDirR:angle_between(worldOrintForw) - math.pi / 2)
      if mySignAngleR ~= 0 then
         myAngleR = myAngleR * mySignAngleR
         privMySignAngleR = mySignAngleR
      else
         myAngleR = myAngleR * privMySignAngleR
      end

      local myRotateDirUp = projectedWorldR:cross(worldOrintUp):normalize()
      myAngleUp = projectedWorldR:angle_between(-worldOrintUp) - math.pi / 2
      local mySignAngleUp = utils.sign(myRotateDirUp:angle_between(worldOrintRight) - math.pi / 2)
      if mySignAngleUp ~= 0 then
         myAngleUp = myAngleUp * mySignAngleUp
         privMySignAngleUp = mySignAngleUp
      else
         myAngleUp = myAngleUp * privMySignAngleUp
      end
      local targetVectorNorm = targetVector:normalize()

      local targetProjectedWorldUp = targetVectorNorm:project_on_plane(worldOrintUp)
      local targetProjectedWorldR = targetVectorNorm:project_on_plane(worldOrintRight)
      local targetProjectedWorldF = targetVectorNorm:project_on_plane(worldOrintForw)
      local targetRotateDirR = targetProjectedWorldF:cross(worldOrintUp):normalize()
      targetAngleR = targetProjectedWorldUp:angle_between(worldOrintForw)
      local targetSignAngleR = utils.sign(targetRotateDirR:angle_between(worldOrintForw) - math.pi / 2)

      if targetSignAngleR ~= 0 then
         targetAngleR = targetAngleR * targetSignAngleR
         privTargetSignAngleR = targetSignAngleR
      else
         targetAngleR = targetAngleR * privTargetSignAngleR
      end
      local targetRotateDirUp = targetProjectedWorldR:cross(worldOrintUp):normalize()
      targetAngleUp = targetProjectedWorldR:angle_between(-worldOrintUp) - math.pi / 2
      local targetSignAngleUp = utils.sign(targetRotateDirUp:angle_between(worldOrintRight) - math.pi / 2)
      if targetSignAngleUp ~= 0 then
         targetAngleUp = targetAngleUp * targetSignAngleUp
         privTargetSignAngleUp = targetSignAngleUp
      else
         targetAngleUp = targetAngleUp * privTargetSignAngleUp
      end
      --system.print(targetAngleR*rad2deg.. [[ | ]].. targetAngleUp*rad2deg)
      targetVectorWidget =
      [[

      <div class='circle' style='position:absolute;top:50%;left:4%;'>
      <div style='transform: translate(0px, -26px);color:#ffb750;'>]] ..
      string.format("%0.1f", myAngleR * rad2deg) ..
      [[°</div>
      <div style='transform: translate(70px, -45px);color:#f54425;'>]] ..
      string.format("%0.1f", targetAngleR * rad2deg) ..
      [[°</div>
      <div style='transform: translate(20px, 80px);color:#f54425;'>Δ ]] ..
      string.format("%0.1f", myAngleR * rad2deg - targetAngleR * rad2deg) ..
      [[°</div>
      </div>
      <div class='vectorLine' style='top:54.65%;left:4%;background:#ffb750;z-index:30;transform:rotate(]] ..
      myAngleR * rad2deg + 90 ..
      [[deg)'></div>


      <div class='circle' style='position:absolute;top:50%;left:12%;'>
      <div style='transform: translate(0px, -26px);color:#ffb750;'>]] ..
      string.format("%0.1f", myAngleUp * rad2deg) ..
      [[°</div>
      <div style='transform: translate(70px, -45px);color:#f54425;'>]] ..
      string.format("%0.1f", targetAngleUp * rad2deg) ..
      [[°</div>
      <div style='transform: translate(20px, 80px);color:#f54425;'>Δ ]] ..
      string.format(
      "%0.1f",
      myAngleUp * rad2deg - targetAngleUp * rad2deg
      ) ..
      [[°</div>
      </div>
      <div class='vectorLine' style='top:54.65%;left:12%;background:#ffb750;z-index:30;transform:rotate(]] ..
      myAngleUp * rad2deg + 180 ..
      [[deg)'></div>


      <div class='vectorLine' style='top:54.65%;left:4%;background:#f54425;z-index:29;transform:rotate(]] ..
      targetAngleR * rad2deg + 90 ..
      [[deg)'></div>
      <div class='vectorLine' style='top:54.65%;left:12%;background:#f54425;z-index:29;transform:rotate(]] ..
      targetAngleUp * rad2deg + 180 ..
      [[deg)'></div>
      ]]

      local html1 =
      [[
      <style>
      .main4 {
         position: absolute;
         width: auto;
         padding: 5px;
         top: 98%;
         left: 50%;
         transform: translate(-50%, -50%);
         text-align: center;
         background-color: #142027;
         color: white;
         font-family: verdana;
         font-size: 1em;
         border-radius: 2vh;
         border: 4px solid #FFB12C;
         </style>
         <div class="main4">]] ..
         pipeDist .. [[</div>]]

         style =
         [[
         <style>
         .circle {
            height: 100px;
            width: 100px;
            background-color: #555;
            border-radius: 50%;
            opacity: 0.5;
            border: 4px solid white;
         }     .vectorLine{position:absolute;transform-origin: 100% 0%;width: 50px;height:0.15em;}</style>]]
         if (system.getUtcTime() - pos2time) > 4 then pp1 = '' end
         vectorHUD = style .. targetVectorWidget .. html1
      end
   end

   function tickMarker(unit, system, text)
      if databank_1.getStringValue(1) ~= "" or databank_1.getStringValue(3) ~= "" and databank_1.getFloatValue(2) == 0 or databank_1.getFloatValue(4) == 0 then

         pos11 = zeroConvertToWorldCoordinates(pos1)
         pos22 = zeroConvertToWorldCoordinates(pos2)

         meterMarker1 = meterMarker1 + tspeed
         length1 = meterMarker1
         --lengthSU1=math.floor((length1/200000) * 100)/100
         lengthSU1 = string.format("%0.2f", ((length1 / 200000) * 100) / 100)
         resultVector1 = vectorLengthen(pos11, pos22, length1)
         Waypoint1 = getPos4Vector(resultVector1)

         meterMarker = meterMarker + calcTargetSpeed
         length = meterMarker
         --lengthSU=math.floor((length/200000) * 100)/100
         lengthSU = string.format("%0.2f", ((length / 200000) * 100) / 100)
         resultVector = vectorLengthen(pos11, pos22, length)
         Waypoint = getPos4Vector(resultVector)

         if showMarker == true then
            if mmode == true then
               system.setWaypoint(Waypoint1,false)
               system.print("The target flew " .. lengthSU1 .. " su, speed " .. tspeed1 .. " km/h")
            else
               system.setWaypoint(Waypoint,false)
               system.print("The target flew " .. lengthSU .. " su, speed " .. targetSpeed .. " km/h")
            end
         end
      end
   end

   function altUP(unit, system, text)
      --if lalt == true then
      if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
         showMarker = false
         SU = SU + 2.5
         length = SU * 200000

         pos11 = zeroConvertToWorldCoordinates(pos1)
         pos22 = zeroConvertToWorldCoordinates(pos2)

         resultVector = vectorLengthen(pos11, pos22, length)
         Waypoint = getPos4Vector(resultVector)

         system.setWaypoint(Waypoint)

         system.print(Waypoint .. " waypoint " .. SU .. " su")
      end
      --end
   end

   function altDOWN(unit, system, text)
      --if lalt == true then
      if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
         showMarker = false
         SU = SU - 2.5
         length = SU * 200000

         pos11 = zeroConvertToWorldCoordinates(pos1)
         pos22 = zeroConvertToWorldCoordinates(pos2)

         resultVector = vectorLengthen(pos11, pos22, length)
         Waypoint = getPos4Vector(resultVector)

         system.setWaypoint(Waypoint)

         system.print(Waypoint .. " waypoint " .. SU .. " su")
      end
      --end
   end

   function altRIGHT(unit, system, text)
      --if lalt == true then
      if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
         showMarker = false
         SU = SU + 10
         length = SU * 200000

         pos11 = zeroConvertToWorldCoordinates(pos1)
         pos22 = zeroConvertToWorldCoordinates(pos2)

         resultVector = vectorLengthen(pos11, pos22, length)
         Waypoint = getPos4Vector(resultVector)

         system.setWaypoint(Waypoint)

         system.print(Waypoint .. " waypoint " .. SU .. " su")
      end
      --end
   end

   function altLEFT(unit, system, text)
      --if lalt == true then
      if databank_1.getStringValue(1) ~= "" and databank_1.getStringValue(3) ~= "" then
         showMarker = false
         SU = SU - 10
         length = SU * 200000

         pos11 = zeroConvertToWorldCoordinates(pos1)
         pos22 = zeroConvertToWorldCoordinates(pos2)

         resultVector = vectorLengthen(pos11, pos22, length)
         Waypoint = getPos4Vector(resultVector)

         system.setWaypoint(Waypoint)

         system.print(Waypoint .. " waypoint " .. SU .. " su")
      end
      --end
   end

   function GEAR(unit, system, text)
      posExport1 = databank_1.getStringValue(1)
      posExport2 = databank_1.getStringValue(3)
      --timeExport1 = tonumber(string.format('%0.0f',databank_1.getFloatValue(2)))
      --timeExport2 = tonumber(string.format('%0.0f',databank_1.getFloatValue(2)))
      timeExport1 = math.floor(databank_1.getFloatValue(2))
      timeExport2 = math.floor(databank_1.getFloatValue(4))

      system.print("The coordinates were exported to screen")

      screen_1.setCenteredText(posExport1 .. "/" .. timeExport1 .. "/" .. posExport2 .. "/" .. timeExport2)
   end
   function radarPos(system,radar)
      local id = activeRadar.getTargetId()
      if id ~= 0 then
         local dist = activeRadar.getConstructDistance(id)
         local forwvector = vec3(system.getCameraWorldForward())
         local worldpos = vec3(system.getCameraWorldPos())
         local p = (dist * forwvector + worldpos)

         if pos1 ~= 0 and pos2 == 0 then

            pos2 = '::pos{0,0,'..p.x..','..p.y..','..p.z..'}'
            databank_1.setStringValue(3, pos2)
            pos2time = math.floor(system.getUtcTime())
            databank_1.setFloatValue(4, pos2time)
            system.print(pos2 .." pos2 saved")

            pos11 = zeroConvertToWorldCoordinates(pos1)

            pos22 = zeroConvertToWorldCoordinates(pos2)

            local dist1 = pos11:dist(pos22)
            local timeroute = pos2time - pos1time
            tspeed = dist1 / timeroute
            tspeed1 = math.floor((dist1 / timeroute) * 3.6)
            Pos1 = pos1
            Pos2 = pos2

            targetVector =
            makeVector(zeroConvertToWorldCoordinates(Pos1), zeroConvertToWorldCoordinates(Pos2))
            targetTracker = true

            meterMarker1 = meterMarker1 + tspeed * 4
            length1 = meterMarker1

            resultVector1 = vectorLengthen(pos11, pos22, 6000000)
            Waypoint1 = getPos4Vector(resultVector1)

            system.setWaypoint(Waypoint1)
            meterMarker = meterMarker + calcTargetSpeed * 4
            length = meterMarker

            resultVector = vectorLengthen(pos11, pos22, length)
            Waypoint = getPos4Vector(resultVector)

            system.print("---------------")
            system.print("The coordinates are set manually!")
            posExport1 = databank_1.getStringValue(1)
            posExport2 = databank_1.getStringValue(3)
            timeExport1 = math.floor(databank_1.getFloatValue(2))
            timeExport2 = math.floor(databank_1.getFloatValue(4))

            system.print("The coordinates were exported to screen")

            screen_1.setCenteredText(posExport1 .. "/" .. timeExport1 .. "/" .. posExport2 .. "/" .. timeExport2)
            system.print("Target speed: " .. tspeed1 .. " km/h")
            pp1 = tspeed1..' km/h'
            --unit.setTimer("marker", 1)
            --system.showScreen(1)
            unit.setTimer("vectorhud", 0.02)
         else
            if pos1 == 0 then
               pos1 = '::pos{0,0,'..p.x..','..p.y..','..p.z..'}'
               pp1 = 'pos1 saved'
               databank_1.setStringValue(1, pos1)
               pos1time = math.floor(system.getUtcTime())
               databank_1.setFloatValue(2, pos1time)
               system.print(pos1 .. " pos1 saved")
            else
               if pos1 ~= 0 and pos2 ~= 0 then
                  unit.stopTimer("marker")
                  --databank_1.clear()
                  showMarker = true
                  databank_1.setStringValue(1, "")
                  databank_1.setFloatValue(2, 0)
                  databank_1.setStringValue(3, "")
                  databank_1.setFloatValue(4, 0)
                  pos1 = 0
                  pos2 = 0
                  lasttime = 0
                  pos1time = 0
                  pos2time = 0
                  meterMarker = 0
                  meterMarker1 = 0
                  SU = 10

                  --system.showScreen(0)
                  unit.stopTimer("vectorhud")
                  vectorHUD = ''
                  Pos1 = 0
                  Pos2 = 0
                  privMySignAngleR = 0
                  privMySignAngleUp = 0
                  privTargetSignAngleR = 0
                  privTargetSignAngleUp = 0
                  targetVector = vec3.new(0, 0, 0)
                  targetTracker = false
                  myAngleR = 0
                  myAngleUp = 0
                  targetAngleR = 0
                  targetAngleUp = 0

                  system.print("---------------")
                  unit.stopTimer("vectorhud")
                  pos1 = '::pos{0,0,'..p.x..','..p.y..','..p.z..'}'
                  pp1 = 'pos1 saved'
                  databank_1.setStringValue(1, pos1)
                  pos1time = math.floor(system.getUtcTime())
                  databank_1.setFloatValue(2, pos1time)
                  system.print(pos1 .. " pos1 saved")
               end
            end
         end
      end
   end

   start(unit,system,text)

   local opt1=system.getActionKeyName('option1')
   local opt2=system.getActionKeyName('option2')
   local opt3=system.getActionKeyName('option3')
   local opt4=system.getActionKeyName('option4')
   local opt5=system.getActionKeyName('option5')
   local opt6=system.getActionKeyName('option6')
   local opt7=system.getActionKeyName('option7')
   local opt8=system.getActionKeyName('option8')
   local opt9=system.getActionKeyName('option9')
   local shifttext=system.getActionKeyName('lshift')
   local geartext=system.getActionKeyName('gear')
   local alttext=system.getActionKeyName('lalt')
   local forwardtext=system.getActionKeyName('forward')
   local backwardtext=system.getActionKeyName('backward')
   local uptext=system.getActionKeyName('up')
   local downtext=system.getActionKeyName('down')
   local lefttext=system.getActionKeyName('left')
   local antigravtext = system.getActionKeyName('antigravity')
   local righttext=system.getActionKeyName('right')
   local yawlefttext=system.getActionKeyName('yawleft')
   local yawrighttext=system.getActionKeyName('yawright')
   local braketext1=system.getActionKeyName('brake')
   local lighttext=system.getActionKeyName('light')
   local boostertext=system.getActionKeyName('booster')

   helpHTML = [[
   <html>
   <style>
   html,
   body {
      background-image: linear-gradient(to right bottom, #1a0a13, #1e0f1a, #201223, #21162c, #1e1b36, #322448, #4a2b58, #653265, #a43b65, #d35551, #e78431, #dabb10);
   }
   .helperCenter {
      position: absolute;
      top: 50%;
      left: 50%;
      color: white;
      font-family: "Roboto Slab", serif;
      font-size: 1.5em;
      text-align: center;
      transform: translate(-50%, -50%);
   }
   ibold {
      font-weight: bold;
   }
   .topL {
      position: absolute;
      top: 1vh;
      left: 1vw;
      display: flex;
   }
   .bottomL {
      position: absolute;
      bottom: 1vh;
      left: 1vw;
      display: flex;
   }
   .helper1 {
      color: white;
      font-family: "Roboto Slab", serif;
      font-size: 1em;
   }
   .helper2 {
      margin-left: 2vw;
      color: white;
      font-family: "Roboto Slab", serif;
      font-size: 1em;
   }
   .helper3 {
      color: white;
      font-family: "Roboto Slab", serif;
      font-size: 1em;
   }
   .helper4 {
      margin-left: 2vw;
      color: white;
      font-family: "Roboto Slab", serif;
      font-size: 1em;
   }
   .hudversion {
      position: absolute;
      bottom: 0.15vh;
      color: white;
      right: 5.25vw;
      font-family: verdana;
      letter-spacing: 0.5px;
      font-size: 1.2em;
   }
   bdr {
      color: white;
      background-color: green;
      padding-right: 4px;
      padding-left: 4px;
      padding-top: 2px;
      padding-bottom: 2px;
      border-radius: 6px;
      border: 2.5px solid white;
   }
   luac {
      color: white;
      background-color: green;
      padding-right: 4px;
      padding-left: 4px;
      padding-top: 2px;
      padding-bottom: 2px;
      border: 2.5px solid white;
   }
   </style>
   <body>
   <div class="topL">
   <div class="helper1">
   <ibold>OTHER:</ibold>
   <br>
   <br>
   <bdr>]]..opt1..[[</bdr> : show/hide planets and planetary periscope<br>
   <br>
   <bdr>]]..opt2..[[</bdr> : set destination to planet #1 (closest pipe planets)<br>
   <br>
   <bdr>]]..opt3..[[</bdr> : set destination to closest pipe<br>
   <br>
   <bdr>]]..opt4..[[</bdr> : set destination to planet #2 (closest pipe planets)<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>]]..opt2..[[</bdr> : set destination to destination planet (LUA parameters)<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>]]..opt3..[[</bdr> : set destination to custom pipe Destination - Departure (LUA parameters)<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>]]..opt4..[[</bdr> : set destination to departure planet (LUA parameters)<br>
   <br>
   <bdr>]]..opt5..[[</bdr> : Helios system map<br>
   <br>
   <bdr>]]..geartext..[[</bdr> : set pos1/pos2 for radar selected target<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>↓↑</bdr> : move destination ±2.5 su<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>←→</bdr> : move destination ±10 su<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>]]..alttext..[[</bdr> : destination to closest target pipe<br>
   <br>
   <bdr>]]..alttext..[[</bdr> + <bdr>]]..geartext..[[</bdr> : on/off export mode<br>
   <br>
   <bdr>]]..boostertext..[[</bdr> : show/hide current target position (works only when manually setting coordinates or in export mode)<br>
   <br>
   <bdr>]]..geartext..[[</bdr> + <bdr>]]..opt4..[[</bdr> : switch target position between current speed or targetSpeed from LUA parameters<br>
   </div>
   <div class="helper2">
   <ibold>RADAR WIDGET:</ibold>
   <br>
   <br>
   <bdr>]]..alttext..[[</bdr> + <bdr>]]..downtext..[[</bdr> : switch between friends/enemies<br>
   <br>
   <bdr>]]..alttext..[[</bdr> + <bdr>]]..uptext..[[</bdr> : construct size filter<br>
   <br>
   <bdr>]]..shifttext..[[</bdr> + <bdr>]]..opt1..[[</bdr> : add/remove selected target from whitelist<br>
   </div>
   </div>
   <div class="bottomL">
   <div class="helper3">
   <ibold>OTHER LUA COMMANDS:</ibold>
   <br>
   <br>
   <br>
   <luac>m::pos{}</luac> : get info about position, safe position to dababank, add position to Helios map and planetary periscope<br>
   <br>
   <luac>n</luac> : reset pos1/pos2<br>
   <br>
   <luac>mar345</luac> : get position in LUA chat, where 345 is SU ahead of the target<br>
   <br>
   <luac>export</luac> : export coordinates to screen in format - pos1/time1/pos2/time2<br>
   </div>
   <div class="helper4">
   <ibold>RADAR WIDGET LUA COMMANDS:</ibold>
   <br>
   <br>
   <luac>f345</luac> : focus mode where 345 is target ID<br>
   <br>
   <luac>f</luac> : reset focus mode<br>
   <br>
   <luac>addall</luac> : add all radar targets to whitelist databank<br>
   <br>
   <luac>clear</luac> : clear all whitelist databank<br>
   <br>
   <luac>friends</luac> : show/hide AR allies marks<br>
   <br>
   <luac>safe</luac> : on/off radar notifications in safe zone<br>
   </div>
   </div>
   <div class="helperCenter">GEMINI FOUNDATION<br><br>Gunner Module Controls</div>
   <div class="hudversion">GHUD v]]..HUD_version..[[</div>
   </body>
   </html>]]

   system.print('GHUD Gunner module v'..HUD_version)
   system.print(''..geartext..' + ←: helper')

   system.showScreen(1)
   main1 = coroutine.create(main)
   main2 = coroutine.create(closestPipe)
   unit.setTimer("hud", 0.016)
   unit.setTimer("logger", 1.5)

   if collectgarbages == true then
      unit.setTimer("cleaner",30)
   end