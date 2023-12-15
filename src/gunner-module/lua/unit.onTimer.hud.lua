radarIDs = activeRadar.getConstructIds()
idN = #radarIDs

mRadar:onUpdate()

if coroutine.status(main1) ~= "dead" and coroutine.status(main1) == "suspended" then
   coroutine.resume(main1)
   --coroutine.xpcall(main1) -- resume debug coroutine
end

if coroutine.status(main2) ~= "dead" and coroutine.status(main2) == "suspended" then
   coroutine.resume(main2)
   --coroutine.xpcall(main2) -- resume debug coroutine
end

if corpos == true then
   if coroutine.status(ck) ~= "dead" and coroutine.status(ck) == "suspended" then
      coroutine.resume(ck, asteroidcoord)
   end
end

local dx = system.getMouseDeltaX() * 4
local dy = system.getMouseDeltaY() * 4

local sight = ''
local wsight1 = ''
local wsight2 = ''

if wslot_1 ~= nil then
   local wdata1 = wslot_1.getWidgetData()
   pr1 = tonumber(wdata1:match('"hitProbability":(.-),'))math.floor(pr1*100)
end

if wslot_2 ~= nil then
   local wdata2 = wslot_2.getWidgetData()
   pr2 = tonumber(wdata2:match('"hitProbability":(.-),'))
end

local shipPos = vec3(construct.getWorldPosition())
local sp1 = construct.getWorldVelocity()
local speed = math.floor(vec3(sp1):len() * 3.6)
local id = activeRadar.getTargetId()
if id ~= 0 then
   local mass = activeRadar.getConstructMass(id)
   local tcolor = 'rgba(0, 191, 255, 0)'
   local typeS = activeRadar.getConstructKind(id)
   if typeS == 5 then
      tcolor = 'rgb(0, 191, 255)'
   else
      tcolor = '#c603fc'
   end
   if activeRadar.isConstructAbandoned(id) == 1 and typeS == 5 then
      tcolor = 'rgba(255, 255, 255, 0.25)'
   end
   local topSpeed = '??'
   local sdist = ""
   local dist = math.floor(activeRadar.getConstructDistance(id))
   distT = dist
   local name = string.sub((""..activeRadar.getConstructName(id)..""),1,6)
   local size = activeRadar.getConstructCoreSize(id)
   local speed = '??'
   local damage = '0.0'
   if totalDamage[id] ~= nil then --target damage calculation concept
      damage = string.format('%0.1f',totalDamage[id].damage * 0.000001)
   end
   if activeRadar.isConstructIdentified(id) == 1 and typeS == 5 then
      if typeS == 5 then
         topSpeed = math.floor(clamp((50000/3.6-10713*(mass-10000)/(853926+(mass-10000)))*3.6,20000,50000))
      end
      speed = activeRadar.getConstructSpeed(id)
      speed = math.floor(speed * 3.6)
      speedT = speed
   end
   local pos1 = shipPos + dist * vec3(construct.getWorldOrientationForward())
   local point1 = library.getPointOnScreen({pos1.x,pos1.y,pos1.z})
   if dist >= 100000 then
      dist = string.format('%0.2f', dist/200000)
      sdist = 'SU'
   elseif dist >= 1000 and dist < 100000 then
      dist = string.format('%0.1f', dist/1000)
      sdist = 'KM'
   else
      dist = string.format('%0.0f', dist)
      sdist = 'M'
   end
   local sight1 = [[
   .sight1 {
      position: absolute;
      opacity: 0;
      left: 0;
      top: 0;
   }
   ]]
   if wslot_1 ~= nil then
      wsight1 = [[<text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 22px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="312">]]..GHUD_1_chance_weapon_slot..[[</text>
      <rect x="280" y="322" width="340" height="29.245" rx="15" style="fill: url(#hit1_gradient);"></rect>
      <text style="fill: yellow; font-family: verdana; font-size: 25px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="345.267">]]..math.floor(pr1*100)..[[</text>]]
   end
   if GHUD_hit_chance_2_weapons == true and wslot_2 ~= nil then
      wsight2 = [[<text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 22px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="378.051">]]..GHUD_2_chance_weapon_slot..[[</text>
      <rect x="280" y="389" width="340" height="29.245" rx="15" style="fill: url(#hit2_gradient);"></rect>
      <text style="fill: yellow; font-family: verdana; font-size: 25px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="413.267">]]..math.floor(pr2*100)..[[</text>]]
   end
   if point1[3] > 0 then --visible zone
      local x2 = (screenWidth*point1[1]) - dx - GHUD_AR_sight_size/2
      local y2 = (screenHeight*point1[2]) - dy - GHUD_AR_sight_size/2
      sight1 = [[
      .sight1 {
         position: absolute;
         width: ]]..GHUD_AR_sight_size..[[px;
         height: ]]..GHUD_AR_sight_size..[[px;
         left: ]]..x2..[[px;
         top: ]]..y2..[[px;
      }]]
   end
   sight = [[
   <style>
   ]]..sight1..[[
   .sight2 {
      position: absolute;
      width: ]]..GHUD_selected_target_panel_size..[[vh;
      left: 50%;
      top: ]]..GHUD_selected_target_Y..[[vh;
      transform: translate(-50%, -50%);
   }
   </style>
   <div class="sight1">
   <?xml version="1.0" encoding="utf-8"?>
   <svg viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xmlns="http://www.w3.org/2000/svg">
   <path style="fill: ]]..GHUD_AR_sight_color..[[;" d="M 231.231 440.732 C 230.524 444.711 227.058 447.508 223.154 447.508 C 222.675 447.508 222.191 447.465 221.705 447.379 C 141.949 433.179 78.822 370.052 64.621 290.296 C 63.825 285.83 66.802 281.564 71.268 280.769 C 75.729 279.975 80 282.95 80.794 287.416 C 93.793 360.422 151.578 418.207 224.583 431.205 C 229.051 432.001 232.026 436.266 231.231 440.732 Z M 71.268 231.231 C 71.754 231.318 72.239 231.36 72.717 231.36 C 76.621 231.36 80.087 228.563 80.794 224.584 C 93.793 151.578 151.578 93.793 224.583 80.795 C 229.049 80 232.026 75.734 231.23 71.269 C 230.435 66.802 226.166 63.829 221.704 64.622 C 141.948 78.822 78.821 141.949 64.62 221.705 C 63.825 226.171 66.802 230.436 71.268 231.231 Z M 440.732 280.769 C 436.273 279.976 432.001 282.951 431.206 287.416 C 418.207 360.422 360.422 418.208 287.417 431.206 C 282.951 432.001 279.974 436.267 280.77 440.733 C 281.477 444.712 284.942 447.509 288.847 447.509 C 289.326 447.509 289.81 447.466 290.296 447.38 C 370.052 433.18 433.179 370.052 447.38 290.296 C 448.175 285.83 445.198 281.564 440.732 280.769 Z M 387.492 112.892 L 399.109 124.508 C 423.609 151.152 440.78 184.629 447.38 221.703 C 448.176 226.169 445.199 230.435 440.733 231.23 C 436.27 232.026 432.001 229.049 431.207 224.583 C 425.206 190.887 409.664 160.43 387.49 136.126 L 375.873 124.51 C 351.57 102.336 321.113 86.793 287.417 80.793 C 282.951 79.998 279.974 75.732 280.77 71.266 C 281.565 66.8 285.839 63.825 290.296 64.619 C 327.37 71.22 360.848 88.39 387.492 112.892 Z" transform="matrix(0.707107, 0.707107, -0.707107, 0.707107, 255.999945, -106.038815)"></path>
   </svg></div>
   <div class="sight2">
   <svg viewBox="0 0 900 500" xmlns="http://www.w3.org/2000/svg">
   <defs>
   <linearGradient id="hit1_gradient" x1="0%" x2="100%">
   <stop stop-color="#07e88e" offset="]]..pr1..[[" />
   <stop stop-color="rgb(255, 255, 255)" stop-opacity="0.25" offset="0" />
   </linearGradient>
   <linearGradient id="hit2_gradient" x1="0%" x2="100%">
   <stop stop-color="#07e88e" offset="]]..pr2..[[" />
   <stop stop-color="rgb(255, 255, 255)" stop-opacity="0.25" offset="0" />
   </linearGradient>
   </defs>
   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="195.471" y="203.183"><tspan x="450" y="263.186" style="font-size: 26px; word-spacing: 0px;">]]..damage..[[ M</tspan></text>
   <text style="fill: ]]..tcolor..[[; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: end;" x="284.824" y="184.186">[]]..size..[[] ]]..tostring(id):sub(-3)..[[ ]]..name..[[</text>
   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="450" y="141.186">SPEED</text>
   <text style="fill: ]]..newcolor..[[; font-family: verdana; font-size: 26px; font-weight: 700; text-anchor: middle;" x="175.339" y="105.183"><tspan x="512.868" y="141.186" style="font-size: 26px; word-spacing: 0px;">]]..znak..[[</tspan></text>
   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px;" x="668" y="224.186">MAX SPEED</text>
   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="174.41" y="224.186">DPS (WIP)</text>
   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="752.841" y="263.186">]]..topSpeed..[[</text>
   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" y="184.186" x="450">]]..speed..[[</text>
   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="300" y1="115" x2="300" y2="275"></line>
   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="600" y1="115" x2="600" y2="275"></line>
   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="450" y1="-270" x2="450" y2="580" transform="matrix(0.000001, 1, -1, 0.000001, 604.99955, -295.000155)"></line>
   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: end;" x="227.808" y="141.186">TARGET</text>
   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="450" y1="-230" x2="450" y2="620" transform="matrix(0.000001, 1, -1, 0.000001, 644.99955, -255.000195)"></line>
   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px;" x="670" y="141.186">DISTANCE</text>
   <text style="fill: ]]..newcolor2..[[; font-family: verdana; font-size: 26px; font-weight: 700; text-anchor: start;" x="465.532" y="106.864" transform="matrix(1, 0, 0, 1, 20.938997, -1.681)"><tspan x="803.061" y="142.867" style="font-size: 26px; word-spacing: 0px;">]]..znak2..[[<tspan x="803.0609741210938" dy="1em">​</tspan></tspan></text>
   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="450" y1="-190" x2="450" y2="660" transform="matrix(0.000001, 1, -1, 0.000001, 684.99955, -215.000235)"></line>
   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" y="184.186" x="751.656">]]..dist..[[ ]]..sdist..[[</text>
   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="450" y="224.186">DAMAGE</text>
   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" y="263.186" x="171.092">OUT - INC</text>
   ]]..wsight1..[[
   ]]..wsight2..[[
   </svg></div>]]
else
   local pos1 = shipPos + 400000 * vec3(construct.getWorldOrientationForward())
   local point1 = library.getPointOnScreen({pos1.x,pos1.y,pos1.z})
   --local pos1 = ConvertLocalToWorld(0,distance,0)
   --local point1 = library.getPointOnScreen({pos1.x,pos1.y,pos1.z})
   if point1[3] > 0 then --visible zone
      local x2 = (screenWidth*point1[1]) - dx - GHUD_AR_sight_size/2
      local y2 = (screenHeight*point1[2]) - dy - GHUD_AR_sight_size/2
      sight = [[
      <style>
      .sight1 {
         position: absolute;
         width: ]]..GHUD_AR_sight_size..[[px;
         height: ]]..GHUD_AR_sight_size..[[px;
         left: ]]..x2..[[px;
         top: ]]..y2..[[px;
      }
      </style>
      <div class="sight1">
      <?xml version="1.0" encoding="utf-8"?>
      <svg viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xmlns="http://www.w3.org/2000/svg">
      <path style="fill: ]]..GHUD_AR_sight_color..[[;" d="M 231.231 440.732 C 230.524 444.711 227.058 447.508 223.154 447.508 C 222.675 447.508 222.191 447.465 221.705 447.379 C 141.949 433.179 78.822 370.052 64.621 290.296 C 63.825 285.83 66.802 281.564 71.268 280.769 C 75.729 279.975 80 282.95 80.794 287.416 C 93.793 360.422 151.578 418.207 224.583 431.205 C 229.051 432.001 232.026 436.266 231.231 440.732 Z M 71.268 231.231 C 71.754 231.318 72.239 231.36 72.717 231.36 C 76.621 231.36 80.087 228.563 80.794 224.584 C 93.793 151.578 151.578 93.793 224.583 80.795 C 229.049 80 232.026 75.734 231.23 71.269 C 230.435 66.802 226.166 63.829 221.704 64.622 C 141.948 78.822 78.821 141.949 64.62 221.705 C 63.825 226.171 66.802 230.436 71.268 231.231 Z M 440.732 280.769 C 436.273 279.976 432.001 282.951 431.206 287.416 C 418.207 360.422 360.422 418.208 287.417 431.206 C 282.951 432.001 279.974 436.267 280.77 440.733 C 281.477 444.712 284.942 447.509 288.847 447.509 C 289.326 447.509 289.81 447.466 290.296 447.38 C 370.052 433.18 433.179 370.052 447.38 290.296 C 448.175 285.83 445.198 281.564 440.732 280.769 Z M 387.492 112.892 L 399.109 124.508 C 423.609 151.152 440.78 184.629 447.38 221.703 C 448.176 226.169 445.199 230.435 440.733 231.23 C 436.27 232.026 432.001 229.049 431.207 224.583 C 425.206 190.887 409.664 160.43 387.49 136.126 L 375.873 124.51 C 351.57 102.336 321.113 86.793 287.417 80.793 C 282.951 79.998 279.974 75.732 280.77 71.266 C 281.565 66.8 285.839 63.825 290.296 64.619 C 327.37 71.22 360.848 88.39 387.492 112.892 Z" transform="matrix(0.707107, 0.707107, -0.707107, 0.707107, 255.999945, -106.038815)"></path>
      </svg></div>]]
   end
end

local AR_allies = ''
if GHUD_show_AR_allies_marks == true then
   for k,v in pairs(radarIDs) do --AR marks
      if activeRadar.hasMatchingTransponder(v) == 1 then
         local pos = activeRadar.getConstructWorldPos(v)
         local fID = ''
         if friendsData[v] ~= nil then
            fID = friendsData[v].tag
         end
         local point = library.getPointOnScreen({pos[1],pos[2],pos[3]})
         if point[3] > 0 then --visible zone
            local x = (screenWidth*point[1]) - dx - GHUD_AR_allies_border_size/2
            local y = (screenHeight*point[2]) - dy - GHUD_AR_allies_border_size/2
            AR_allies = AR_allies .. [[
            <style>
            .id]]..v..[[ {
               position: absolute;
               width: ]]..GHUD_AR_allies_border_size..[[px;
               height: ]]..GHUD_AR_allies_border_size..[[px;
               left: ]]..x..[[px;
               top: ]]..y..[[px;
            }
            </style>
            <div class="id]]..v..[["><?xml version="1.0" encoding="utf-8"?>
            <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
            <rect x="235" y="235" width="30" height="30" style="fill: rgba(0,0,0,0); stroke: ]]..GHUD_AR_allies_border_color..[[; stroke-width: 2"/>
            <text style="fill: ]]..GHUD_AR_allies_font_color..[[; font-family: Arial, sans-serif; font-size: 28px; font-weight: 700; text-anchor: middle;" transform="matrix(0.609174, 0, 0, 0.609176, 250.000005, 229)">]].. tostring(v):sub(-3) .. [[</text>
            <text style="fill: ]]..GHUD_AR_allies_font_color..[[; font-family: Arial, sans-serif; font-size: 28px; font-weight: 700; text-anchor: middle;" transform="matrix(0.609174, 0, 0, 0.609176, 250.000005, 214)">]]..fID..[[</text>
            </svg></div>]]
         end
      end
   end
end

local AR_planets = ''
local AR_asteroid = ''
local AR_pvpzone = ''
local AR_safezone = ''
local Indicator = ''
local ind = shipPos + 400000 * vec3(sp1)
local pointF = library.getPointOnScreen({ind.x,ind.y,ind.z})
if pointF[3] > 0 and speed > 15 then --visible zone
   local x = (screenWidth*pointF[1]) - dx - GHUD_flight_indicator_size/2
   local y = (screenHeight*pointF[2]) - dy - GHUD_flight_indicator_size/2
   Indicator = [[
   <style>
   .flightIndicator {
      position: absolute;
      width: ]]..GHUD_flight_indicator_size..[[px;
      height: ]]..GHUD_flight_indicator_size..[[px;
      left: ]]..x..[[px;
      top: ]]..y..[[px;
   }
   </style>
   <div class="flightIndicator">
   <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
   <line style="fill: ]]..GHUD_flight_indicator_color..[[; stroke: ]]..GHUD_flight_indicator_color..[[; stroke-width: 20px;" x1="10" y1="100" x2="190" y2="100" transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -41.421356, 100)"></line>
   <line style="fill: ]]..GHUD_flight_indicator_color..[[; stroke: ]]..GHUD_flight_indicator_color..[[; stroke-width: 20px;" x1="10" y1="100" x2="190" y2="100" transform="matrix(0.707107, 0.707107, -0.707107, 0.707107, 100, -41.421356)"></line>
   </svg></div>]]
end

local safeStatus, safeVector, zoneDist, distStr = safeZone()

if szsafe == true then
   safetext=''..safeStatus..' <green1>'..zoneDist..' '..distStr..'</green1>'
   local point1 = library.getPointOnScreen({safeVector.x,safeVector.y,safeVector.z})
   if point1[3] > 0 then --visible zone
      local x2 = (screenWidth*point1[1]) - dx - 50
      local y2 = (screenHeight*point1[2]) - dy - 50
      AR_pvpzone = [[
      <style>
      .pvpzoneAR {
         position: absolute;
         width: 100px;
         height: 100px;
         left: ]]..x2..[[px;
         top: ]]..y2..[[px;
      }
      </style>
      <div class="pvpzoneAR"><?xml version="1.0" encoding="utf-8"?>
      <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
      <ellipse style="fill: rgba(0, 0, 0, 0); stroke: #fc033d; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
      <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">PvP ZONE</text>
      <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..zoneDist..[[</text>
      <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..distStr..[[</text>
      </svg></div>]]
   end
else
   safetext=''..safeStatus..' <red1>'..zoneDist..' '..distStr..'</red1>'
   local point1 = library.getPointOnScreen({safeVector.x,safeVector.y,safeVector.z})
   if point1[3] > 0 then --visible zone
      local x2 = (screenWidth*point1[1]) - dx - 50
      local y2 = (screenHeight*point1[2]) - dy - 50
      AR_safezone = [[
      <style>
      .safezoneAR {
         position: absolute;
         width: 100px;
         height: 100px;
         left: ]]..x2..[[px;
         top: ]]..y2..[[px;
      }
      </style>
      <div class="safezoneAR"><?xml version="1.0" encoding="utf-8"?>
      <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
      <ellipse style="fill: rgba(0, 0, 0, 0); stroke: #07e88e; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
      <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">SAFE ZONE</text>
      <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..zoneDist..[[</text>
      <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..distStr..[[</text>
      </svg></div>]]
   end
end

if asteroidcoord[1] ~= 0 then
   local point1 = library.getPointOnScreen({asteroidcoord.x,asteroidcoord.y,asteroidcoord.z})
   if point1[3] > 0 then --visible zone
      local dist = vec3(shipPos - asteroidcoord):len()
      local sdist = ''
      if dist >= 100000 then
         dist = string.format('%0.2f', dist/200000)
         sdist = 'SU'
      elseif dist >= 1000 and dist < 100000 then
         dist = string.format('%0.1f', dist/1000)
         sdist = 'KM'
      else
         dist = string.format('%0.0f', dist)
         sdist = 'M'
      end
      local x = (screenWidth*point1[1]) - dx - 50
      local y = (screenHeight*point1[2]) - dy - 50
      AR_asteroid = [[
      <style>
      .marker]]..GHUD_marker_name..[[ {
         position: absolute;
         width: 100px;
         height: 100px;
         left: ]]..x..[[px;
         top: ]]..y..[[px;
      }
      </style>
      <div class="marker]]..GHUD_marker_name..[["><?xml version="1.0" encoding="utf-8"?>
      <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
      <ellipse style="fill: rgba(0, 0, 0, 0); stroke: ]]..GHUD_marker_color..[[; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
      <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">]]..GHUD_marker_name..[[</text>
      <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..dist..[[</text>
      <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..sdist..[[</text>
      </svg></div>]]
   end
end

if DisplayRadar==true then
   local x,y,z = table.unpack(construct.getWorldOrientationForward())
   local xoc = math.floor(math.atan(x, y)*180/math.pi+180)
   local yoc = math.floor(math.atan(y, z)*180/math.pi+180)
   local XY = [[
   <style>
   .XY {
      position: absolute;
      left: 2%;
      top: 23%;
      color: #FFB12C;
      font-size:18px;
      font-family: verdana;
      font-weight: bold;
      text-align: left;
   }</style>
   <div class="XY">X: ]]..xoc..[[<br>Y: ]]..yoc..[[</div>]]
   message=[[
   <style>
   .svg {
      position:absolute;
      left: 0;
      top: 6vh;
      height: 100vh;
      width: 100vw;
      .wptxt {
         fill: white;
         font-size: ]].. screenHeight/80 ..[[;
         font-family: sans-serif;
         text-anchor: end;
         .shiptxt {
            fill: white;
            font-size: ]].. screenHeight/80 ..[[;
            font-family: sans-serif;
            text-anchor: start;
         }
         </style>]]
         message=message..[[<svg class="svg">]]
         svgradar=""
         RadarX=screenWidth*1/7
         RadarY=screenWidth*1/7
         RadarR=screenWidth*1/7

         svgradar=svgradar..string.format([[<line x1="%f" y1="%f" x2="%f" y2="%f" stroke-width="2" stroke="black" />]],RadarX,RadarY-RadarR,RadarX,RadarY+RadarR)
         svgradar=svgradar..string.format([[<line x1="%f" y1="%f" x2="%f" y2="%f" stroke-width="2" stroke="black" />]],RadarX-RadarR,RadarY,RadarX+RadarR,RadarY)
         svgradar=svgradar..string.format([[<circle  cx="%f" cy="%f" r="%f" stroke="black" fill="transparent" stroke-width="5"/>]],
         RadarX,RadarY,RadarR/2)
         svgradar=svgradar..string.format([[<circle  cx="%f" cy="%f" r="%f" stroke="black" fill-opacity="0.2" fill="green" stroke-width="5"/>]],
         RadarX,RadarY,RadarR)

         for BodyId in pairs(atlas[0]) do
            local planet=atlas[0][BodyId]
            if ((planet.type[1] == 'Planet' or planet.isSanctuary == true) and planet.name[1] ~= planetzone) then
               drawonradar(vec3(planet.center),planet.name[1])
               local point1 = library.getPointOnScreen({planet.center[1],planet.center[2],planet.center[3]})
               if point1[3] > 0 then --visible zone
                  local dist = vec3(shipPos - vec3(planet.center)):len()
                  local sdist = ''
                  if dist >= 100000 then
                     dist = string.format('%0.2f', dist/200000)
                     sdist = 'SU'
                  elseif dist >= 1000 and dist < 100000 then
                     dist = string.format('%0.1f', dist/1000)
                     sdist = 'KM'
                  else
                     dist = string.format('%0.0f', dist)
                     sdist = 'M'
                  end
                  local x2 = (screenWidth*point1[1]) - dx - 50
                  local y2 = (screenHeight*point1[2]) - dy - 50
                  AR_planets = AR_planets .. [[
                  <style>
                  .pl]]..planet.name[1]..[[ {
                     position: absolute;
                     width: 100px;
                     height: 100px;
                     left: ]]..x2..[[px;
                     top: ]]..y2..[[px;
                  }
                  </style>
                  <div class="pl]]..planet.name[1]..[["><?xml version="1.0" encoding="utf-8"?>
                  <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
                  <ellipse style="fill: rgba(0, 0, 0, 0); stroke: #FFB12C; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
                  <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">]]..planet.name[1]..[[</text>
                  <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..dist..[[</text>
                  <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..sdist..[[</text>
                  </svg></div>]]
               end
            end
         end
         drawonradar(safeVector,safeStatus)
         if szsafe == true then
            drawonradar(safeWorldPos,'Central SZ')
         end
         if asteroidcoord[1] ~= 0 then
            drawonradar(asteroidcoord,""..GHUD_marker_name.."")
         end
         message=message..svgradar..XY
         message=message.."</svg>"
      else
         message = ''
      end

      --hit/miss animations, radar contacts animations
      local hitsHUD = ''
      local missesHUD = ''
      local targetsHUD = ''

      if GHUD_show_hits == true then
         for k,v in pairs(lastHitTime) do
            if lastHitTime[k] ~= nil then
               lastHitTime[k].time = lastHitTime[k].time + 0.025
               lastHitTime[k].hitOpacity = lastHitTime[k].hitOpacity - 0.015
               local top = GHUD_hits_misses_Y - lastHitTime[k].time*3.25
               local right = GHUD_hit_X + lastHitTime[k].time*2
               if lastHitTime[k].hitOpacity <= 0 then lastHitTime[k].hitOpacity = 0 end
               local hit = [[
               <style>
               .hit]]..k..[[ {
                  top: ]]..top..[[vh;
                  left: ]]..right..[[%;
                  position: absolute;
                  text-alight: center;
                  font-size: 40px;
                  font-family: verdana;
                  font-style: normal;
                  font-weight: bold;
                  color: #FFB12C;
                  opacity: ]]..lastHitTime[k].hitOpacity..[[;
                  transform: translate(-50%, -50%);
               }
               </style>
               <div class="hit]]..k..[[">]]..lastHitTime[k].damage..[[</div>]]
               hits[k] = {html = hit}

               if lastHitTime[k].time >= 2 then
                  hits[k] = {html = ''}
                  if lastHitTime[k].anims == hitAnimations then
                     hits[k] = nil
                     hits = {}
                     hitAnimations = 0
                     lastHitTime = {}
                  end
               end
            end
         end
      end

      if GHUD_show_misses == true then
         for k,v in pairs(lastMissTime) do
            if lastMissTime[k] ~= nil then
               lastMissTime[k].time = lastMissTime[k].time + 0.025
               lastMissTime[k].missOpacity = lastMissTime[k].missOpacity - 0.015
               local top = GHUD_hits_misses_Y - lastMissTime[k].time*3.25
               local left = GHUD_miss_X - lastMissTime[k].time*2
               if lastMissTime[k].missOpacity <= 0 then lastMissTime[k].missOpacity = 0 end
               local miss = [[
               <style>
               .miss]]..k..[[ {
                  top: ]]..top..[[vh;
                  left: ]]..left..[[%;
                  position: absolute;
                  text-alight: center;
                  font-size: 40px;
                  font-family: verdana;
                  font-style: normal;
                  font-weight: bold;
                  color: #fc033d;
                  opacity: ]]..lastMissTime[k].missOpacity..[[;
                  transform: translate(-50%, -50%);
               }
               </style>
               <div class="miss]]..k..[[">MISS</div>]]
               misses[k] = {html = miss}

               if lastMissTime[k].time >= 2 then
                  misses[k] = {html = ''}
                  if lastMissTime[k].anims == missAnimations then
                     misses[k] = nil
                     misses = {}
                     missAnimations = 0
                     lastMissTime = {}
                  end
               end
            end
         end
      end

      if GHUD_show_hits == true then
         for k,v in pairs(hits) do
            if hits[k] ~= nil then
               hitsHUD = hitsHUD .. hits[k].html
            end
         end
      end

      if GHUD_show_misses == true then
         for k,v in pairs(misses) do
            if misses[k] ~= nil then
               missesHUD = missesHUD .. misses[k].html
            end
         end
      end

      for k,v in pairs(target) do
         if target[k] ~= nil then
            if target[k].left > 85 and target[k].one == true then target[k].left = target[k].left - 0.3 end
            if target[k].left <= 85 then target[k].left = 85 target[k].one = false end
            local div = [[
            <style>
            .targ]]..k..[[ {
               position: relative;
               color: ]]..target[k].color..[[;
               top: ]]..GHUD_radar_notifications_Y..[[vh;
               left: ]]..target[k].left..[[%;
               opacity: ]]..target[k].opacity..[[;
               background-color: ]]..GHUD_radar_notifications_background_color..[[;
               border: 2px solid ]]..GHUD_radar_notifications_border_color..[[;
               border-radius: ]]..GHUD_border_radius..[[;
               padding: 12px;
               margin-top: -2px;
               font-weight: bold;
               font-size: 20px;
               text-align: left;
            }
            </style>
            <div class="targ]]..k..[[">[]]..target[k].size1..[[] ]]..target[k].id..[[ ]]..target[k].name1..[[</div>]]
            targets[k] = {html = div}
            if target[k].one == false then
               target[k].delay = target[k].delay + 1
               if target[k].delay >= 100 then
                  target[k].opacity = target[k].opacity - 0.01
                  --Mac os notifications style
                  --if target[k].left <= 108 then target[k].left = target[k].left + 0.3 end
                  --if target[k].opacity <= 0 and target[k].left >= 100 then
                  if target[k].opacity <= 0 and target[k].cnt == count then
                     target[k] = nil
                     target = {}
                     targets = {}
                     count = 0
                  end
               end
            end
         end
      end

      for k,v in pairs(targets) do
         if targets[k] ~= nil then
            targetsHUD = targetsHUD .. targets[k].html
         end
      end

      local htmlHUD = [[
      <html>
      <style>
      html,body {
         margin:0;
         padding:0;
         overflow: hidden;
      }
      .safez {
         width: auto;
         padding-top: 1px;
         padding-bottom: 1px;
         padding-left: 5px;
         padding-right: 5px;
         position:fixed;
         top: 0;
         right: 0;
         text-align: right;
         color: #FFFFFF;
         text-align: center;
         font-size: 1.2em;
         font-weight: bold;
         background: ]]..GHUD_background_color..[[;
         border: 0.5px solid black;
      }
      .pipe {
         width: auto;
         padding-left: 35px;
         padding-right: 35px;
         padding-top: 2px;
         padding-bottom: 2px;
         position: fixed;
         top: ]]..GHUD_pipe_Y..[[vh;
         right: ]]..GHUD_pipe_X..[[vw;
         text-align: center;
         color: ]]..GHUD_pipe_text_color..[[;
         font-size: 1.2em;
         font-weight: bold;
         background: ]]..GHUD_background_color..[[;
         border: 0.5px solid black;
      }
      .pos1 {
         position: absolute;
         left: 50%;
         top: 55%;
         text-align:center;
         font-size: 20px;
         font-style: verdana;
         font-weight: bold;
         color: white;
         transform: translate(-50%, -50%);
      }
      red1 {
         color: #fc033d;
      }
      orange1 {
         color: #FFB12C;
      }
      green1 {
         color: #07e88e;
      }
      </style>
      <body>
      ]]..AR_allies..[[
      ]]..Indicator..[[
      ]]..AR_asteroid..[[
      ]]..AR_planets..[[
      ]]..AR_pvpzone..[[
      ]]..AR_safezone..[[
      ]]..message..[[
      ]]..targetsHUD..[[
      ]]..vectorHUD..[[
      ]]..missesHUD..[[
      ]]..hitsHUD..[[
      ]]..sight..[[
      ]]..gunnerHUD..[[
      <div class="safez">]]..safetext..[[</div>
      <div class="pipe">]]..pD()..[[</div>
      <div class="pos1">]]..pp1..[[</div>
      </body>
      </html>
      ]]

      if helper == false and helper1 == false then system.setScreen(htmlHUD) end