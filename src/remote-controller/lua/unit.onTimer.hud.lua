damage_SVG()

varcombat = construct.getPvPTimer()

if varcombat > 0 and varcombat < 302 then
   local stress = shield.getStressRatioRaw()
   AM_stress = stress[1]
   EM_stress = stress[2]
   KI_stress = stress[3]
   TH_stress = stress[4]
end
ccs_SVG()

local HP = shield.getShieldHitpoints()/shieldMaxHP * 100
local formatted_hp = string.format('%0.0f',math.ceil(HP))

if shield.isActive() == 0 then
   svghp = maxSHP * (HP*0.01)
   local shield_hp = shield.getShieldHitpoints()
   last_shield_hp = shield_hp
   shieldColor = "#fc033d"
   shieldStatus = "DEACTIVE"
else
   shieldColor = "#2ebac9"
   shieldStatus = "ACTIVE"
end

if (system.getArkTime() - lastShotTime) >= 40 then
   shoteCount = 0
end

local resisttime = shield.getResistancesCooldown()
if resisttime ~= 0 then
   resCLWN = math.floor(resisttime)
else
   resCLWN = ''
end

if shield.isVenting() == 1 then
   shieldStatus = 'VENTING'
end

venttime = shield.getVentingCooldown()
if venttime ~= 0 then
   resCLWN = math.floor(venttime)
end

local brakeHUD = ''
if mybr == true then
   brakeHUD = [[
   <style>
   .main1 {
      position: absolute;
      width: content;
      padding: 10px;
      top: ]]..GHUD_brake_Y..[[%;
      left: 50%;
      transform: translateX(-50%);
      text-align: center;
      background: #142027;
      color: white;
      font-family: "Lucida" Grande, sans-serif;
      font-size: 1.5em;
      border-radius: 5vh;
      border: 4px solid #FFB12C;
      </style>
      <div class="main1">BRAKE ENGAGED</div>]]
   else
      brakeHUD = ''
   end

   local warningmsg = ''
   if math.ceil(HP) <= 50 then
      warningmsg = [[<style>
      .warningmsg {
         position: absolute;
         top: ]]..GHUD_shield_warning_message_Y..[[%;
         left: 50%;
         transform: translate(-50%, -50%);
         padding: 10px;
         width: content;
         text-align: center;
         background: ]]..GHUD_background_color..[[;
         color: #fc033d;
         font-family: "Lucida" Grande, sans-serif;
         font-weight: bold;
         font-size: 1.25em;
         border-radius: 5vh;
         border: 4px solid #FFB12C;
         </style>
         <div class="warningmsg">SHIELD LOW</div>]]
      end

      if t2 == true then
         blink = blink + 0.015
         if blink >= 1 then
            t2=false
         end
      end

      if t2 == false then
         blink = blink - 0.015
         if blink < 0.4 then
            t2=true
         end
      end

      if math.ceil(HP) <= 35 then
         shieldAlarm=true
         if alarmTimer == true then
            warningmsg = [[<style>
            .warningmsg {
               position: absolute;
               top: ]]..GHUD_shield_warning_message_Y..[[%;
               left: 50%;
               transform: translate(-50%, -50%);
               padding: 10px;
               width: content;
               text-align: center;
               background: ]]..GHUD_background_color..[[;
               color: #fc033d;
               opacity: ]]..blink..[[;
               font-family: "Lucida" Grande, sans-serif;
               font-weight: bold;
               font-size: 1.25em;
               border-radius: 5vh;
               border: 4px solid #FFB12C;
               </style>
               <div class="warningmsg">SHIELD LOW</div>]]
            end
         else
            shieldAlarm = false
         end

         local thrust1 = math.floor(unit.getThrottle())
         local accel = math.floor((json.decode(unit.getWidgetData()).acceleration/9.80665)*10)/10
         local sp1 = construct.getWorldVelocity()
         local speed = math.floor(vec3(sp1):len() * 3.6)
         local maxSpeed = math.floor(construct.getMaxSpeed() * 3.6)
         --local closestPlanet = getClosestPlanet(shipPos)

         local htmlHUD = [[
         <html>
         <style>
         html,body {
            margin:0;
            padding:0;
            overflow: hidden;
         }
         .shield1 {
            position: absolute;
            width: ]]..GHUD_shield_panel_size..[[vh;
            top: ]]..GHUD_shield_panel_Y..[[vh;
            opacity: ]]..GHUD_shield_panel_opacity..[[;
            left: 50%;
            transform: translate(-50%, -50%);
            filter: drop-shadow(0 0 15px blue);
         }
         .center1 {
            position: relative;
            margin-left: 50%;
            margin-top: calc(]]..GHUD_Y..[[vh - 68px);
            color: white;
         }
         .right1 {
            color: rgb(0, 191, 255);
            position: absolute;
            left: ]]..GHUD_right_block_X..[[%;
            text-align:left;
            font-size:18px;
            font-family: verdana;
            font-weight: bold;
            text-shadow: 1px 0 1px #000,
            0 1px 1px #000,
            -1px 0 1px #000,
            0 -1px 1px #000;
         }
         .thrust1 {
            color: white;
            position: absolute;
            width: 100%;
            display: flex;
            font-size:20px;
            justify-content: flex-end;
            left: -101%;
            margin-top: -1px;
         }
         .speed1 {
            color: white;
            position: absolute;
            width: 100%;
            display: flex;
            font-size:20px;
            justify-content: flex-end;
            left: -101%;
            margin-top: -1px;
         }
         .accel1 {
            color: white;
            position: absolute;
            width: 100%;
            display: flex;
            font-size:20px;
            justify-content: flex-end;
            left: -101%;
            margin-top: -1.5px;
         }
         .brakedist {
            color: white;
            position: absolute;
            width: 100%;
            display: flex;
            font-size:20px;
            justify-content: flex-end;
            left: -101%;
            margin-top: -1.5px;
         }
         .left1 {
            color: rgb(0, 191, 255);
            position: absolute;
            right: ]]..GHUD_left_block_X..[[%;
            text-align: right;
            font-size:18px;
            font-family: verdana;
            font-weight: bold;
            text-shadow: 1px 0 1px #000,
            0 1px 1px #000,
            -1px 0 1px #000,
            0 -1px 1px #000;
         }
         .shieldtext {
            color: white;
            position: absolute;
            width: 100%;
            display: flex;
            justify-content: flex-end;
            font-size:20px;
            margin-left: -23px;
            margin-top: -1px;
         }
         .fueltext {
            color: white;
            position: absolute;
            width: 100%;
            display: flex;
            justify-content: flex-end;
            font-size:20px;
            margin-left: -23px;
            margin-top: -1px;
         }
         .shield2 {
            position: absolute;
            margin-top: calc(-100% + 5px);
            margin-left: 40%;
            width: 120px;
            height: 120px;
         }
         .fuel1 {
            position: absolute;
            margin-top:calc(-100% + 5px);
            margin-left: 40%;
            width: 120px;
            height: 120px;
         }
         red1 {
            color: #fc033d;
         }
         green1 {
            color: #07e88e;
         }
         white1 {
            color: white;
         }
         mspeed {
            color: white;
            opacity: 0.25;
         }
         blue1 {
            color: rgb(0, 191, 255);
         }
         it {
            font-style: italic;
         }
         orange1 {
            color: #FFB12C;
         }
         </style>
         <body>
         ]]..warningmsg..[[
         ]]..brakeHUD..[[
         <div class="center1"></div>
         <div class="right1">THRUST<br><div class="thrust1">]]..thrust1..[[</div><orange1>%</orange1><br>SPEED<br><div class="speed1">]]..speed..[[</div><orange1>KM/H</orange1><mspeed> ]]..maxSpeed..[[</mspeed><br>ACCEL<br><div class="accel1">]]..accel..[[</div><orange1>G</orange1><br>BRAKE-DIST<br><div class="brakedist">]]..brakeDist..[[</div><orange1>]]..brakeS..[[</orange1></div>
         <div class="left1">SHIELD<div class="shield2"><svg viewBox="0 0 100 100" fill="none" stroke="]]..shieldColor..[[" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg">
         <path d="M 50 60 C 50 60 58 56 58 50 L 58 43 L 50 40 L 42 43 L 42 50 C 42 56 50 60 50 60 Z"/>
         <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 13px; font-weight: 700; stroke-width: 0px; text-anchor: middle;" x="50" y="53.737">]]..shieldIcon..[[</text>
         </svg></div><br><div class="shieldtext">]]..formatted_hp..[[</div><orange1>%</orange1><br>FUEL<div class="fuel1"><svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
         <g fill="none" fill-rule="evenodd" transform="matrix(1, 0, 0, 1, -18, -4.5)">
         <path d="M68 63c3.038 0 5.5-2.493 5.5-5.567 0-2.05-1.833-5.861-5.5-11.433-3.667 5.572-5.5 9.383-5.5 11.433C62.5 60.507 64.962 63 68 63z" fill="#FFB12C"/>
         </g>
         </svg></div><br><div class="fueltext">]]..fuel_lvl..[[</div><orange1>%</orange1></div>
         <div class="shield1"><?xml version="1.0" encoding="utf-8"?>
         <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg" xmlns:bx="https://boxy-svg.com">
         <defs>
         <linearGradient id="AM_gradient" x1="100%" x2="0%">
         <stop stop-color="#fc033d" offset="]]..AM_svg..[[" />
         <stop stop-color="]]..GHUD_shield_background_color..[[" offset="0" />
         </linearGradient>
         <linearGradient id="EM_gradient" x1="100%" x2="0%">
         <stop stop-color="#fc033d" offset="]]..EM_svg..[[" />
         <stop stop-color="]]..GHUD_shield_background_color..[[" offset="0" />
         </linearGradient>
         <linearGradient id="TH_gradient" x1="100%" x2="0%">
         <stop stop-color="#fc033d" offset="]]..TH_svg..[[" />
         <stop stop-color="]]..GHUD_shield_background_color..[[" offset="0" />
         </linearGradient>
         <linearGradient id="KI_gradient" x1="100%" x2="0%">
         <stop stop-color="#fc033d" offset="]]..KI_svg..[[" />
         <stop stop-color="]]..GHUD_shield_background_color..[[" offset="0" />
         </linearGradient>
         </defs>
         <rect x="145" y="225" width="210" height="50" style="fill: ]]..GHUD_shield_empty_background_layer_color..[[; stroke: ]]..GHUD_shield_stroke_color..[[;" bx:origin="0.5 0.5"/>
         <rect x="145" y="225" width="]]..svghp..[[" height="50" style="fill: ]]..GHUD_shield_background_color..[[; stroke: ]]..GHUD_shield_background_color..[[;" bx:origin="0.5 0.5"/>
         ]]..damageLine..[[
         ]]..ccsLineHit..[[
         <rect x="180.2" y="220.2" width="]]..ccshp..[[" height="4.8" style="fill: white; stroke: white; stroke-width:0;"/>
         <path style="fill: rgba(0, 0, 0, 0); stroke: ]]..GHUD_shield_stroke_color..[[;" d="M 180.249 220.227 L 319.749 220.175 L 315.834 225 L 184.159 225 L 180.249 220.227 Z"/>
         <rect x="180.2" y="275" width="]]..FUEL_svg..[[" height="4.8" style="fill: #FFB12C; stroke: #FFB12C; stroke-width:0;"/>
         <path style="fill: rgba(0,0,0,0); stroke: ]]..GHUD_shield_stroke_color..[[;" d="M 180.2 275.052 L 319.7 275 L 315.785 279.825 L 184.11 279.825 L 180.2 275.052 Z" transform="matrix(-1, 0, 0, -1, 499.900004, 554.825024)"/>
         <path style="fill: url(#AM_gradient); stroke: ]]..AM_stroke_color..[[; stroke-width: ]]..AMstrokeWidth..[[;" d="M 125 215 L 185 250 L 95 250 L 85 240 L 125 215 Z" transform="matrix(-1, 0, 0, -1, 270.000006, 465.00001)"/>
         <path style="fill: url(#TH_gradient); stroke: ]]..TH_stroke_color..[[; stroke-width: ]]..THstrokeWidth..[[;" d="M 315 225 L 325 215 L 415 215 L 355 250 L 315 225 Z"/>
         <path style="fill: url(#KI_gradient); stroke: ]]..KI_stroke_color..[[; stroke-width: ]]..KIstrokeWidth..[[;" d="M 355 250 L 415 285 L 325 285 L 315 275 L 355 250 Z"/>
         <path style="fill: url(#EM_gradient); stroke: ]]..EM_stroke_color..[[; stroke-width: ]]..EMstrokeWidth..[[;" d="M 85 260 L 95 250 L 185 250 L 125 285 L 85 260 Z" transform="matrix(-1, 0, 0, -1, 270.000006, 535.000011)"/>
         <polygon style="fill: ]]..GHUD_shield_background2_color..[[; stroke: ]]..GHUD_shield_stroke_color..[[; stroke-linejoin: round; stroke-linecap: round;" points="239 225 244 231 256 231 261 225"></polygon>
         <polygon style="fill: ]]..GHUD_shield_background2_color..[[; stroke: ]]..GHUD_shield_stroke_color..[[; stroke-linejoin: round; stroke-linecap: round;" points="235 269 240 275 260 275 265 269" transform="matrix(-1, 0, 0, -1, 500, 544)"></polygon>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 4.5px; font-weight: 700; text-anchor: middle;" transform="matrix(1, 0, 0, 1, -1.542758, -0.533447)"><tspan x="251.796" y="230.312">]]..resCLWN..[[</tspan></text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 4px; font-weight: 700; text-anchor: middle;" x="250.048" y="273.416">]]..shieldStatus..[[</text>
         <text style="fill: ]]..GHUD_shield_stroke_color..[[; font-family: Arial, sans-serif; font-weight: bold; font-size: 3.2px; text-anchor: middle;" x="250" y="223.591">CCS</text>
         <polygon style="fill: ]]..GHUD_shield_background2_color..[[; stroke: ]]..GHUD_shield_stroke_color..[[; stroke-linejoin: round; stroke-linecap: round;" points="235 279.8 240 285.8 260 285.8 265 279.8"></polygon>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 4px; font-weight: 700; text-anchor: middle;" x="250.28" y="284.311">]]..avWarp..[[/]]..totalWarp..[[</text>
         <path style="fill: ]]..GHUD_shield_background2_color..[[; stroke: ]]..GHUD_shield_stroke_color..[[; stroke-linecap: round; stroke-linejoin: round;" d="M 220 279.8 L 225 285.8 L 240 285.8 L 235 279.8 L 220 279.8 Z" transform="matrix(-1, 0, 0, -1, 460, 565.599976)"></path>
         <path style="fill: ]]..GHUD_shield_background2_color..[[; stroke: ]]..GHUD_shield_stroke_color..[[; stroke-linecap: round; stroke-linejoin: round;" d="M 265 279.8 L 260 285.8 L 275 285.8 L 280 279.8 L 265 279.8 Z" transform="matrix(-1, 0, 0, -1, 540, 565.599976)"></path>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 3.5px; font-weight: 700; text-anchor: middle;" x="230.218" y="284.182">WARP</text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 3.5px; font-weight: 700; text-anchor: middle;" x="269.736" y="284.129">CELLS</text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 16px; font-weight: 700; paint-order: stroke; stroke: ]]..GHUD_shield_text_stroke_color..[[; stroke-width: 1.25px;" transform="matrix(1, 0, 0, 1, -0.542236, -41.161256)"><tspan x="351.543" y="319.558">KI</tspan></text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 16px; font-weight: 700; paint-order: stroke; stroke: ]]..GHUD_shield_text_stroke_color..[[; stroke-width: 1.25px;" transform="matrix(1, 0, 0, 1, -4.542999, -86.161257)"><tspan x="351.543" y="319.558">TH</tspan></text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 16px; font-weight: 700; paint-order: stroke; stroke: ]]..GHUD_shield_text_stroke_color..[[; stroke-width: 1.25px;" transform="matrix(1, 0, 0, 1, -219.543004, -41.161256)"><tspan x="351.543" y="319.558">EM</tspan></text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 16px; font-weight: 700; paint-order: stroke; stroke: ]]..GHUD_shield_text_stroke_color..[[; stroke-width: 1.25px;" transform="matrix(1, 0, 0, 1, -219.543004, -86.161257)"><tspan x="351.543" y="319.558">AM</tspan></text>
         <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 20px; font-weight: 700; paint-order: stroke; stroke: ]]..GHUD_shield_text_stroke_color..[[; stroke-width: 1.25px; text-anchor: middle;" x="252" y="257.079">]]..formatted_hp..[[%</text>
         ]]..AM_res..[[
         ]]..EM_res..[[
         ]]..KI_res..[[
         ]]..TH_res..[[
         </svg></div>
         </body>
         </html>]]

         if helper == false and helper1 == false then system.setScreen(htmlHUD) end