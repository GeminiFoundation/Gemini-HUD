radarIDs=activeRadar.getConstructIds()idN=#radarIDs;mRadar:onUpdate()if coroutine.status(main1)~="dead"and coroutine.status(main1)=="suspended"then coroutine.resume(main1)end;if coroutine.status(main2)~="dead"and coroutine.status(main2)=="suspended"then coroutine.resume(main2)end;if corpos==true then if coroutine.status(ck)~="dead"and coroutine.status(ck)=="suspended"then coroutine.resume(ck,asteroidcoord)end end;local a=system.getMouseDeltaX()*4;local b=system.getMouseDeltaY()*4;damage_SVG()local c=vec3(construct.getWorldPosition())varcombat=construct.getPvPTimer()if varcombat>0 and varcombat<302 then local d=shield.getStressRatioRaw()AM_stress=d[1]EM_stress=d[2]KI_stress=d[3]TH_stress=d[4]end;ccs_SVG()local e=shield.getShieldHitpoints()/shieldMaxHP*100;local f=string.format('%0.0f',math.ceil(e))if shield.isActive()==0 then svghp=maxSHP*e*0.01;local g=shield.getShieldHitpoints()last_shield_hp=g;shieldColor="#fc033d"shieldStatus="DEACTIVE"else shieldColor="#2ebac9"shieldStatus="ACTIVE"end;if system.getArkTime()-lastShotTime>=40 then shoteCount=0 end;local h=shield.getResistancesCooldown()if h~=0 then resCLWN=math.floor(h)else resCLWN=''end;if shield.isVenting()==1 then shieldStatus='VENTING'end;venttime=shield.getVentingCooldown()if venttime~=0 then resCLWN=math.floor(venttime)end;local i=''if mybr==true then i=[[
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
       <div class="main1">BRAKE ENGAGED</div>]]else i=''end;local j=''if math.ceil(e)<=50 then j=[[<style>
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
          <div class="warningmsg">SHIELD LOW</div>]]end;if t2==true then blink=blink+0.015;if blink>=1 then t2=false end end;if t2==false then blink=blink-0.015;if blink<0.4 then t2=true end end;if math.ceil(e)<=35 then shieldAlarm=true;if alarmTimer==true then j=[[<style>
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
                <div class="warningmsg">SHIELD LOW</div>]]end else shieldAlarm=false end;local k=math.floor(unit.getThrottle())local l=math.floor(json.decode(unit.getWidgetData()).acceleration/9.80665*10)/10;local m=construct.getWorldVelocity()local n=math.floor(vec3(m):len()*3.6)local o=math.floor(construct.getMaxSpeed()*3.6)local p=''local q=''local r=''local s=''local t=''local u=c+400000*vec3(m)local v=library.getPointOnScreen({u.x,u.y,u.z})if v[3]>0 and n>15 then local w=screenWidth*v[1]-a-GHUD_flight_indicator_size/2;local x=screenHeight*v[2]-b-GHUD_flight_indicator_size/2;t=[[
             <style>
             .flightIndicator {
                position: absolute;
                width: ]]..GHUD_flight_indicator_size..[[px;
                height: ]]..GHUD_flight_indicator_size..[[px;
                left: ]]..w..[[px;
                top: ]]..x..[[px;
             }
             </style>
             <div class="flightIndicator">
             <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
             <line style="fill: ]]..GHUD_flight_indicator_color..[[; stroke: ]]..GHUD_flight_indicator_color..[[; stroke-width: 20px;" x1="10" y1="100" x2="190" y2="100" transform="matrix(0.707107, -0.707107, 0.707107, 0.707107, -41.421356, 100)"></line>
             <line style="fill: ]]..GHUD_flight_indicator_color..[[; stroke: ]]..GHUD_flight_indicator_color..[[; stroke-width: 20px;" x1="10" y1="100" x2="190" y2="100" transform="matrix(0.707107, 0.707107, -0.707107, 0.707107, 100, -41.421356)"></line>
             </svg></div>]]end;local y,z,A,B=safeZone()if szsafe==true then safetext=''..y..' <green1>'..A..' '..B..'</green1>'local C=library.getPointOnScreen({z.x,z.y,z.z})if C[3]>0 then local D=screenWidth*C[1]-a-50;local E=screenHeight*C[2]-b-50;r=[[
                <style>
                .pvpzoneAR {
                   position: absolute;
                   width: 100px;
                   height: 100px;
                   left: ]]..D..[[px;
                   top: ]]..E..[[px;
                }
                </style>
                <div class="pvpzoneAR"><?xml version="1.0" encoding="utf-8"?>
                <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
                <ellipse style="fill: rgba(0, 0, 0, 0); stroke: #fc033d; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">PvP ZONE</text>
                <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..A..[[</text>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..B..[[</text>
                </svg></div>]]end else safetext=''..y..' <red1>'..A..' '..B..'</red1>'local C=library.getPointOnScreen({z.x,z.y,z.z})if C[3]>0 then local D=screenWidth*C[1]-a-50;local E=screenHeight*C[2]-b-50;s=[[
                <style>
                .safezoneAR {
                   position: absolute;
                   width: 100px;
                   height: 100px;
                   left: ]]..D..[[px;
                   top: ]]..E..[[px;
                }
                </style>
                <div class="safezoneAR"><?xml version="1.0" encoding="utf-8"?>
                <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
                <ellipse style="fill: rgba(0, 0, 0, 0); stroke: #07e88e; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">SAFE ZONE</text>
                <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..A..[[</text>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..B..[[</text>
                </svg></div>]]end end;if asteroidcoord[1]~=0 then local C=library.getPointOnScreen({asteroidcoord.x,asteroidcoord.y,asteroidcoord.z})if C[3]>0 then local F=vec3(c-asteroidcoord):len()local G=''if F>=100000 then F=string.format('%0.2f',F/200000)G='SU'elseif F>=1000 and F<100000 then F=string.format('%0.1f',F/1000)G='KM'else F=string.format('%0.0f',F)G='M'end;local w=screenWidth*C[1]-a-50;local x=screenHeight*C[2]-b-50;q=[[
                <style>
                .marker]]..GHUD_marker_name..[[ {
                   position: absolute;
                   width: 100px;
                   height: 100px;
                   left: ]]..w..[[px;
                   top: ]]..x..[[px;
                }
                </style>
                <div class="marker]]..GHUD_marker_name..[["><?xml version="1.0" encoding="utf-8"?>
                <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
                <ellipse style="fill: rgba(0, 0, 0, 0); stroke: ]]..GHUD_marker_color..[[; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">]]..GHUD_marker_name..[[</text>
                <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..F..[[</text>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..G..[[</text>
                </svg></div>]]end end;if DisplayRadar==true then local w,x,H=table.unpack(construct.getWorldOrientationForward())local I=math.floor(math.atan(w,x)*180/math.pi+180)local J=math.floor(math.atan(x,H)*180/math.pi+180)local K=[[
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
             <div class="XY">X: ]]..I..[[<br>Y: ]]..J..[[</div>]]message=[[
             <style>
             .svg {
                position:absolute;
                left: 0;
                top: 6vh;
                height: 100vh;
                width: 100vw;
                .wptxt {
                   fill: white;
                   font-size: ]]..screenHeight/80 ..[[;
                   font-family: sans-serif;
                   text-anchor: end;
                   .shiptxt {
                      fill: white;
                      font-size: ]]..screenHeight/80 ..[[;
                      font-family: sans-serif;
                      text-anchor: start;
                   }
                   </style>]]message=message..[[<svg class="svg">]]svgradar=""RadarX=screenWidth*1/7;RadarY=screenWidth*1/7;RadarR=screenWidth*1/7;svgradar=svgradar..string.format([[<line x1="%f" y1="%f" x2="%f" y2="%f" stroke-width="2" stroke="black" />]],RadarX,RadarY-RadarR,RadarX,RadarY+RadarR)svgradar=svgradar..string.format([[<line x1="%f" y1="%f" x2="%f" y2="%f" stroke-width="2" stroke="black" />]],RadarX-RadarR,RadarY,RadarX+RadarR,RadarY)svgradar=svgradar..string.format([[<circle  cx="%f" cy="%f" r="%f" stroke="black" fill="transparent" stroke-width="5"/>]],RadarX,RadarY,RadarR/2)svgradar=svgradar..string.format([[<circle  cx="%f" cy="%f" r="%f" stroke="black" fill-opacity="0.2" fill="green" stroke-width="5"/>]],RadarX,RadarY,RadarR)for L in pairs(atlas[0])do local M=atlas[0][L]if(M.type[1]=='Planet'or M.isSanctuary==true)and M.name[1]~=planetzone then drawonradar(vec3(M.center),M.name[1])local C=library.getPointOnScreen({M.center[1],M.center[2],M.center[3]})if C[3]>0 then local F=vec3(c-vec3(M.center)):len()local G=''if F>=100000 then F=string.format('%0.2f',F/200000)G='SU'elseif F>=1000 and F<100000 then F=string.format('%0.1f',F/1000)G='KM'else F=string.format('%0.0f',F)G='M'end;local D=screenWidth*C[1]-a-50;local E=screenHeight*C[2]-b-50;p=p..[[
                            <style>
                            .pl]]..M.name[1]..[[ {
                               position: absolute;
                               width: 100px;
                               height: 100px;
                               left: ]]..D..[[px;
                               top: ]]..E..[[px;
                            }
                            </style>
                            <div class="pl]]..M.name[1]..[["><?xml version="1.0" encoding="utf-8"?>
                            <svg viewBox="0 0 250 250" xmlns="http://www.w3.org/2000/svg">
                            <ellipse style="fill: rgba(0, 0, 0, 0); stroke: #FFB12C; stroke-width: 8px;" cx="125" cy="125" rx="50" ry="50"/>
                            <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="48.955">]]..M.name[1]..[[</text>
                            <text style="fill: white; font-family: verdana; font-size: 28px; font-weight: 700; text-anchor: middle;" x="125" y="209.955">]]..F..[[</text>
                            <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 28px; font-style: italic; font-weight: 700; text-anchor: middle;" x="125" y="240.424">]]..G..[[</text>
                            </svg></div>]]end end end;drawonradar(z,y)if szsafe==true then drawonradar(safeWorldPos,'Central SZ')end;if asteroidcoord[1]~=0 then drawonradar(asteroidcoord,""..GHUD_marker_name.."")end;message=message..svgradar..K;message=message.."</svg>"else message=''end;local N=''local O=''local P=''if wslot_1~=nil then local Q=wslot_1.getWidgetData()pr1=tonumber(Q:match('"hitProbability":(.-),'))math.floor(pr1*100)end;if wslot_2~=nil then local R=wslot_2.getWidgetData()pr2=tonumber(R:match('"hitProbability":(.-),'))end;local S=activeRadar.getTargetId()if S~=0 then local T=activeRadar.getConstructMass(S)local U='rgba(0, 191, 255, 0)'local V=activeRadar.getConstructKind(S)if V==5 then U='rgb(0, 191, 255)'else U='#c603fc'end;if activeRadar.isConstructAbandoned(S)==1 then U='rgba(255, 255, 255, 0.25)'end;local W='??'local G=""local F=math.floor(activeRadar.getConstructDistance(S))distT=F;local X=string.sub(""..activeRadar.getConstructName(S).."",1,6)local Y=activeRadar.getConstructCoreSize(S)local n='??'local Z='0.0'if totalDamage[S]~=nil then Z=string.format('%0.1f',totalDamage[S].damage*0.000001)end;if activeRadar.isConstructIdentified(S)==1 then if V==5 then W=math.floor(clamp((50000/3.6-10713*(T-10000)/(853926+T-10000))*3.6,20000,50000))end;n=activeRadar.getConstructSpeed(S)n=math.floor(n*3.6)speedT=n end;local _=c+F*vec3(construct.getWorldOrientationForward())local C=library.getPointOnScreen({_.x,_.y,_.z})if F>=100000 then F=string.format('%0.2f',F/200000)G='SU'elseif F>=1000 and F<100000 then F=string.format('%0.1f',F/1000)G='KM'else F=string.format('%0.0f',F)G='M'end;local a0=[[
                   .sight1 {
                      position: absolute;
                      opacity: 0;
                      left: 0;
                      top: 0;
                   }
                   ]]if wslot_1~=nil then O=[[<text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 22px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="312">]]..GHUD_1_chance_weapon_slot..[[</text>
                      <rect x="280" y="322" width="340" height="29.245" rx="15" style="fill: url(#hit1_gradient);"></rect>
                      <text style="fill: yellow; font-family: verdana; font-size: 25px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="345.267">]]..math.floor(pr1*100)..[[</text>]]end;if GHUD_hit_chance_2_weapons==true and wslot_2~=nil then P=[[<text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 22px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="378.051">]]..GHUD_2_chance_weapon_slot..[[</text>
                      <rect x="280" y="389" width="340" height="29.245" rx="15" style="fill: url(#hit2_gradient);"></rect>
                      <text style="fill: yellow; font-family: verdana; font-size: 25px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="453.168" y="413.267">]]..math.floor(pr2*100)..[[</text>]]end;if C[3]>0 then local D=screenWidth*C[1]-a-GHUD_AR_sight_size/2;local E=screenHeight*C[2]-b-GHUD_AR_sight_size/2;a0=[[
                      .sight1 {
                         position: absolute;
                         width: ]]..GHUD_AR_sight_size..[[px;
                         height: ]]..GHUD_AR_sight_size..[[px;
                         left: ]]..D..[[px;
                         top: ]]..E..[[px;
                      }]]end;N=[[
                   <style>
                   ]]..a0 ..[[
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
                   <stop stop-color="#07e88e" offset="]]..pr1 ..[[" />
                   <stop stop-color="rgb(255, 255, 255)" stop-opacity="0.25" offset="0" />
                   </linearGradient>
                   <linearGradient id="hit2_gradient" x1="0%" x2="100%">
                   <stop stop-color="#07e88e" offset="]]..pr2 ..[[" />
                   <stop stop-color="rgb(255, 255, 255)" stop-opacity="0.25" offset="0" />
                   </linearGradient>
                   </defs>
                   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="195.471" y="203.183"><tspan x="450" y="263.186" style="font-size: 26px; word-spacing: 0px;">]]..Z..[[ M</tspan></text>
                   <text style="fill: ]]..U..[[; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: end;" x="284.824" y="184.186">[]]..Y..[[] ]]..tostring(S):sub(-3)..[[ ]]..X..[[</text>
                   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="450" y="141.186">SPEED</text>
                   <text style="fill: ]]..newcolor..[[; font-family: verdana; font-size: 26px; font-weight: 700; text-anchor: middle;" x="175.339" y="105.183"><tspan x="512.868" y="141.186" style="font-size: 26px; word-spacing: 0px;">]]..znak..[[</tspan></text>
                   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px;" x="668" y="224.186">MAX SPEED</text>
                   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="174.41" y="224.186">DPS (WIP)</text>
                   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="752.841" y="263.186">]]..W..[[</text>
                   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" y="184.186" x="450">]]..n..[[</text>
                   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="300" y1="115" x2="300" y2="275"></line>
                   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="600" y1="115" x2="600" y2="275"></line>
                   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="450" y1="-270" x2="450" y2="580" transform="matrix(0.000001, 1, -1, 0.000001, 604.99955, -295.000155)"></line>
                   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: end;" x="227.808" y="141.186">TARGET</text>
                   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="450" y1="-230" x2="450" y2="620" transform="matrix(0.000001, 1, -1, 0.000001, 644.99955, -255.000195)"></line>
                   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px;" x="670" y="141.186">DISTANCE</text>
                   <text style="fill: ]]..newcolor2 ..[[; font-family: verdana; font-size: 26px; font-weight: 700; text-anchor: start;" x="465.532" y="106.864" transform="matrix(1, 0, 0, 1, 20.938997, -1.681)"><tspan x="803.061" y="142.867" style="font-size: 26px; word-spacing: 0px;">]]..znak2 ..[[<tspan x="803.0609741210938" dy="1em">​</tspan></tspan></text>
                   <line style="fill: rgba(255, 255, 255, 0.25); stroke: rgba(255, 255, 255, 0.25); stroke-width: 5px; stroke-linecap: round;" x1="450" y1="-190" x2="450" y2="660" transform="matrix(0.000001, 1, -1, 0.000001, 684.99955, -215.000235)"></line>
                   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" y="184.186" x="751.656">]]..F..[[ ]]..G..[[</text>
                   <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" x="450" y="224.186">DAMAGE</text>
                   <text style="fill: white; font-family: verdana; font-size: 26px; font-weight: 700; paint-order: stroke; stroke: rgb(0, 0, 0); stroke-width: 2px; text-anchor: middle;" y="263.186" x="171.092">OUT - INC</text>
                   ]]..O..[[
                   ]]..P..[[
                   </svg></div>]]else local _=c+400000*vec3(construct.getWorldOrientationForward())local C=library.getPointOnScreen({_.x,_.y,_.z})if C[3]>0 then local D=screenWidth*C[1]-a-GHUD_AR_sight_size/2;local E=screenHeight*C[2]-b-GHUD_AR_sight_size/2;N=[[
                      <style>
                      .sight1 {
                         position: absolute;
                         width: ]]..GHUD_AR_sight_size..[[px;
                         height: ]]..GHUD_AR_sight_size..[[px;
                         left: ]]..D..[[px;
                         top: ]]..E..[[px;
                      }
                      </style>
                      <div class="sight1">
                      <?xml version="1.0" encoding="utf-8"?>
                      <svg viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xmlns="http://www.w3.org/2000/svg">
                      <path style="fill: ]]..GHUD_AR_sight_color..[[;" d="M 231.231 440.732 C 230.524 444.711 227.058 447.508 223.154 447.508 C 222.675 447.508 222.191 447.465 221.705 447.379 C 141.949 433.179 78.822 370.052 64.621 290.296 C 63.825 285.83 66.802 281.564 71.268 280.769 C 75.729 279.975 80 282.95 80.794 287.416 C 93.793 360.422 151.578 418.207 224.583 431.205 C 229.051 432.001 232.026 436.266 231.231 440.732 Z M 71.268 231.231 C 71.754 231.318 72.239 231.36 72.717 231.36 C 76.621 231.36 80.087 228.563 80.794 224.584 C 93.793 151.578 151.578 93.793 224.583 80.795 C 229.049 80 232.026 75.734 231.23 71.269 C 230.435 66.802 226.166 63.829 221.704 64.622 C 141.948 78.822 78.821 141.949 64.62 221.705 C 63.825 226.171 66.802 230.436 71.268 231.231 Z M 440.732 280.769 C 436.273 279.976 432.001 282.951 431.206 287.416 C 418.207 360.422 360.422 418.208 287.417 431.206 C 282.951 432.001 279.974 436.267 280.77 440.733 C 281.477 444.712 284.942 447.509 288.847 447.509 C 289.326 447.509 289.81 447.466 290.296 447.38 C 370.052 433.18 433.179 370.052 447.38 290.296 C 448.175 285.83 445.198 281.564 440.732 280.769 Z M 387.492 112.892 L 399.109 124.508 C 423.609 151.152 440.78 184.629 447.38 221.703 C 448.176 226.169 445.199 230.435 440.733 231.23 C 436.27 232.026 432.001 229.049 431.207 224.583 C 425.206 190.887 409.664 160.43 387.49 136.126 L 375.873 124.51 C 351.57 102.336 321.113 86.793 287.417 80.793 C 282.951 79.998 279.974 75.732 280.77 71.266 C 281.565 66.8 285.839 63.825 290.296 64.619 C 327.37 71.22 360.848 88.39 387.492 112.892 Z" transform="matrix(0.707107, 0.707107, -0.707107, 0.707107, 255.999945, -106.038815)"></path>
                      </svg></div>]]end end;local a1=''if GHUD_show_AR_allies_marks==true then for a2,a3 in pairs(radarIDs)do if activeRadar.hasMatchingTransponder(a3)==1 then local a4=activeRadar.getConstructWorldPos(a3)local a5=''if friendsData[a3]~=nil then a5=friendsData[a3].tag end;local a6=library.getPointOnScreen({a4[1],a4[2],a4[3]})if a6[3]>0 then local w=screenWidth*a6[1]-a-GHUD_AR_allies_border_size/2;local x=screenHeight*a6[2]-b-GHUD_AR_allies_border_size/2;a1=a1 ..[[
                            <style>
                            .id]]..a3 ..[[ {
                               position: absolute;
                               width: ]]..GHUD_AR_allies_border_size..[[px;
                               height: ]]..GHUD_AR_allies_border_size..[[px;
                               left: ]]..w..[[px;
                               top: ]]..x..[[px;
                            }
                            </style>
                            <div class="id]]..a3 ..[["><?xml version="1.0" encoding="utf-8"?>
                            <svg viewBox="0 0 500 500" xmlns="http://www.w3.org/2000/svg">
                            <rect x="235" y="235" width="30" height="30" style="fill: rgba(0,0,0,0); stroke: ]]..GHUD_AR_allies_border_color..[[; stroke-width: 2"/>
                            <text style="fill: ]]..GHUD_AR_allies_font_color..[[; font-family: Arial, sans-serif; font-size: 28px; font-weight: 700; text-anchor: middle;" transform="matrix(0.609174, 0, 0, 0.609176, 250.000005, 229)">]]..tostring(a3):sub(-3)..[[</text>
                            <text style="fill: ]]..GHUD_AR_allies_font_color..[[; font-family: Arial, sans-serif; font-size: 28px; font-weight: 700; text-anchor: middle;" transform="matrix(0.609174, 0, 0, 0.609176, 250.000005, 214)">]]..a5 ..[[</text>
                            </svg></div>]]end end end end;local a7=''local a8=''local a9=''if GHUD_show_hits==true then for a2,a3 in pairs(lastHitTime)do if lastHitTime[a2]~=nil then lastHitTime[a2].time=lastHitTime[a2].time+0.025;lastHitTime[a2].hitOpacity=lastHitTime[a2].hitOpacity-0.015;local aa=GHUD_hits_misses_Y-lastHitTime[a2].time*3.25;local ab=GHUD_hit_X+lastHitTime[a2].time*2;if lastHitTime[a2].hitOpacity<=0 then lastHitTime[a2].hitOpacity=0 end;local ac=[[
                         <style>
                         .hit]]..a2 ..[[ {
                            top: ]]..aa..[[vh;
                            left: ]]..ab..[[%;
                            position: absolute;
                            text-alight: center;
                            font-size: 40px;
                            font-family: verdana;
                            font-style: normal;
                            font-weight: bold;
                            color: #FFB12C;
                            opacity: ]]..lastHitTime[a2].hitOpacity..[[;
                            transform: translate(-50%, -50%);
                         }
                         </style>
                         <div class="hit]]..a2 ..[[">]]..lastHitTime[a2].damage..[[</div>]]hits[a2]={html=ac}if lastHitTime[a2].time>=2 then hits[a2]={html=''}if lastHitTime[a2].anims==hitAnimations then hits[a2]=nil;hits={}hitAnimations=0;lastHitTime={}end end end end end;if GHUD_show_misses==true then for a2,a3 in pairs(lastMissTime)do if lastMissTime[a2]~=nil then lastMissTime[a2].time=lastMissTime[a2].time+0.025;lastMissTime[a2].missOpacity=lastMissTime[a2].missOpacity-0.015;local aa=GHUD_hits_misses_Y-lastMissTime[a2].time*3.25;local ad=GHUD_miss_X-lastMissTime[a2].time*2;if lastMissTime[a2].missOpacity<=0 then lastMissTime[a2].missOpacity=0 end;local ae=[[
                         <style>
                         .miss]]..a2 ..[[ {
                            top: ]]..aa..[[vh;
                            left: ]]..ad..[[%;
                            position: absolute;
                            text-alight: center;
                            font-size: 40px;
                            font-family: verdana;
                            font-style: normal;
                            font-weight: bold;
                            color: #fc033d;
                            opacity: ]]..lastMissTime[a2].missOpacity..[[;
                            transform: translate(-50%, -50%);
                         }
                         </style>
                         <div class="miss]]..a2 ..[[">MISS</div>]]misses[a2]={html=ae}if lastMissTime[a2].time>=2 then misses[a2]={html=''}if lastMissTime[a2].anims==missAnimations then misses[a2]=nil;misses={}missAnimations=0;lastMissTime={}end end end end end;if GHUD_show_hits==true then for a2,a3 in pairs(hits)do if hits[a2]~=nil then a7=a7 ..hits[a2].html end end end;if GHUD_show_misses==true then for a2,a3 in pairs(misses)do if misses[a2]~=nil then a8=a8 ..misses[a2].html end end end;for a2,a3 in pairs(target)do if target[a2]~=nil then if target[a2].left>85 and target[a2].one==true then target[a2].left=target[a2].left-0.3 end;if target[a2].left<=85 then target[a2].left=85;target[a2].one=false end;local af=[[
                      <style>
                      .targ]]..a2 ..[[ {
                         position: relative;
                         color: ]]..target[a2].color..[[;
                         top: calc(-]]..GHUD_Y..[[vh + ]]..GHUD_radar_notifications_Y..[[vh + 68px);
                         left: ]]..target[a2].left..[[%;
                         opacity: ]]..target[a2].opacity..[[;
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
                      <div class="targ]]..a2 ..[[">[]]..target[a2].size1 ..[[] ]]..target[a2].id..[[ ]]..target[a2].name1 ..[[</div>]]targets[a2]={html=af}if target[a2].one==false then target[a2].delay=target[a2].delay+1;if target[a2].delay>=100 then target[a2].opacity=target[a2].opacity-0.01;if target[a2].opacity<=0 and target[a2].cnt==count then target[a2]=nil;target={}targets={}count=0 end end end end end;for a2,a3 in pairs(targets)do if targets[a2]~=nil then a9=a9 ..targets[a2].html end end;local ag=[[
                <html>
                <style>
                html,body {
                   margin:0;
                   padding:0;
                   overflow: hidden;
                }
                .shield1 {
                   position: absolute;
                   width: ]]..GHUD_shield_panel_size..[[em;
                   top: ]]..GHUD_shield_panel_Y..[[%;
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
                </style>
                <body>
                ]]..t..[[
                ]]..a1 ..[[
                ]]..q..[[
                ]]..p..[[
                ]]..r..[[
                ]]..s..[[
                ]]..message..[[
                ]]..gunnerHUD..[[
                ]]..vectorHUD..[[
                ]]..a8 ..[[
                ]]..a7 ..[[
                ]]..N..[[
                ]]..j..[[
                ]]..i..[[]]local ah=[[
                <div class="safez">]]..safetext..[[</div>
                <div class="pipe">]]..pD()..[[</div>
                <div class="center1"></div>
                <div class="right1">THRUST<br><div class="thrust1">]]..k..[[</div><orange1>%</orange1><br>SPEED<br><div class="speed1">]]..n..[[</div><orange1>KM/H</orange1><mspeed> ]]..o..[[</mspeed><br>ACCEL<br><div class="accel1">]]..l..[[</div><orange1>G</orange1><br>BRAKE-DIST<br><div class="brakedist">]]..brakeDist..[[</div><orange1>]]..brakeS..[[</orange1></div>
                <div class="left1">SHIELD<div class="shield2"><svg viewBox="0 0 100 100" fill="none" stroke="]]..shieldColor..[[" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" xmlns="http://www.w3.org/2000/svg">
                <path d="M 50 60 C 50 60 58 56 58 50 L 58 43 L 50 40 L 42 43 L 42 50 C 42 56 50 60 50 60 Z"/>
                <text style="fill: rgb(0, 191, 255); font-family: verdana; font-size: 13px; font-weight: 700; stroke-width: 0px; text-anchor: middle;" x="50" y="53.737">]]..shieldIcon..[[</text>
                </svg></div><br><div class="shieldtext">]]..f..[[</div><orange1>%</orange1><br>FUEL<div class="fuel1"><svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
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
                <text style="fill: ]]..GHUD_shield_text_color..[[; font-family: Arial, sans-serif; font-size: 20px; font-weight: 700; paint-order: stroke; stroke: ]]..GHUD_shield_text_stroke_color..[[; stroke-width: 1.25px; text-anchor: middle;" x="252" y="257.079">]]..f..[[%</text>
                ]]..AM_res..[[
                ]]..EM_res..[[
                ]]..KI_res..[[
                ]]..TH_res..[[
                </svg></div>
                <div class="pos1">]]..pp1 ..[[</div>
                </body>
                </html>]]if map==0 and helper==false and helper1==false then system.setScreen(ag..ah..a9)end