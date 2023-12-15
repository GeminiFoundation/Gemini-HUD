-- GEMINI FOUNDATION

--Remote controller
HUD_version = '1.4.9'

--LUA parameters
GHUD_shield_auto_calibration = true --export: AUTO/MANUAL shield mode
GHUD_shield_calibration_max = true --export: MAX or 50/50 shield mode
GHUD_shield_panel_size = 95 --export:
GHUD_shield_panel_Y = 87.5 --export:
GHUD_active_resists_border_color = '#07e88e' --export:
GHUD_shield_panel_opacity = 1 --export:
GHUD_shield_background_color = '#142027' --export:
GHUD_shield_background2_color = 'black' --export:
GHUD_shield_empty_background_layer_color = 'rgba(0,0,0,0)' --export:
GHUD_shield_stroke_color = 'rgb(0, 191, 255)' --export:
GHUD_shield_text_color = 'rgb(255, 252, 252)' --export:
GHUD_shield_text_stroke_color = 'rgb(0, 0, 0)' --export:
GHUD_right_block_X = 65 --export:
GHUD_left_block_X = 65 --export:
GHUD_background_color = '#142027' --export:
GHUD_Y = 48.5 --export:
GHUD_shield_warning_message_Y = 20 --export: Shield low HP warning message
GHUD_brake_Y = 1 -- export: Brake indicator
collectgarbages = false --export: experimental

--shield
damageLine = ''
ccsLineHit = ''
damage = 0
maxSHP = 210 --svg shield X right side coordinate
shieldMaxHP = shield.getMaxShieldHitpoints()
last_shield_hp = shield.getShieldHitpoints()
HP = shield.getShieldHitpoints()/shieldMaxHP * 100
svghp = maxSHP * (HP * 0.01)

--CCS
ccshit = 0
maxCCS = 139.5
coreMaxStress = core.getMaxCoreStress()
last_core_stress = core.getCoreStress()
CCS = last_core_stress/coreMaxStress * 100
ccshp1 = maxCCS * (CCS * 0.01)
ccshp = ccshp1

--FUEL
maxFUEL = maxCCS
fuel_lvl = math.ceil(spacefueltank_1.getItemsVolume()/spacefueltank_1.getMaxVolume() * 100)
FUEL_svg = maxFUEL * (fuel_lvl * 0.01)

AM_last_stress = 0
EM_last_stress = 0
TH_last_stress = 0
KI_last_stress = 0
AM_svg = 0
EM_svg = 0
TH_svg = 0
KI_svg = 0

if warpdrive ~= nil then
   avWarp = warpdrive.getRequiredWarpCells()
   totalWarp = warpdrive.getAvailableWarpCells()
else
   avWarp = 0
   totalWarp = 0
end

function resistance_SVG()
   local res = shield.getResistances()
   if res[1] > 0 then
      AM_stroke_color = GHUD_active_resists_border_color
      AMstrokeWidth = 2
   else
      AM_stroke_color = GHUD_shield_stroke_color
      AMstrokeWidth = 1
   end
   if res[2] > 0 then
      EM_stroke_color = GHUD_active_resists_border_color
      EMstrokeWidth = 2
   else
      EM_stroke_color = GHUD_shield_stroke_color
      EMstrokeWidth = 1
   end
   if res[3] > 0 then
      KI_stroke_color = GHUD_active_resists_border_color
      KIstrokeWidth = 2
   else
      KI_stroke_color = GHUD_shield_stroke_color
      KIstrokeWidth = 1
   end
   if res[4] > 0 then
      TH_stroke_color = GHUD_active_resists_border_color
      THstrokeWidth = 2
   else
      TH_stroke_color = GHUD_shield_stroke_color
      THstrokeWidth = 1
   end
end

function actionRes(res)
   if res[1] > 0 then
      AM_stroke_color = GHUD_active_resists_border_color
      AMstrokeWidth = 2
      unit.setTimer('AM',0.016)
   else
      AM_stroke_color = GHUD_shield_stroke_color
      AMstrokeWidth = 1
   end
   if res[2] > 0 then
      EM_stroke_color = GHUD_active_resists_border_color
      EMstrokeWidth = 2
      unit.setTimer('EM',0.016)
   else
      EM_stroke_color = GHUD_shield_stroke_color
      EMstrokeWidth = 1
   end
   if res[3] > 0 then
      KI_stroke_color = GHUD_active_resists_border_color
      KIstrokeWidth = 2
      unit.setTimer('KI',0.016)
   else
      KI_stroke_color = GHUD_shield_stroke_color
      KIstrokeWidth = 1
   end
   if res[4] > 0 then
      TH_stroke_color = GHUD_active_resists_border_color
      THstrokeWidth = 2
      unit.setTimer('TH',0.016)
   else
      TH_stroke_color = GHUD_shield_stroke_color
      THstrokeWidth = 1
   end
end

resistance_SVG()

am=0
am_x = -50
am_opacity = 1
em=0
em_x = -50
em_opacity = 1
ki=0
ki_x = 339
ki_opacity = 1
th=0
th_x = 339
th_opacity = 1
AM_res = ''
EM_res = ''
KI_res = ''
TH_res = ''

function damage_SVG()
   if damage > 0 then
      damage = damage - 0.08
      damageLine = [[<rect x="]].. svghp + 145 ..[[" y="225" width="]]..damage..[[" height="50" style="fill: #de1656; stroke: #de1656;" bx:origin="0.5 0.5"/>]]
   end
   if damage <= 0 then
      damage = 0
      damageLine = ''
   end

   if ccshit > 0 then
      ccshp = ccshp + 0.23
      if ccshp >= ccshp1 then
         ccshp = ccshp1
         ccsLineHit = ''
         ccshit = 0
      end
   end
end

function ccs_SVG()
   --AM
   if AM_stress ~= AM_last_stress then
      AM_last_stress = AM_stress
   end
   if AM_svg < AM_last_stress then
      AM_svg = AM_svg + 0.01
      if AM_svg >= AM_last_stress then AM_svg = AM_last_stress
   end
end
if AM_svg > AM_last_stress then
   AM_svg = AM_svg - 0.01
   if AM_svg <= AM_last_stress then AM_svg = AM_last_stress end
end
--EM
if EM_stress ~= EM_last_stress then
   EM_last_stress = EM_stress
end
if EM_svg < EM_last_stress then
   EM_svg = EM_svg + 0.01
   if EM_svg >= EM_last_stress then EM_svg = EM_last_stress end
end
if EM_svg > EM_last_stress then
   EM_svg = EM_svg - 0.01
   if EM_svg <= EM_last_stress then EM_svg = EM_last_stress end
end
--TH
if TH_stress ~= TH_last_stress then
   TH_last_stress = TH_stress
end
if TH_svg < TH_last_stress then
   TH_svg = TH_svg + 0.01
   if TH_svg >= TH_last_stress then TH_svg = TH_last_stress end
end
if TH_svg > TH_last_stress then
   TH_svg = TH_svg - 0.01
   if TH_svg <= TH_last_stress then TH_svg = TH_last_stress end
end
--KI
if KI_stress ~= KI_last_stress then
   KI_last_stress = KI_stress
end
if KI_svg < KI_last_stress then
   KI_svg = KI_svg + 0.01
   if KI_svg >= KI_last_stress then KI_svg = KI_last_stress end
end
if KI_svg > KI_last_stress then
   KI_svg = KI_svg - 0.01
   if KI_svg <= KI_last_stress then KI_svg = KI_last_stress end
end
end

local stress = shield.getStressRatioRaw()
AM_stress = stress[1]
EM_stress = stress[2]
KI_stress = stress[3]
TH_stress = stress[4]
AM_last_stress = stress[1]
EM_last_stress = stress[2]
TH_last_stress = stress[3]
KI_last_stress = stress[4]
ccs_SVG()

function setTag(tag)
local tag = tag:sub(5)
system.print('Activated new transponder tag "'..tag..'"')
tag = {tag}
transponder.setTags(tag)
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

lalt=false
shift=false
upB = false
downB = false
leftB = false
rightB = false

varcombat = construct.getPvPTimer()

bhelper = false
helper = false
helper1 = false
system.showHelper(0)
system.showScreen(1)
unit.hideWidget()
tz1=0
tz2=0
brakeS = ''
brakeDist = ''

function indexSort(tbl)
local idx = {}
for i = 1, #tbl do idx[i] = i end
table.sort(idx, function(a, b) return tbl[a] > tbl[b] end)
return (table.unpack or unpack)(idx)
end

function getResRatioBy2HighestDamage(stress)
local resRatio = {0,0,0,0}
local h1, h2 = indexSort(stress)
if stress[h2] > 0 then
   resRatio[h1] = resMAX/2
   resRatio[h2] = resMAX/2
else
   resRatio[h1] = resMAX
end
return resRatio
end

resMAX = shield.getResistancesPool()
function getRes(stress, resMAX)
local res = {0.15,0.15,0.15,0.15}
if stress[1] >= stress[2] and
stress[1] >= stress[3] and
stress[1] > stress[4] then
   res = {resMAX,0,0,0}
elseif stress[2] >= stress[1] and
   stress[2] >= stress[3] and
   stress[2] > stress[4] then
      res = {0,resMAX,0,0}
   elseif stress[3] >= stress[1] and
      stress[3] >= stress[2] and
      stress[3] > stress[4] then
         res = {0,0,resMAX,0}
      elseif stress[4] >= stress[1] and
         stress[4] >= stress[2] and
         stress[4] > stress[3] then
            res = {0,0,0,resMAX}
         end
         return res
      end
      shoteCount = 0
      lastShotTime = system.getArkTime()
      resCLWN = ""

      if GHUD_shield_auto_calibration == true then
         if GHUD_shield_calibration_max then
            shieldText = "MAX - SHIELD"
            shieldIcon = "A"
         else
            shieldText = "50/50 - SHIELD"
            shieldIcon = "A"
         end
      else
         if GHUD_shield_calibration_max then
            shieldText = "MAX - SHIELD"
            shieldIcon = "M"
         else
            shieldText = "50/50 - SHIELD"
            shieldIcon = "M"
         end
      end

      brakeText = ""
      if shield.isActive() == 0 then
         shieldColor = "#fc033d"
         shieldStatus = "DEACTIVE"
      else
         shieldColor = "#2ebac9"
         shieldStatus = "ACTIVE"
      end

      venttime = 0
      venttimemax = shield.getVentingMaxCooldown()
      resisttimemax = shield.getResistancesMaxCooldown()

      mybr=false
      dis=0
      accel=0
      resString = ""
      throttle1=0
      fuel1=0

      blink=1
      shieldAlarm = false
      alarmTimer = false
      t2=nil

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
      <ibold>SHIELD:</ibold>
      <br>
      <br>
      <bdr>]]..opt9..[[</bdr> : start/stop venting<br>
      <br>
      <bdr>]]..opt8..[[</bdr> : on/off shield<br>
      <br>
      <bdr>]]..opt7..[[</bdr> : switch AUTO/MANUAL shield mode<br>
      <br>
      <bdr>]]..shifttext..[[</bdr> + <bdr>]]..opt7..[[</bdr> : switch shield mode between MAX and 50/50 mode<br>
      <br>
      <bdr>]]..opt6..[[</bdr> : agree and apply resists in manual shield mode<br>
      <br>
      <bdr>]]..uptext..[[</bdr> + <bdr>]]..opt1..[[</bdr> : 100% antimatter power<br>
      <br>
      <bdr>]]..uptext..[[</bdr> + <bdr>]]..opt2..[[</bdr> : 100% electromagnetic power<br>
      <br>
      <bdr>]]..uptext..[[</bdr> + <bdr>]]..opt3..[[</bdr> : 100% thermic power<br>
      <br>
      <bdr>]]..uptext..[[</bdr> + <bdr>]]..opt4..[[</bdr> : 100% kinetic power<br>
      <br>
      <bdr>]]..downtext..[[</bdr> + <bdr>]]..opt1..[[</bdr> : cannon profile<br>
      <br>
      <bdr>]]..downtext..[[</bdr> + <bdr>]]..opt2..[[</bdr> : railgun profile<br>
      <br>
      <bdr>]]..downtext..[[</bdr> + <bdr>]]..opt3..[[</bdr> : laser profile<br>
      <br>
      <bdr>]]..downtext..[[</bdr> + <bdr>]]..opt4..[[</bdr> : universal profile<br>
      </div>
      <div class="helper2">
      <ibold>OTHER:</ibold>
      <br>
      <br>
      <bdr>]]..braketext1..[[</bdr> + <bdr>]]..shifttext..[[</bdr> : lock brake<br>
      </div>
      </div>
      <div class="bottomL">
      <div class="helper3">
      <ibold>SHIELD LUA COMMANDS:</ibold>
      <br>
      <br>
      <luac>am</luac> : 100% antimatter power<br>
      <br>
      <luac>em</luac> : 100% electromagnetic power<br>
      <br>
      <luac>th</luac> : 100% thermic power<br>
      <br>
      <luac>ki</luac> : 100% kinetic power<br>
      <br>
      <luac>c</luac> : cannon profile<br>
      <br>
      <luac>r</luac> : railgun profile<br>
      <br>
      <luac>l</luac> : laser profile<br>
      <br>
      <luac>m</luac> : missile profile<br>
      </div>
      <div class="helper4">
      <ibold>OTHER LUA COMMANDS:</ibold>
      <br>
      <br>
      <luac>tag foxtrot</luac> : set transponder tag, where foxtrot is transponder tag<br>
      <br>
      <luac>drop</luac> : undock all constructs<br>
      <br>
      <luac>helper</luac> : show/hide build helper<br>
      </div>
      </div>
      <div class="helperCenter">GEMINI FOUNDATION<br><br>Remote Controller Controls</div>
      <div class="hudversion">GHUD v]]..HUD_version..[[</div>
      </body>
      </html>]]
      Kinematic = {} -- just a namespace

      function Kinematic.computeAccelerationTime(initial, acceleration, final)
         -- ans: t = (vf - vi)/a
         return (final - initial)/acceleration
      end


      function Kinematic.computeDistanceAndTime(initial,final,mass,thrust,t50,brakeThrust)

         t50            = t50 or 0
         brakeThrust    = brakeThrust or 0 -- usually zero when accelerating

         local speedUp  = initial < final
         local a0       = thrust / (speedUp and mass or -mass)
         local b0       = -brakeThrust/mass
         local totA     = a0+b0

         if initial == final then
            return 0, 0   -- trivial
         elseif speedUp and totA <= 0 or not speedUp and totA >= 0 then
            return -1, -1 -- no solution
         end

         local distanceToMax, timeToMax = 0, 0

         if a0 ~= 0 and t50 > 0 then

            local c1  = math.pi/t50/2

            local v = function(t)
            return a0*(t/2 - t50*math.sin(c1*t)/math.pi) + b0*t + initial
         end

         local speedchk = speedUp and function(s) return s >= final end or
         function(s) return s <= final end
            timeToMax  = 2*t50

            if speedchk(v(timeToMax)) then
               local lasttime = 0

               while math.abs(timeToMax - lasttime) > 0.25 do
                  local t = (timeToMax + lasttime)/2
                  if speedchk(v(t)) then
                     timeToMax = t
                  else
                     lasttime = t
                  end
               end
            end

            -- Closed form solution for distance exists (t <= 2*t50):
            local K       = 2*a0*t50^2/math.pi^2
            distanceToMax = K*(math.cos(c1*timeToMax) - 1) +
            (a0+2*b0)*timeToMax^2/4 + initial*timeToMax

            if timeToMax < 2*t50 then
               return distanceToMax, timeToMax
            end
            initial = v(timeToMax)
         end
         -- At full thrust, motion follows Newton's formula:
         local a = a0+b0
         local t = Kinematic.computeAccelerationTime(initial, a, final)
         local d = initial*t + a*t*t/2
         return distanceToMax+d
      end

      system.print('GHUD Remote controller v'..HUD_version)
      system.print(''..geartext..' + →: helper')

      transponder.deactivate() --transponder server bug fix
      unit.setTimer('hud',0.016)
      unit.setTimer('brake',0.15)
      unit.setTimer('tr',2)
      unit.setTimer('prealarm',2)
      if warpdrive ~= nil then
         unit.setTimer('warp',35)
      end
      if collectgarbages == true then
         unit.setTimer('cleaner',30)
      end