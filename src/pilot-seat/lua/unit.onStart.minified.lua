HUD_version = '1.4.9'
GHUD_marker_name = 'Asteroid' --export: Helios map marker name
GHUD_marker_color = '#c603fc' --export:
GHUD_shield_auto_calibration = true --export: AUTO/MANUAL shield mode
GHUD_shield_calibration_max = true --export: MAX or 50/50 shield mode
GHUD_departure_planet = 'Alioth' --export: Departure name planet
GHUD_destination_planet = 'Jago' --export: Destination name planet
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
GHUD_flight_indicator_size = 25 --export:
GHUD_flight_indicator_color = 'rgb(198, 3, 252)' --export:
GHUD_right_block_X = 65 --export:
GHUD_left_block_X = 65 --export:
GHUD_pipe_text_color = '#FFFFFF' --export:
GHUD_pipe_Y = 0 --export:
GHUD_pipe_X = 22 --export:
GHUD_Y = 48.5 --export:
GHUD_shield_warning_message_Y = 20 --export: Shield low HP warning message
GHUD_brake_Y = 1 -- export: Brake indicator
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
wslot_1=nil;wslot_2=nil;if weapon_1~=nil then for a=1,weapon_size do if a==GHUD_1_chance_weapon_slot then GHUD_1_chance_weapon_slot=weapon[a].getName()wslot_1=weapon[a]end;if a==GHUD_2_chance_weapon_slot then GHUD_2_chance_weapon_slot=weapon[a].getName()wslot_2=weapon[a]end end end;if wslot_1~=nil and GHUD_hit_chance_2_weapons==false then GHUD_selected_target_Y=GHUD_selected_target_Y+3.7 end;atlas=require("atlas")clamp=utils.clamp;stellarObjects=atlas[0]shipPos=vec3(construct.getWorldPosition())safeWorldPos=vec3({13771471,7435803,-128971})damageLine=''ccsLineHit=''damage=0;maxSHP=210;shieldMaxHP=shield.getMaxShieldHitpoints()last_shield_hp=shield.getShieldHitpoints()HP=shield.getShieldHitpoints()/shieldMaxHP*100;svghp=maxSHP*HP*0.01;ccshit=0;maxCCS=139.5;coreMaxStress=core.getMaxCoreStress()last_core_stress=core.getCoreStress()CCS=last_core_stress/coreMaxStress*100;ccshp1=maxCCS*CCS*0.01;ccshp=ccshp1;maxFUEL=maxCCS;fuel_lvl=math.ceil(spacefueltank_1.getItemsVolume()/spacefueltank_1.getMaxVolume()*100)FUEL_svg=maxFUEL*fuel_lvl*0.01;AM_last_stress=0;EM_last_stress=0;TH_last_stress=0;KI_last_stress=0;AM_svg=0;EM_svg=0;TH_svg=0;KI_svg=0;if warpdrive~=nil then avWarp=warpdrive.getRequiredWarpCells()totalWarp=warpdrive.getAvailableWarpCells()else avWarp=0;totalWarp=0 end;function resistance_SVG()local b=shield.getResistances()if b[1]>0 then AM_stroke_color=GHUD_active_resists_border_color;AMstrokeWidth=2 else AM_stroke_color=GHUD_shield_stroke_color;AMstrokeWidth=1 end;if b[2]>0 then EM_stroke_color=GHUD_active_resists_border_color;EMstrokeWidth=2 else EM_stroke_color=GHUD_shield_stroke_color;EMstrokeWidth=1 end;if b[3]>0 then KI_stroke_color=GHUD_active_resists_border_color;KIstrokeWidth=2 else KI_stroke_color=GHUD_shield_stroke_color;KIstrokeWidth=1 end;if b[4]>0 then TH_stroke_color=GHUD_active_resists_border_color;THstrokeWidth=2 else TH_stroke_color=GHUD_shield_stroke_color;THstrokeWidth=1 end end;function actionRes(b)if b[1]>0 then AM_stroke_color=GHUD_active_resists_border_color;AMstrokeWidth=2;unit.setTimer('AM',0.016)else AM_stroke_color=GHUD_shield_stroke_color;AMstrokeWidth=1 end;if b[2]>0 then EM_stroke_color=GHUD_active_resists_border_color;EMstrokeWidth=2;unit.setTimer('EM',0.016)else EM_stroke_color=GHUD_shield_stroke_color;EMstrokeWidth=1 end;if b[3]>0 then KI_stroke_color=GHUD_active_resists_border_color;KIstrokeWidth=2;unit.setTimer('KI',0.016)else KI_stroke_color=GHUD_shield_stroke_color;KIstrokeWidth=1 end;if b[4]>0 then TH_stroke_color=GHUD_active_resists_border_color;THstrokeWidth=2;unit.setTimer('TH',0.016)else TH_stroke_color=GHUD_shield_stroke_color;THstrokeWidth=1 end end;resistance_SVG()am=0;am_x=-50;am_opacity=1;em=0;em_x=-50;em_opacity=1;ki=0;ki_x=339;ki_opacity=1;th=0;th_x=339;th_opacity=1;AM_res=''EM_res=''KI_res=''TH_res=''function damage_SVG()if damage>0 then damage=damage-0.08;damageLine=[[<rect x="]]..svghp+145 ..[[" y="225" width="]]..damage..[[" height="50" style="fill: #de1656; stroke: #de1656;" bx:origin="0.5 0.5"/>]]end;if damage<=0 then damage=0;damageLine=''end;if ccshit>0 then ccshp=ccshp+0.23;if ccshp>=ccshp1 then ccshp=ccshp1;ccsLineHit=''ccshit=0 end end end;function ccs_SVG()if AM_stress~=AM_last_stress then AM_last_stress=AM_stress end;if AM_svg<AM_last_stress then AM_svg=AM_svg+0.01;if AM_svg>=AM_last_stress then AM_svg=AM_last_stress end end;if AM_svg>AM_last_stress then AM_svg=AM_svg-0.01;if AM_svg<=AM_last_stress then AM_svg=AM_last_stress end end;if EM_stress~=EM_last_stress then EM_last_stress=EM_stress end;if EM_svg<EM_last_stress then EM_svg=EM_svg+0.01;if EM_svg>=EM_last_stress then EM_svg=EM_last_stress end end;if EM_svg>EM_last_stress then EM_svg=EM_svg-0.01;if EM_svg<=EM_last_stress then EM_svg=EM_last_stress end end;if TH_stress~=TH_last_stress then TH_last_stress=TH_stress end;if TH_svg<TH_last_stress then TH_svg=TH_svg+0.01;if TH_svg>=TH_last_stress then TH_svg=TH_last_stress end end;if TH_svg>TH_last_stress then TH_svg=TH_svg-0.01;if TH_svg<=TH_last_stress then TH_svg=TH_last_stress end end;if KI_stress~=KI_last_stress then KI_last_stress=KI_stress end;if KI_svg<KI_last_stress then KI_svg=KI_svg+0.01;if KI_svg>=KI_last_stress then KI_svg=KI_last_stress end end;if KI_svg>KI_last_stress then KI_svg=KI_svg-0.01;if KI_svg<=KI_last_stress then KI_svg=KI_last_stress end end end;local c=shield.getStressRatioRaw()AM_stress=c[1]EM_stress=c[2]KI_stress=c[3]TH_stress=c[4]AM_last_stress=c[1]EM_last_stress=c[2]TH_last_stress=c[3]KI_last_stress=c[4]ccs_SVG()function setTag(d)local d=d:sub(5)system.print('Activated new transponder tag "'..d..'"')d={d}transponder.setTags(d)end;function zeroConvertToWorldCoordinates(e)local f=' *([+-]?%d+%.?%d*e?[+-]?%d*)'local g='::pos{'..f..','..f..','..f..','..f..','..f..'}'local h,i,j,k,l=string.match(e,g)if h==nil or i==nil or j==nil or k==nil or l==nil then system.print("Invalid pos!")return vec3()end;if h=="0"and i=="0"then return vec3(j,k,l)end;k=math.rad(k)j=math.rad(j)local m=atlas[tonumber(h)][tonumber(i)]local n=math.cos(j)local o=vec3(n*math.cos(k),n*math.sin(k),math.sin(j))return vec3(m.center)+(m.radius+l)*o end;if databank_1.getStringValue(15)~=""then asteroidPOS=databank_1.getStringValue(15)else asteroidPOS=''end;if GHUD_marker_name==""then GHUD_marker_name="Asteroid"end;asteroidcoord={}if asteroidPOS~=""then asteroidcoord=zeroConvertToWorldCoordinates(asteroidPOS)else asteroidcoord={0,0,0}end;local p={}function iconStatusCheck(q)if q=='on'or q==1 then return'on'else return''end end;function p.player(q)return[[<svg class="icon ]]..iconStatusCheck(q)..[[" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 63.36 198">
<circle class="a" cx="31.68" cy="17.82" r="17.82" />
<path class="a" d="M43.56,41.58H19.8A19.86,19.86,0,0,0,0,61.38v45.54A19.85,19.85,0,0,0,11.88,125v57.12A15.89,15.89,0,0,0,27.72,198h7.92a15.89,15.89,0,0,0,15.84-15.84V125a19.85,19.85,0,0,0,11.88-18.12V61.38A19.86,19.86,0,0,0,43.56,41.58Z" />
</svg>
]]end;function coroutine.xpcall(r)local s={coroutine.resume(r)}if s[1]==false then local t=traceback(r)local u=t:gsub('"%-%- |STDERROR%-EVENTHANDLER[^"]*"','chunk')system.print(u)u=s[2]:gsub('"%-%- |STDERROR%-EVENTHANDLER[^"]*"','chunk')system.print(u)return false,s[2],t end;return table.unpack(s)end;function calcDistance(v,w,x)local z=(w-v):normalize()local A=(x-v):dot(z)/z:dot(z)if A<=0.then return(x-v):len()elseif A>=(w-v):len()then return(x-w):len()end;local B=v+A*z;pipeDistance=(B-x):len()return pipeDistance end;function calcDistanceStellar(C,D,E)local v=vec3(C.center)local w=vec3(D.center)return calcDistance(v,w,E)end;closestPlanet=stellarObjects[1]closestPlanetT=stellarObjects[1]function closestPipe()while true do local F=nil;local G=nil;local a=0;local e=vec3(construct.getWorldPosition())for H in pairs(stellarObjects)do a=a+1;if stellarObjects[H].type[1]~='Asteroid'then local I=vec3(stellarObjects[H].center)local J=vec3(e-I):len()if F==nil or J<F then F=J;G=H end end;if a>30 then a=0;coroutine.yield()end end;a=0;closestPlanet=stellarObjects[G]nearestPipeDistance=nil;for H in pairs(stellarObjects)do a=a+1;if stellarObjects[H].type[1]=='Planet'or stellarObjects[H].isSanctuary==true then for K in pairs(stellarObjects)do if K>H and(stellarObjects[K].type[1]=='Planet'or stellarObjects[K].isSanctuary==true)then pipeDistance=calcDistanceStellar(stellarObjects[H],stellarObjects[K],e)if nearestPipeDistance==nil or pipeDistance<nearestPipeDistance then nearestPipeDistance=pipeDistance;sortestPipeKeyId=H;sortestPipeKey2Id=K end end end end;if a>30 then a=0;coroutine.yield()end end;if e:dist(vec3(stellarObjects[sortestPipeKeyId].center))<e:dist(vec3(stellarObjects[sortestPipeKey2Id].center))then closestPipeData=stellarObjects[sortestPipeKeyId].name[1].." - "..stellarObjects[sortestPipeKey2Id].name[1]else closestPipeData=stellarObjects[sortestPipeKey2Id].name[1].." - "..stellarObjects[sortestPipeKeyId].name[1]end end end;corpos=false;corTime=0;function closestPipe1(e)while true do local L=nil;local M=nil;local a=0;for H in pairs(stellarObjects)do a=a+1;if stellarObjects[H].type[1]~='Asteroid'then local I=vec3(stellarObjects[H].center)local J=vec3(e-I):len()if L==nil or J<L then L=J;M=H end end;if a>5 then a=0;coroutine.yield()end end;a=0;closestPlanetT=stellarObjects[M]local N=nil;for H in pairs(stellarObjects)do a=a+1;if stellarObjects[H].type[1]~='Asteroid'then for K in pairs(stellarObjects)do if K>H and stellarObjects[K].type[1]~='Asteroid'then pipeDistance1=calcDistanceStellar(stellarObjects[H],stellarObjects[K],e)if N==nil or pipeDistance1<N then N=pipeDistance1;sortestPipeKeyId1=H;sortestPipeKey2Id1=K end end end end;if a>5 then a=0;coroutine.yield()end end;distCP=vec3(e):dist(vec3(closestPlanetT.center))if distCP>100000 then distCP=''..string.format('%0.2f',distCP/200000)..' su'elseif distCP>1000 and distCP<100000 then distCP=''..string.format('%0.1f',distCP/1000)..' km'else distCP=''..string.format('%0.0f',distCP)..' m'end;distS1=''if N>=100000 then distS1=''..string.format('%0.2f',N/200000)..' su'elseif N>=1000 and N<100000 then distS1=''..string.format('%0.1f',N/1000)..' km'else distS1=''..string.format('%0.0f',N)..' m'end;if vec3(e):dist(vec3(stellarObjects[sortestPipeKeyId1].center))<vec3(e):dist(vec3(stellarObjects[sortestPipeKey2Id1].center))then closestpip=stellarObjects[sortestPipeKeyId1].name[1].." - "..stellarObjects[sortestPipeKey2Id1].name[1]else closestpip=stellarObjects[sortestPipeKey2Id1].name[1].." - "..stellarObjects[sortestPipeKeyId1].name[1]end;if system.getArkTime()-corTime>4 then corpos=false;system.print('Closest planet: '..closestPlanetT.name[1]..' - '..distCP)system.print('Closest pipe: '..closestpip..' - '..distS1)system.print(safeZone1(asteroidcoord))end end end;function safeZone1(e)local O=e;local P=math.abs;local Q=18000000;local R=500000;local S,T=math.huge;local U=false;local S=vec3(O):dist(safeWorldPos)if S<Q then U=true;local distS=P(S-Q)if distS>100000 then distS=''..string.format('%0.2f',distS/200000)..' su'elseif distS>1000 and distS<100000 then distS=''..string.format('%0.1f',distS/1000)..' km'else distS=''..string.format('%0.0f',distS)..' m'end;local V='Central SZ, distance to PvP - '..distS;return V end;local T=vec3(O):dist(vec3(closestPlanetT.center))if T<R then U=true else U=false end;if P(T-R)<P(S-Q)then local distS=P(T-R)if distS>100000 then distS=''..string.format('%0.2f',distS/200000)..' su'elseif distS>1000 and distS<100000 then distS=''..string.format('%0.1f',distS/1000)..' km'else distS=''..string.format('%0.0f',distS)..' m'end;if U==true then local V=closestPlanetT.name[1]..' - SAFE zone, distance to PvP - '..distS;return V else local V='PvP zone, closest safe zone - '..closestPlanetT.name[1]..' - '..distS;return V end else local distS=P(S-Q)if distS>100000 then distS=''..string.format('%0.2f',distS/200000)..' su'elseif distS>1000 and distS<100000 then distS=''..string.format('%0.1f',distS/1000)..' km'else distS=''..string.format('%0.0f',distS)..' m'end;local V='PvP zone, closest safe zone - Central SZ - '..distS;return V end end;DisplayRadar=false;function drawonradar(W,X)local Y=vec3(construct.getWorldOrientationUp())local Z=vec3(construct.getWorldOrientationForward())local _=vec3(construct.getWorldOrientationRight())local a0=vec3(construct.getWorldPosition())local a1=W-a0;local a2=mySignedAngleBetween(a1,Z,Y)/math.pi;local a3=mySignedAngleBetween(a1,Z,_)/math.pi;local a4=a2*math.sqrt(1-a3*a3/2)*RadarR+RadarX;local a5=a3*math.sqrt(1-a2*a2/2)*RadarR+RadarY;svgradar=svgradar..string.format([[
<circle cx="%f" cy="%f" r="4" fill="red" />
<text x="%f" y="%f" font-size="11px" fill="yellow">%s</text>
]],a4,a5,a4+4,a5,X)end;function mySignedAngleBetween(a6,a7,a8)local a9=a6:project_on_plane(a8):normalize()local aa=a7:normalize()local ab=math.acos(a9:dot(aa))local ac=a6:cross(a7)if ac:dot(a8)<0 then return-ab else return ab end end;playerName=system.getPlayerName(player.getId())xDelta=-238;yDelta=-108;mapScale=.99999;planetScale=1200;aliothsize=8000;moonScale=3000;map=0;warpScan=0;targetList=''lalt=false;shift=false;upB=false;downB=false;leftB=false;rightB=false;safew=''varcombat=construct.getPvPTimer()function pD()if nearestPipeDistance~=nil and closestPipeData~=nil then local ad=''if nearestPipeDistance>=100000 then ad=''..string.format('%0.2f',nearestPipeDistance/200000)..' su'elseif nearestPipeDistance>=1000 and nearestPipeDistance<100000 then ad=''..string.format('%0.1f',nearestPipeDistance/1000)..' km'else ad=''..string.format('%0.0f',nearestPipeDistance)..' m'end;if nearestPipeDistance>=600000 then return closestPipeData..'<br>'..'<green1>'..ad..'</green1>'elseif nearestPipeDistance>=400000 and nearestPipeDistance<=600000 then return closestPipeData..'<br>'..'<orange1>'..ad..'</orange1>'elseif nearestPipeDistance<400000 then return closestPipeData..'<br>'..'<red1>'..ad..'<red1>'end else return""end end;shipName=construct.getName()conID=tostring(construct.getId()):sub(-3)bhelper=false;helper=false;helper1=false;system.showHelper(0)system.showScreen(1)unit.hideWidget()distS=''safetext=''szsafe=true;tz1=0;tz2=0;brakeS=''brakeDist=''planetzone=''function indexSort(ae)local af={}for a=1,#ae do af[a]=a end;table.sort(af,function(ag,ah)return ae[ag]>ae[ah]end)return table.unpack or unpack(af)end;function gR2D(c)local ai={0,0,0,0}local aj,ak=indexSort(c)if c[ak]>0 then ai[aj]=resMAX/2;ai[ak]=resMAX/2 else ai[aj]=resMAX end;return ai end;resMAX=shield.getResistancesPool()function getRes(c,resMAX)local b={0.15,0.15,0.15,0.15}if c[1]>=c[2]and c[1]>=c[3]and c[1]>c[4]then b={resMAX,0,0,0}elseif c[2]>=c[1]and c[2]>=c[3]and c[2]>c[4]then b={0,resMAX,0,0}elseif c[3]>=c[1]and c[3]>=c[2]and c[3]>c[4]then b={0,0,resMAX,0}elseif c[4]>=c[1]and c[4]>=c[2]and c[4]>c[3]then b={0,0,0,resMAX}end;return b end;shoteCount=0;lastShotTime=system.getArkTime()resCLWN=""if GHUD_shield_auto_calibration==true then shieldIcon="A"else shieldIcon="M"end;brakeText=""if shield.isActive()==0 then shieldColor="#fc033d"shieldStatus="DEACTIVE"else shieldColor="#2ebac9"shieldStatus="ACTIVE"end;venttime=0;venttimemax=shield.getVentingMaxCooldown()resisttimemax=shield.getResistancesMaxCooldown()for al in pairs(atlas[0])do local m=atlas[0][al]if m.name[1]==GHUD_destination_planet then DestinationCenter=vec3(m.center)DestinationCenterName=m.name[1]end;if m.name[1]==GHUD_departure_planet then DepartureCenter=vec3(m.center)DepartureCenterName=m.name[1]end end;function safeZone()local O=vec3(construct.getWorldPosition())local P=math.abs;local Q=18000000;local R=500000;local an,ao=math.huge;szsafe=false;planetzone=''local an=vec3(O):dist(safeWorldPos)if an<Q then szsafe=true;distS=P(an-Q)local ap=''local aq=vectorLengthen(safeWorldPos,O,distS)if distS>100000 then distS=string.format('%0.2f',distS/200000)ap='su'elseif distS>1000 and distS<100000 then distS=string.format('%0.1f',distS/1000)ap='km'else distS=string.format('%0.0f',distS)ap='m'end;local V='PvP ZONE'local ar=distS;return V,aq,ar,ap end;ao=vec3(O):dist(vec3(closestPlanet.center))if ao<R then szsafe=true else szsafe=false end;if P(ao-R)<P(an-Q)then distS=P(ao-R)local distS1=distS;local ap=''if distS>100000 then distS=string.format('%0.2f',distS/200000)ap='su'elseif distS>1000 and distS<100000 then distS=string.format('%0.1f',distS/1000)ap='km'else distS=string.format('%0.0f',distS)ap='m'end;if szsafe==true then local V=closestPlanet.name[1]..' PvP ZONE'local aq=vectorLengthen(vec3(closestPlanet.center),O,distS1)local ar=distS;return V,aq,ar,ap else local V=closestPlanet.name[1]..' SAFE ZONE'local aq=vec3(closestPlanet.center)planetzone=closestPlanet.name[1]local ar=distS;return V,aq,ar,ap end else distS=P(an-Q)local ap=''local aq=safeWorldPos;if distS>100000 then distS=string.format('%0.2f',distS/200000)ap='su'elseif distS>1000 and distS<100000 then distS=string.format('%0.1f',distS/1000)ap='km'else distS=string.format('%0.0f',distS)ap='m'end;local V='SAFE ZONE'local ar=distS;return V,aq,ar,ap end end;mybr=false;dis=0;accel=0;resString=""throttle1=0;fuel1=0;blink=1;shieldAlarm=false;alarmTimer=false;t2=nil;function makeVector(as,at)local au=vec3(at).x-vec3(as).x;local y=vec3(at).y-vec3(as).y;local av=vec3(at).z-vec3(as).z;return vec3(au,y,av)end;function vectorLengthen(as,at,aw)local ax=makeVector(as,at)local ay=vec3(ax):len()local az=ay+aw;local aA=az/ay;local aB=ax*aA;local au=vec3(as).x+vec3(aB).x;local y=vec3(as).y+vec3(aB).y;local av=vec3(as).z+vec3(aB).z;local aC=vec3(au,y,av)return aC end;function customDistance(J)local aD=''if J<1000 then aD=''..string.format('%0.0f',J)..' m'elseif J<100000 then aD=''..string.format('%0.1f',J/1000)..' km'else aD=''..string.format('%0.2f',J/200000)..' su'end;return aD end;local function aE(aF,aG,a8)local a9=aF:normalize()local aa=aG:normalize()local aH=a9:dot(aa)aH=utils.clamp(aH,-1,1)local ab=math.acos(aH)local ac=aF:cross(aG)if ac:dot(a8)<0 then return-ab-math.pi else return ab+math.pi end end;local function aI(aJ,aK)local aL=vec3(0,0,1)local aM=aL:project_on_plane(aK)local aN=aJ:project_on_plane(aK)return aE(aM,aN,aK)end;function rotateX3D(aO,aP)aP=aP*math.pi/180;local aQ=math.sin(aP)local aR=math.cos(aP)local y=aO.y*aR-aO.z*aQ;local av=aO.z*aR+aO.y*aQ;aO.y=y;aO.z=av;return aO end;function rotateY3D(aO,aP)aP=aP*math.pi/180;local aQ=math.sin(aP)local aR=math.cos(aP)local au=aO.x*aR-aO.y*aQ;local y=aO.y*aR+aO.x*aQ;aO.x=au;aO.y=y;return aO end;function rotateZ3D(aO,aP)aP=aP*math.pi/180;local aQ=math.sin(aP)local aR=math.cos(aP)local au=aO.x*aR+aO.z*aQ;local av=aO.z*aR-aO.x*aQ;aO.x=au;aO.y=y;return aO end;function drawMap()local aS=""local m=""local aT=""local aU=""local aV=''aV=[[
         <div class="system-map">
         <div class="map-actual" style="transform: perspective(1920px) translateZ(-250px);">
         <div class="map-center" style="transform: translate(-50%, -50%) rotateX(]]..yDelta..[[deg) rotateY(0deg) rotateZ(]]..xDelta..[[deg);"></div>
         ]]for al in pairs(stellarObjects)do local aW=stellarObjects[al]local aX=aW.name[1]local aY=aW.type[1]local aZ=vec3(aW.center)local J=customDistance(vec3(vec3(construct.getWorldPosition())-vec3(aW.center)):len())local a_={x=aZ.x+-aZ.x*mapScale,y=aZ.y+-aZ.y*mapScale,z=aZ.z+-aZ.z*mapScale}rotateY3D(a_,xDelta)rotateX3D(a_,yDelta)local b0=true;local size=planetScale;if vec3(vec3(construct.getWorldPosition())-vec3(aW.center)):len()>12000000 then size=planetScale else size=aliothsize end;local b1="block"if aY~='Planet'then size=moonScale;b1="none"end;local m=[[
            <div class="map-pin" style="display: ]]..b1 ..[[; transform: translate(-50%, -50%) translateX(]]..a_.x..[[px) translateY(]]..a_.y..[[px) translateZ(]]..a_.z..[[px);">
            <div class="pin-data" style="display: ]]..b1 ..[[;">
            <div class="name">]]..aX..[[</div>
            <div class="units">]]..J..[[</div>
            </div>
            <div class="planet" style="width: ]]..aW.radius/size..[[px; height: ]]..aW.radius/size..[[px;"></div>
            </div>
            ]]aV=aV..m end;local b2=construct.getWorldPosition()local b3={x=b2[1]+-b2[1]*mapScale,y=b2[2]+-b2[2]*mapScale,z=b2[3]+-b2[3]*mapScale}rotateY3D(b3,xDelta)rotateX3D(b3,yDelta)local b4=[[
         <div class="map-pin player" style="transform: translate(-50%, -50%) translateX(]]..b3.x..[[px) translateY(]]..b3.y..[[px) translateZ(]]..b3.z..[[px);">
         <div class="pin-data">
         <div class="name"></div>
         </div>
         ]]..p.player()..[[
         </div>
         ]]aV=aV..b4;if asteroidPOS~=""then local b5=asteroidcoord;local J=customDistance(vec3(b5-vec3(construct.getWorldPosition())):len())local b6={x=b5.x+-b5.x*mapScale,y=b5.y+-b5.y*mapScale,z=b5.z+-b5.z*mapScale}rotateY3D(b6,xDelta)rotateX3D(b6,yDelta)local aS=[[
            <div class="map-pin" style="transform: translate(-50%, -50%) translateX(]]..b6.x..[[px) translateY(]]..b6.y..[[px) translateZ(]]..b6.z..[[px);">
            <div class="pin-data">
            <div class="name">]]..GHUD_marker_name..[[</div>
            <div class="units">]]..J..[[</div>
            </div>
            <div class="warp-scan"></div>
            </div>
            ]]aV=aV..aS..'</div></div>'end;aV=aV..'</div></div>'return aV end;mapGalaxy=[[
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
      </style>]]Kinematic={}function Kinematic.computeAccelerationTime(b7,b8,b9)return(b9-b7)/b8 end;function Kinematic.computeDistanceAndTime(b7,b9,ba,bb,bc,bd)bc=bc or 0;bd=bd or 0;local be=b7<b9;local bf=bb/(be and ba or-ba)local bg=-bd/ba;local bh=bf+bg;if b7==b9 then return 0,0 elseif be and bh<=0 or not be and bh>=0 then return-1,-1 end;local bi,bj=0,0;if bf~=0 and bc>0 then local bk=math.pi/bc/2;local aW=function(bl)return bf*(bl/2-bc*math.sin(bk*bl)/math.pi)+bg*bl+b7 end;local bm=be and function(bn)return bn>=b9 end or function(bn)return bn<=b9 end;bj=2*bc;if bm(aW(bj))then local lasttime=0;while math.abs(bj-lasttime)>0.25 do local bl=(bj+lasttime)/2;if bm(aW(bl))then bj=bl else lasttime=bl end end end;local bo=2*bf*bc^2/math.pi^2;bi=bo*(math.cos(bk*bj)-1)+(bf+2*bg)*bj^2/4+b7*bj;if bj<2*bc then return bi,bj end;b7=aW(bj)end;local ag=bf+bg;local bl=Kinematic.computeAccelerationTime(b7,ag,b9)local bp=b7*bl+ag*bl*bl/2;return bi+bp end;if GHUD_radar_notifications_border_radius==true then GHUD_border_radius='15px'else GHUD_border_radius='none'end;GHUD_allies_count1=GHUD_allies_count+1;if GHUD_windowed_mode then GHUD_allies_Y=2 end;GHUD_show_echoes=false;if GHUD_show_echoes==true then statusY=13.5 else statusY=6 end;function hitFnc(bq,br,bs)local bt=''if bq.isOutOfAmmo()~=1 then bt=bq.getAmmo()bt=system.getItem(bt)['displayName']if bt:match("Antimatter")then bt="AM"elseif bt:match("Electromagnetic")then bt="EM"elseif bt:match("Kinetic")then bt="KI"elseif bt:match("Thermic")then bt="TH"end end;if bt~=''then lastAmmo[bq]={ammoName=bt}end;if bt==''then if lastAmmo[bq]~=nil then bt=lastAmmo[bq].ammoName end end;local bu='HIT '..bt..' '..br;if GHUD_show_hits==true then hitAnimations=hitAnimations+1;lastHitTime[hitAnimations]={damage=bu,time=0,hitOpacity=1,anims=hitAnimations}end;if GHUD_print_hits==true then system.print('HIT '..bt..' '..br)end;if totalDamage[bs]~=nil then totalDamage[bs].damage=totalDamage[bs].damage+br else totalDamage[bs]={damage=br}end end;activeRadar=radar_1;activeRadar.setSortMethod(1)radarIDs={}idN=0;GHUD_show_allies=true;screenHeight=system.getScreenHeight()screenWidth=system.getScreenWidth()startTime=system.getArkTime()lastHitTime={}lastMissTime={}hits={}misses={}hitAnimations=0;missAnimations=0;totalDamage={}mRadar={}mWeapons={}size={'XL','L','M','S','XS','ALL'}defaultSize='ALL'sizeState=6;focus=''gunnerHUD=''vectorHUD=''atmovar=false;endload=0;znak=''newcolor="white"znak2=''newcolor2="white"speedT=0;lastspeed=0;distT=0;lastdist=0;pr1=0;pr2=0;playerName=system.getPlayerName(player.getId())warpScan=0;t_radarEnter={}loglist={}radarTarget=nil;newWhitelist={}radarStatic={}radarDynamic={}radarStaticWidget={}radarStaticData={}radarDynamicWidget={}radarDynamicData={}lastAmmo={}radarWidget=''targets={}target={}count=0;gearB=false;friendsData={}pp1=''shipName=construct.getName()local bv=construct.getId()system.print(''..shipName..': '..bv..'')conID=tostring(bv):sub(-3)GHUD_friendly_IDs={}local bw=databank_2.getNbKeys()if bw>0 then for a=1,bw do table.insert(GHUD_friendly_IDs,databank_2.getIntValue(a))end;system.print('Databank whitelist loaded')end;function checkWhitelist()local whitelist=GHUD_friendly_IDs;local bx={}for by,bz in ipairs(whitelist)do bx[bz]=true end;return bx end;function table.contains(table,bA)for by,bB in pairs(table)do if bB==bA then return true end end;return false end;whitelist=checkWhitelist()local bC=100;radarWidgetScale=2;radarWidgetScaleDisplay='<div class="measures"><span>0 SU</span><span>1 SU</span><span>2 SU</span></div>'function defaultRadar()sizeState=6;defaultSize='ALL'if mRadar.friendlyMode==true then mRadar.friendlyMode=false end end;function mRadar:createWidget()self.dataID=self.system.createData(activeRadar.getWidgetData())radarPanel=self.system.createWidgetPanel('')radarWidget=self.system.createWidget(radarPanel,activeRadar.getWidgetType())self.system.addDataToWidget(self.dataID,radarWidget)end;function mRadar:createWidgetNew()self.dataID=self.system.createData(activeRadar.getWidgetData())radarWidget=self.system.createWidget(radarPanel,activeRadar.getWidgetType())self.system.addDataToWidget(self.dataID,radarWidget)end;function mRadar:deleteWidget()self.system.destroyData(self.dataID)self.system.destroyWidget(radarWidget)end;function mRadar:updateLoop()while true do self:updateStep()coroutine.yield()end end;function mRadar:updateStep()local bD={}local bE=activeRadar.getWidgetData()local bF=bE:gmatch('({"constructId":".-%b{}.-})')local bG=next(self.idFilter)~=nil;local a=0;for bH in bF do a=a+1;if a%bC==0 then coroutine.yield()end;local bI=tonumber(bH:match('"constructId":"([%d]*)"'))local size=activeRadar.getConstructCoreSize(bI)local bJ=activeRadar.isConstructIdentified(bI)local bK=activeRadar.isConstructAbandoned(bI)local bL=activeRadar.getTargetId(bI)if bJ==1 or bK==0 or bL==bI and size~=""then if defaultSize=='ALL'then if(whitelist[bI]==true or activeRadar.hasMatchingTransponder(bI)==1)~=self.friendlyMode and activeRadar.getThreatRateFrom(bI)<=2 then goto bM end;if bG and self.idFilter[bI%1000]~=true then goto bM end;bD[#bD+1]=bH:gsub('"name":"(.+)"','"name":"'..tostring(bI):sub(-3)..' - %1"')::bM::elseif size==defaultSize then if(whitelist[bI]==true or activeRadar.hasMatchingTransponder(bI)==1)~=self.friendlyMode and activeRadar.getThreatRateFrom(bI)<=2 then goto bN end;if bG and self.idFilter[bI%1000]~=true then goto bN end;bD[#bD+1]=bH:gsub('"name":"(.+)"','"name":"'..tostring(bI):sub(-3)..' - %1"')::bN::end end end;local bO=(bG and''..focus..' - FOCUS - 'or'')..(self.friendlyMode and''..defaultSize..' - Friends'or''..defaultSize..' - Enemies')local bP=bE:match('"currentTargetId":".+')bP=bP:gsub('"errorMessage":""','"errorMessage":"'..bO..'"')bE='{"constructsList":['..table.concat(bD,",").."],"..bP;self.system.updateData(self.dataID,bE)end;function mRadar:onUpdate()coroutine.resume(self.updaterCoroutine)end;function mRadar:clearIDFilter()self.idFilter={}end;function mRadar:addIDFilter(bQ)self.idFilter[bQ]=true end;function mRadar:onTextInput(text)self:clearIDFilter()focus=text:sub(-3)defaultRadar()if focus=='f'then system.print('Focus mode deactivated')else system.print('Focus ID: '..focus)end;for bQ in text:gmatch('%D(%d%d%d)')do self:addIDFilter(tonumber(bQ))end end;function mRadar:toggleFriendlyMode()self.friendlyMode=not self.friendlyMode end;function mRadar:new(bR)local mRadar={}setmetatable(mRadar,self)self.system=bR;self.friendlyMode=false;self.onlyIdentified=false;self.idFilter={}self:createWidget()self.updaterCoroutine=coroutine.create(function()self:updateLoop()end)return self end;local bS={}local bT={}local bU={}local bV={}local bW={}local bX={}function mWeapons:createWidgets()if not(type(self.weapons)=='table'and#self.weapons>0)then return end;local bY;for a,bZ in ipairs(self.weapons)do if(a-1)%self.weaponsPerPanel==0 then bY=self.system.createWidgetPanel('')end;local b_=self.system.createData(bZ.getWidgetData())self.weaponData[b_]=bZ;bS[b_]=0;self.system.addDataToWidget(b_,self.system.createWidget(bY,bZ.getWidgetType()))end end;function mWeapons:onUpdate()for b_,bZ in pairs(self.weaponData)do local c0=bZ.getWidgetData()local c1=c0:match('"weaponStatus":(%d+)')local c2=tonumber(c0:match('"cycleAnimationRemainingTime":(.-),'))local c3=c0:match('"fireReady":(.-),')local c4=c0:match('"outOfZone":(.-),')local c5=c0:match('"constructId":"(.-)"')local c6=c0:match('"hitProbability":(.-),')local c7=math.floor(tonumber(c6)*100)local c8=c2>bS[b_]bS[b_]=c2;if c1==bT[b_]and bW[b_]==c5 and bU[b_]==c3 and bV[b_]==c4 and bX[b_]==c6 and not c8 then goto c9 end;bT[b_]=c1;bU[b_]=c3;bV[b_]=c4;bW[b_]=c5;bX[b_]=c6;local ca=c0:match('"ammoName":"(.-)"')local cb=false;local cc=""if ca:match("Antimatter")then cc="AM"elseif ca:match("Electromagnetic")then cc="EM"elseif ca:match("Kinetic")then cc="KI"elseif ca:match("Thermic")then cc="TH"elseif ca:match("Stasis")then cc="Stasis"end;local cd=""if ca:match("Precision")then cd="Precision"elseif ca:match("Heavy")then cd="Heavy"elseif ca:match("Agile")then cd="Agile"elseif ca:match("Defense")then cd="Def"end;if string.find(c0,'Stasis')then c0=c0:gsub('"helperId":"(.-)","name":"(.-)"','"helperId":"%1","name":"%2 - '..c7 ..'%%"')else local ce=tonumber(c0:match('"maxDistance":(.-),'))local cf=tonumber(c0:match('"optimalDistance":(.-),'))if ce>=100000 then ce=string.format('%0.2f',ce/200000)..'SU'else ce=string.format('%0.1f',ce/1000)..'KM'end;if cf>=100000 then cf=string.format('%0.2f',cf/200000)..'SU'else cf=string.format('%0.1f',cf/1000)..'KM'end;c0=c0:gsub('"helperId":"(.-)","name":"(.-)"','"helperId":"%1","name":"%2 '..cf..' - '..ce..' - '..c7 ..'%%"')end;c0=c0:gsub('"constructId":"(%d+(%d%d%d))","name":"(.-)"','"constructId":"%1","name":"%2 - %3"')c0=c0:gsub('"ammoName":"(.-)"','"ammoName":"'..cc..' '..cd..'"')if self.system.updateData(b_,c0)~=1 then self.system.print('update error')end::c9::end end;function mWeapons:new(bR,cg,ch)local mWeapons={}setmetatable(mWeapons,self)self.system=bR;self.weapons=cg;self.weaponsPerPanel=ch or 3;self.weaponData={}self:createWidgets()return self end;function coroutine.xpcall(r)local s={coroutine.resume(r)}if s[1]==false then local t=traceback(r)local u=t:gsub('"%-%- |STDERROR%-EVENTHANDLER[^"]*"','chunk')system.print(u)u=s[2]:gsub('"%-%- |STDERROR%-EVENTHANDLER[^"]*"','chunk')system.print(u)return false,s[2],t end;return table.unpack(s)end;function ConvertLocalToWorld(au,y,av)local ci=au*vec3(construct.getWorldRight())local cj=y*vec3(construct.getWorldForward())local ck=av*vec3(construct.getWorldUp())return ci+cj+ck+vec3(construct.getWorldPosition())end;if GHUD_radarWidget_on_top==true then mRadar=mRadar:new(system)if weapon_1~=nil then mWeapons=mWeapons:new(system,weapon,GHUD_weapon_panels)end else if weapon_1~=nil then mWeapons=mWeapons:new(system,weapon,GHUD_weapon_panels)end;mRadar=mRadar:new(system)end;function main()while true do local a=0;local cl=""local cm=""local cn=""local co=0;local cp=0;local cq=0;local cr,cs,ct="","",""local cu=""local cv=""local cw=""local cx=""local cy=""local cz=""local cA=""local cB=""local cC=""radarTarget={}radarStatic={}radarDynamic={}radarDynamicData=radarDynamicWidget;radarDynamicWidget={}radarStaticData=radarStaticWidget;radarStaticWidget={}if radar_2~=nil then if radar_1.getOperationalState()==-1 and atmovar==false then atmovar=true;activeRadar=radar_2;mRadar:deleteWidget()mRadar:createWidgetNew()radarWidgetScale=160;radarWidgetScaleDisplay='<div class="measures"><span>0 KM</span><span>2.5 KM</span><span>5 KM</span></div>'activeRadar.setSortMethod(1)end;if radar_1.getOperationalState()==1 and atmovar==true then atmovar=false;activeRadar=radar_1;mRadar:deleteWidget()mRadar:createWidgetNew()radarWidgetScale=2;radarWidgetScaleDisplay='<div class="measures"><span>0 SU</span><span>1 SU</span><span>2 SU</span></div>'activeRadar.setSortMethod(1)end end;for cD,aW in pairs(radarIDs)do a=a+1;local size=activeRadar.getConstructCoreSize(aW)local cE={}if t_radarEnter[aW]~=nil then if activeRadar.hasMatchingTransponder(aW)==0 and not whitelist[aW]and size~=""and activeRadar.getConstructDistance(aW)<600000 then local cF=activeRadar.getConstructName(aW)local cG=activeRadar.getConstructKind(aW)if activeRadar.isConstructAbandoned(aW)==0 then local cH='NEW TARGET: '..cF..' - Size: '..size..' - '..aW..'\n '..t_radarEnter[aW].pos..''if count<10 then count=count+1;if target[count]==nil then if cG==5 then target[count]={left=100,opacity=1,cnt=count,name1=cF,size1=size,id=tostring(aW):sub(-3),one=true,check=true,delay=0,color='#0258ba'}else target[count]={left=100,opacity=1,cnt=count,name1=cF,size1=size,id=tostring(aW):sub(-3),one=true,check=true,delay=0,color='#9202ba'}end end;system.playSound('enter.mp3')end else local e=activeRadar.getConstructWorldPos(aW)e='::pos{0,0,'..e[1]..','..e[2]..','..e[3]..'}'local cH='NEW TARGET (abandoned): '..cF..' - Size: '..size..' - '..aW..'\n '..e..''table.insert(loglist,cH)if count<10 then count=count+1;if target[count]==nil then target[count]={left=100,opacity=1,cnt=count,name1=cF,size1=size,id=tostring(aW):sub(-3),one=true,check=true,delay=0,color='black'}end end;system.playSound('sonar.mp3')end end;t_radarEnter[aW]=nil end;if GHUD_show_echoes==true then if size~=""then cE.widgetDist=math.ceil(activeRadar.getConstructDistance(aW)/1000*radarWidgetScale)end end;if GHUD_show_allies==true and size~=""then if activeRadar.hasMatchingTransponder(aW)==1 or whitelist[aW]then local cF=activeRadar.getConstructName(aW)local cI=math.floor(activeRadar.getConstructDistance(aW))local cJ=''if activeRadar.hasMatchingTransponder(aW)==1 then local cK=activeRadar.getConstructOwnerEntity(aW)if cK['isOrganization']then cJ=system.getOrganization(cK['id']).tag;friendsData[aW]={tag=cJ}else cJ=system.getPlayerName(cK['id'])friendsData[aW]={tag=cJ}end else cJ='DB'end;if cI>=1000 then cI=''..string.format('%0.1f',cI/1000)..' km ('..string.format('%0.2f',cI/200000)..' su)'else cI=''..cI..' m'end;local cL=tostring(aW):sub(-3)local cM=''..cL..' '..cF..''co=co+1;if activeRadar.getTargetId(aW)~=aW and co<GHUD_allies_count1 then cr=cr..[[
                        <div class="table-row3 th3">
                        <div class="table-cell3">
                        ]]..'['..size..'] '..cM..[[ <allyborder>]]..cJ..[[</allyborder><br><distalliescolor>]]..cI..[[</distalliescolor>
                        </div>
                        </div>]]end;if activeRadar.getTargetId(aW)==aW and co<GHUD_allies_count1 then cr=cr..[[
                        <div class="table-row3 th3S">
                        <div class="table-cell3S">
                        ]]..'['..size..'] '..cM..[[ <allyborder>]]..cJ..[[</allyborder><br><distalliescolor>]]..cI..[[</distalliescolor>
                        </div>
                        </div>]]end;if activeRadar.getTargetId(aW)==aW and co>=GHUD_allies_count1 then cr=cr..[[
                        <div class="table-row3 th3S">
                        <div class="table-cell3S">
                        ]]..'['..size..'] '..cM..[[ <allyborder>]]..cJ..[[</allyborder><br><distalliescolor>]]..cI..[[</distalliescolor>
                        </div>
                        </div>]]end end end;local cN=0;local cO=0;local cP=0;if activeRadar.isConstructIdentified(aW)==1 and size~=""then local cF=activeRadar.getConstructName(aW)local cI=math.floor(activeRadar.getConstructDistance(aW))if cI>=1000 then cI=''..string.format('%0.1f',cI/1000)..' km ('..string.format('%0.2f',cI/200000)..' su)'else cI=''..cI..' m'end;local cQ=tostring(aW):sub(-3)local cR=''..cQ..' '..cF..''isILock=true;cN=math.floor(activeRadar.getConstructSpeed(aW)*3.6)if activeRadar.getTargetId(aW)==aW then cu=cu..[[
                     <div class="table-row2 thS">
                     <div class="table-cellS">
                     ]]..'['..size..'] '..cR..[[ <speedcolor> ]]..cN..[[ km/h</speedcolor><br><distcolor>]]..cI..[[</distcolor>
                     </div>
                     </div>]]else cu=cu..[[
                     <div class="table-row2 th2">
                     <div class="table-cell2">
                     ]]..'['..size..'] '..cR..[[ <speedcolor> ]]..cN..[[ km/h</speedcolor><br><distcolor>]]..cI..[[</distcolor>
                     </div>
                     </div>]]end else if GHUD_show_echoes==true then if size~=""then if activeRadar.getConstructKind(aW)==5 then table.insert(radarDynamic,cE)if radarDynamicWidget[cE.widgetDist]~=nil then radarDynamicWidget[cE.widgetDist]=radarDynamicWidget[cE.widgetDist]+1 else radarDynamicWidget[cE.widgetDist]=1 end else table.insert(radarStatic,cE)if radarStaticWidget[cE.widgetDist]~=nil then radarStaticWidget[cE.widgetDist]=radarStaticWidget[cE.widgetDist]+1 else radarStaticWidget[cE.widgetDist]=1 end end end end end;if(activeRadar.getThreatRateFrom(aW)==2 or activeRadar.getThreatRateFrom(aW)==3 or activeRadar.getThreatRateFrom(aW)==5)and size~=""then cp=cp+1;local cF=string.sub(""..activeRadar.getConstructName(aW).."",1,11)local cI=math.floor(activeRadar.getConstructDistance(aW))if cI>=1000 then cI=''..string.format('%0.1f',cI/1000)..' km ('..string.format('%0.2f',cI/200000)..' su)'else cI=''..cI..' m'end;local cS=tostring(aW):sub(-3)local cT=''..cS..' '..cF..''if activeRadar.getThreatRateFrom(aW)==5 then cq=cq+1;ct=ct..[[
                     <div class="table-row th">
                     <div class="lockedT">
                     <redcolor1>]]..'['..size..'] '..cT..[[</redcolor1><br><distcolor>]]..cI..[[</distcolor>
                     </div>
                     </div>]]else ct=ct..[[
                     <div class="table-row th">
                     <div class="lockedT">
                     <orangecolor>]]..'['..size..'] '..cT..[[</orangecolor><br><distcolor>]]..cI..[[</distcolor>
                     </div>
                     </div>]]end end;if a>50 then a=0;coroutine.yield()end end;if GHUD_show_allies==true then if co>0 then cv="<alliescolor>Allies:</alliescolor><br><countcolor>"..co.."</countcolor> <countcolor2>"..conID.."</countcolor2>"else cv="<alliescolor>Allies:</alliescolor><br><countcolor>0</countcolor> <countcolor2>"..conID.."</countcolor2>"end;cl=htmlbasic..[[
               <style>
               .th3>.table-cell3 {
                  color: ]]..GHUD_allied_names_color..[[;
                  font-weight: bold;
               }
               </style>
               <div class="table3">
               <div class="table-row3 th3">
               <div class="table-cell3">
               ]]..cv..[[
               </div>
               </div>
               ]]..cr..[[
               </div>]]end;cv="<targetscolor>Targets:</targetscolor>"cx=targetshtml..[[
            <style>
            .th2>.table-cell2 {
               color: ]]..GHUD_target_names_color..[[;
               font-weight: bold;
            }
            </style>
            <div class="table2">
            <div class="table-row2 th2">
            <div class="table-cell2">
            ]]..cv..[[<br><countcolor>]]..idN-co..[[</colorcount>
            </div>
            </div>
            ]]..cu..[[
            </div>]]if cp==0 then cw="LOCK"cC="#07e88e"cA="OK"cB=cC else cw="LOCKED:"cC="#FFB12C"cA=cp;cB="rgb(0, 191, 255)"end;if cq>0 then cw="ATTACKED:"cC="#fc033d"cA=cq;cB="rgb(0, 191, 255)"end;cz=[[<style>.radarLockstatus {
               position: fixed;
               background: transparent;
               width: 6em;
               padding: 1vh;
               top: ]]..statusY..[[vh;
               left: 50%;
               transform: translateX(-50%);
               text-align: center;
               fill: ]]..cC..[[;
            }
            </style>
            <div class="radarLockstatus">
            <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 512 512">
            <g>
            <path d="m501,245.6h-59.7c-5.3-93.9-81-169.6-174.9-174.9v-59.7h-20.9v59.7c-93.8,5.3-169.5,81-174.8,174.9h-59.7v20.9h59.7c5.3,93.8 81,169.5 174.9,174.8v59.7h20.9v-59.7c93.9-5.3 169.6-80.9 174.8-174.8h59.7v-20.9zm-80.6,0h-48.1c-4.9-56.3-49.6-100.9-105.9-105.9v-48.1c82.5,5.2 148.8,71.5 154,154zm-69.1,20.8c-4.9,44.7-40.9,80-84.9,84.9v-31.7h-20.9v31.8c-44.8-4.8-80.1-40.1-84.9-84.9h31.8v-20.9h-31.7c4.9-44.7 40.9-80 84.9-84.9v31.7h20.9v-31.7c44,4.9 80,40.2 84.9,84.9h-31.7v20.9h31.6zm-105.7-174.9v48.1c-56.3,4.9-100.9,49.6-105.9,105.9h-48.1c5.2-82.5 71.5-148.8 154-154zm-154,174.8h48.1c4.9,56.3 49.6,100.9 105.9,105.9v48.1c-82.5-5.2-148.8-71.5-154-154zm174.8,154v-48.1c56.3-4.9 100.9-49.6 105.9-105.9h48.1c-5.2,82.5-71.5,148.8-154,154z"/>
            </g>
            <text style="fill: ]]..cB..[[; font-size: 110px; font-weight: bold; text-anchor: middle;" x="256" y="294.054">]]..cA..[[</text>
            </svg>
            </div>]]cy=lockhtml..[[
            <style>
            .th>.table-cell {
               font-weight: bold;
            }
            </style>
            <div class="table">
            <div class="table-row th">
            <div class="table-cell">
            <rightlocked style="color: ]]..cC..[[;">]]..cw..[[</rightlocked>
            </div>
            </div>
            ]]..ct..[[
            </div>]]if GHUD_show_echoes==true then local cU=''for cD,aW in pairs(radarDynamicData)do cU=cU..'<span style="left:'..cD..'px;height:'..aW..'px;"></span>'end;local cV=''for cD,aW in pairs(radarStaticData)do cV=cV..'<span style="left:'..cD..'px;height:'..aW..'px;"></span>'end;local htmlRadar=htmlRadar..[[
               <div class="radar-widget">
               <div class="d-widget">]]..cU..[[</div>
               <div class="s-widget">]]..cV..[[</div>
               <div class="labels">
               <span style="color: #6fc9ff;">DYNAMIC</span>
               <span style="color: #ff8d00;">STATIC</span>
               </div>
               ]]..radarWidgetScaleDisplay..[[
               </div>
               ]]radarWidget=htmlRadar else radarWidget=''end;cm=hudvers..[[<div class="hudversion">GHUD v]]..HUD_version..[[</div>]]if GHUD_show_echoes==true then if GHUD_show_allies==true then gunnerHUD=cl..cx..cy..cm..radarWidget..cz else gunnerHUD=cx..cy..cm..radarWidget..cz end else if GHUD_show_allies==true then gunnerHUD=cl..cx..cy..cm..cz else gunnerHUD=cx..cy..cm..cz end end;coroutine.yield()end end;lockhtml=[[<style>
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
      }</style>]]targetshtml=[[<style>
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
      </style>]]htmlbasic=[[<style>
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
      }</style>]]hudvers=[[
      <style>
      .hudversion {
         position: absolute;
         bottom: 0.15vh;
         color: white;
         right: 5.25vw;
         font-family: verdana;
         letter-spacing: 0.5px;
         font-size: 1.2em;
      }</style>]]htmlRadar=[[
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
      </style>]]function zeroConvertToWorldCoordinates(e,system)local f=" *([+-]?%d+%.?%d*e?[+-]?%d*)"local g="::pos{"..f..","..f..","..f..","..f..","..f.."}"local h,i,j,k,l=string.match(e,g)if h==nil or i==nil or j==nil or k==nil or l==nil then system.print("Invalid POS!")return vec3()end;if h=="0"and i=="0"then return vec3(j,k,l)end;k=math.rad(k)j=math.rad(j)local m=atlas[tonumber(h)][tonumber(i)]local n=math.cos(j)local o=vec3(n*math.cos(k),n*math.sin(k),math.sin(j))return vec3(m.center)+(m.radius+l)*o end;function getPipeD(system)if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then local aD=""local length1=-700*200000;local cW=800*200000;local cX=pos1;local cY=pos2;local pos111=zeroConvertToWorldCoordinates(cX,system)local pos222=zeroConvertToWorldCoordinates(cY,system)local DestinationCenter=vectorLengthen(pos111,pos222,length1)local DepartureCenter=vectorLengthen(pos111,pos222,cW)local cZ=vec3(construct.getWorldPosition())local z=(DestinationCenter-DepartureCenter):normalize()local A=(cZ-DepartureCenter):dot(z)/z:dot(z)if A<=0.then return(cZ-DepartureCenter):len()elseif A>=(DestinationCenter-DepartureCenter):len()then return(cZ-DestinationCenter):len()end;local B=DepartureCenter+A*z;local J=(B-cZ):len()if J<1000 then aD=""..string.format("%0.0f",J).." m"elseif J<100000 then aD=""..string.format("%0.1f",J/1000).." km"else aD=""..string.format("%0.2f",J/200000).." su"end;return aD end end;function getPipeW(system)if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then showMarker=false;local length1=-700*200000;local cW=800*200000;local cX=pos1;local cY=pos2;local pos111=zeroConvertToWorldCoordinates(cX,system)local pos222=zeroConvertToWorldCoordinates(cY,system)local DestinationCenter=vectorLengthen(pos111,pos222,length1)local DepartureCenter=vectorLengthen(pos111,pos222,cW)local cZ=vec3(construct.getWorldPosition())local z=(DestinationCenter-DepartureCenter):normalize()local A=(cZ-DepartureCenter):dot(z)/z:dot(z)if A<=0.then return(cZ-DepartureCenter):len()elseif A>=(DestinationCenter-DepartureCenter):len()then return(cZ-DestinationCenter):len()end;local B=DepartureCenter+A*z;local c_="::pos{0,0,"..math.floor(B.x)..","..math.floor(B.y)..","..math.floor(B.z).."}"system.print("Pipe center")system.setWaypoint(c_)end end;function getPos4Vector(d0)return"::pos{0,0,"..vec3(d0).x..","..vec3(d0).y..","..vec3(d0).z.."}"end;function makeVector(as,at)local au=vec3(at).x-vec3(as).x;local y=vec3(at).y-vec3(as).y;local av=vec3(at).z-vec3(as).z;return vec3(au,y,av)end;function UTC()local d1=curTime-timeZone*3600;return d1 end;function UTCscaner(system)local d1=system.getArkTime()-timeZone*3600;return d1 end;function vectorLengthen(as,at,aw)local ax=makeVector(as,at)local ay=vec3(ax):len()local az=ay+aw;local aA=az/ay;local aB=ax*aA;local au=vec3(as).x+vec3(aB).x;local y=vec3(as).y+vec3(aB).y;local av=vec3(as).z+vec3(aB).z;local aC=vec3(au,y,av)return aC end;function start(unit,system,text)pos1time=0;pos2time=0;tspeed=0;tspeed1=0;mmode=true;deg2rad=math.pi/180;rad2deg=180/math.pi;ms2kmh=3600/1000;kmh2ms=1000/3600;showMarker=true;if GHUD_export_mode==true then system.print("---------------")system.print("The export mode is enabled ALT+G")else system.print("---------------")system.print("The export mode is disabled ALT+G")end;SU=10;calcTargetSpeed=targetSpeed/3.6;meterMarker=0;if databank_1.getStringValue(1)~=""and databank_1.getFloatValue(2)~=0 and databank_1.getStringValue(3)~=""and databank_1.getFloatValue(4)~=0 then system.print("Coordinates from DB are used!")pos1=databank_1.getStringValue(1)pos2=databank_1.getStringValue(3)pos1time=databank_1.getFloatValue(2)pos2time=databank_1.getFloatValue(4)pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)Pos1=pos1;Pos2=pos2;privMySignAngleR=0;privMySignAngleUp=0;privTargetSignAngleR=0;privTargetSignAngleUp=0;targetVector=vec3.new(0,0,0)myAngleR=0;myAngleUp=0;targetAngleR=0;targetAngleUp=0;targetVector=makeVector(zeroConvertToWorldCoordinates(Pos1,system),zeroConvertToWorldCoordinates(Pos2,system))targetTracker=true;curTime=system.getUtcTime()local lasttime=math.floor(curTime-pos2time)local d2=pos11:dist(pos22)local d3=pos2time-pos1time;tspeed=d2/d3;tspeed1=math.floor(d2/d3*3.6)meterMarker1=lasttime*tspeed+tspeed*4;length1=meterMarker1;lengthSU1=string.format("%0.2f",length1/200000*100/100)meterMarker=lasttime*calcTargetSpeed+calcTargetSpeed*4;length=meterMarker;lengthSU=string.format("%0.2f",length/200000*100/100)resultVector1=vectorLengthen(pos11,pos22,length1)Waypoint1=getPos4Vector(resultVector1)system.setWaypoint(Waypoint1)system.print("The target flew 20 km "..lengthSU1 .." su, speed "..tspeed1 .." km/h")unit.setTimer("marker",1)unit.setTimer("vectorhud",0.02)else databank_1.setStringValue(1,"")databank_1.setFloatValue(2,0)databank_1.setStringValue(3,"")databank_1.setFloatValue(4,0)pos1=0;pos2=0;lasttime=0;pos1time=0;pos2time=0;meterMarker=0;meterMarker1=0;Pos1=0;Pos2=0;privMySignAngleR=0;privMySignAngleUp=0;privTargetSignAngleR=0;privTargetSignAngleUp=0;targetVector=vec3.new(0,0,0)targetTracker=false;myAngleR=0;myAngleUp=0;targetAngleR=0;targetAngleUp=0;system.print("Coordinates are missing set new or export")end end;function inTEXT(unit,system,text)if pos1~=0 and string.find(text,"::pos")and not string.find(text,"m::pos")and pos2==0 and GHUD_export_mode==false then pos2=text;databank_1.setStringValue(3,pos2)pos2time=math.floor(system.getUtcTime())databank_1.setFloatValue(4,pos2time)system.print(text.." pos2 saved")pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)local d2=pos11:dist(pos22)local d3=pos2time-pos1time;tspeed=d2/d3;tspeed1=math.floor(d2/d3*3.6)Pos1=pos1;Pos2=pos2;targetVector=makeVector(zeroConvertToWorldCoordinates(Pos1,system),zeroConvertToWorldCoordinates(Pos2,system))targetTracker=true;meterMarker1=meterMarker1+tspeed*4;length1=meterMarker1;resultVector1=vectorLengthen(pos11,pos22,length1)Waypoint1=getPos4Vector(resultVector1)system.setWaypoint(Waypoint1)meterMarker=meterMarker+calcTargetSpeed*4;length=meterMarker;resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)system.print("---------------")system.print("The coordinates are set manually!")posExport1=databank_1.getStringValue(1)posExport2=databank_1.getStringValue(3)timeExport1=math.floor(databank_1.getFloatValue(2))timeExport2=math.floor(databank_1.getFloatValue(4))system.print("The coordinates were exported to screen")screen_1.setCenteredText(posExport1 .."/"..timeExport1 .."/"..posExport2 .."/"..timeExport2)system.print("Target speed: "..tspeed1 .." km/h")unit.setTimer("marker",1)unit.setTimer("vectorhud",0.02)end;if pos1==0 and string.find(text,"::pos")and not string.find(text,"m::pos")and GHUD_export_mode==false then pos1=text;databank_1.setStringValue(1,pos1)pos1time=math.floor(system.getUtcTime())databank_1.setFloatValue(2,pos1time)system.print(text.." pos1 saved")end;if text=="n"then pp1=''unit.stopTimer("marker")showMarker=true;databank_1.setStringValue(1,"")databank_1.setFloatValue(2,0)databank_1.setStringValue(3,"")databank_1.setFloatValue(4,0)pos1=0;pos2=0;lasttime=0;pos1time=0;pos2time=0;meterMarker=0;meterMarker1=0;SU=10;unit.stopTimer("vectorhud")vectorHUD=''Pos1=0;Pos2=0;privMySignAngleR=0;privMySignAngleUp=0;privTargetSignAngleR=0;privTargetSignAngleUp=0;targetVector=vec3.new(0,0,0)targetTracker=false;myAngleR=0;myAngleUp=0;targetAngleR=0;targetAngleUp=0;system.print("---------------")system.print("Coordinates have been deleted, set new coordinates")end;if GHUD_export_mode==true and string.find(text,"/")and not string.find(text,"/::pos")then unit.stopTimer("marker")showMarker=true;databank_1.setStringValue(1,"")databank_1.setFloatValue(2,0)databank_1.setStringValue(3,"")databank_1.setFloatValue(4,0)pos1=0;pos2=0;lasttime=0;pos1time=0;pos2time=0;meterMarker=0;meterMarker1=0;SU=10;unit.stopTimer("vectorhud")vectorHUD=''Pos1=0;Pos2=0;privMySignAngleR=0;privMySignAngleUp=0;privTargetSignAngleR=0;privTargetSignAngleUp=0;targetVector=vec3.new(0,0,0)targetTracker=false;myAngleR=0;myAngleUp=0;targetAngleR=0;targetAngleUp=0;local start=0;local d4=string.find(text,"/",start)-1;pos1=string.sub(text,start,d4)system.print(pos1)start=d4+2;d4=string.find(text,"/",start)-1;pos1time=tonumber(string.sub(text,start,d4))system.print(pos1time)start=d4+2;d4=string.find(text,"/",start)-1;pos2=string.sub(text,start,d4)system.print(pos2)start=d4+2;d4=string.find(text,"/",start)pos2time=tonumber(string.sub(text,start,d4))system.print(pos2time)system.print("---------------")system.print("The coordinates have been loaded successfully!")databank_1.setStringValue(1,pos1)databank_1.setFloatValue(2,pos1time)databank_1.setStringValue(3,pos2)databank_1.setFloatValue(4,pos2time)pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)Pos1=pos1;Pos2=pos2;targetVector=makeVector(zeroConvertToWorldCoordinates(Pos1,system),zeroConvertToWorldCoordinates(Pos2,system))targetTracker=true;oldTime=tonumber(string.sub(text,start,d4))curTime=system.getUtcTime()local lasttime=math.floor(curTime-pos2time)local d2=pos11:dist(pos22)local d3=pos2time-pos1time;tspeed=d2/d3;tspeed1=math.floor(d2/d3*3.6)meterMarker1=lasttime*tspeed+tspeed*4;length1=meterMarker1;lengthSU1=string.format("%0.2f",length1/200000*100/100)meterMarker=lasttime*calcTargetSpeed+calcTargetSpeed*4;length=meterMarker;lengthSU=string.format("%0.2f",length/200000*100/100)resultVector1=vectorLengthen(pos11,pos22,length1)Waypoint1=getPos4Vector(resultVector1)system.setWaypoint(Waypoint1)system.print("The target flew "..lengthSU1 .." su, speed "..tspeed1 .." km/h")system.setWaypoint(Waypoint1)unit.setTimer("marker",1)unit.setTimer("vectorhud",0.02)end;if GHUD_export_mode==true and string.find(text,"/::pos")then unit.stopTimer("marker")showMarker=true;databank_1.setStringValue(1,"")databank_1.setFloatValue(2,0)databank_1.setStringValue(3,"")databank_1.setFloatValue(4,0)pos1=0;pos2=0;lasttime=0;pos1time=0;pos2time=0;meterMarker=0;meterMarker1=0;SU=10;unit.stopTimer("vectorhud")vectorHUD=''Pos1=0;Pos2=0;privMySignAngleR=0;privMySignAngleUp=0;privTargetSignAngleR=0;privTargetSignAngleUp=0;targetVector=vec3.new(0,0,0)targetTracker=false;myAngleR=0;myAngleUp=0;targetAngleR=0;targetAngleUp=0;local start=0;local d4=string.find(text,"/",start)-1;pos1=string.sub(text,start,d4)system.print(pos1)start=d4+2;d4=string.find(text,"/",start)-1;pos1time=tonumber(string.sub(text,start,d4))system.print(pos1time)start=d4+2;d4=string.find(text,"/",start)-1;pos2=string.sub(text,start,d4)system.print(pos2)start=d4+2;d4=string.find(text,"/",start)pos2time=tonumber(string.sub(text,start,d4))system.print(pos2time)system.print("---------------")system.print("The coordinates have been loaded successfully!")databank_1.setStringValue(1,pos1)databank_1.setFloatValue(2,pos1time)databank_1.setStringValue(3,pos2)databank_1.setFloatValue(4,pos2time)pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)Pos1=pos1;Pos2=pos2;targetVector=makeVector(zeroConvertToWorldCoordinates(Pos1,system),zeroConvertToWorldCoordinates(Pos2,system))targetTracker=true;oldTime=tonumber(string.sub(text,start,d4))curTime=system.getUtcTime()local lasttime=math.floor(curTime-pos2time)local d2=pos11:dist(pos22)local d3=pos2time-pos1time;tspeed=d2/d3;tspeed1=math.floor(d2/d3*3.6)meterMarker1=lasttime*tspeed+tspeed*4;length1=meterMarker1;lengthSU1=string.format("%0.2f",length1/200000*100/100)meterMarker=lasttime*calcTargetSpeed+calcTargetSpeed*4;length=meterMarker;lengthSU=string.format("%0.2f",length/200000*100/100)resultVector1=vectorLengthen(pos11,pos22,length1)Waypoint1=getPos4Vector(resultVector1)system.setWaypoint(Waypoint1)system.print("The target flew "..lengthSU1 .." su, speed "..tspeed1 .." km/h")system.setWaypoint(Waypoint1)unit.setTimer("marker",1)unit.setTimer("vectorhud",0.02)end;if string.find(text,"mar")then if showMarker==true then showMarker=false;system.print("Current target position - OFF")end;local d5=tonumber(text:sub(4))if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then local cW=d5*200000;local cX=databank_1.getStringValue(1)local cY=databank_1.getStringValue(3)pos111=zeroConvertToWorldCoordinates(cX,system)pos222=zeroConvertToWorldCoordinates(cY,system)local d6=vectorLengthen(pos111,pos222,cW)local d7=getPos4Vector(d6)system.print(d7 .." waypoint "..d5 .." su")end end end;function tickVector(unit,system,text)if targetTracker==true and targetVector.x~=0 and targetVector.y~=0 and targetVector.z~=0 then local d8=getPipeD(system)local d9=vec3(construct.getWorldOrientationUp()):normalize()local da=vec3(construct.getWorldOrientationRight()):normalize()local db=vec3(construct.getWorldOrientationForward()):normalize()local dc=vec3(construct.getWorldVelocity()):normalize()local dd=dc:project_on_plane(d9)local de=dc:project_on_plane(da)local df=dc:project_on_plane(db)local dg=df:cross(d9):normalize()myAngleR=dd:angle_between(db)local dh=utils.sign(dg:angle_between(db)-math.pi/2)if dh~=0 then myAngleR=myAngleR*dh;privMySignAngleR=dh else myAngleR=myAngleR*privMySignAngleR end;local di=de:cross(d9):normalize()myAngleUp=de:angle_between(-d9)-math.pi/2;local dj=utils.sign(di:angle_between(da)-math.pi/2)if dj~=0 then myAngleUp=myAngleUp*dj;privMySignAngleUp=dj else myAngleUp=myAngleUp*privMySignAngleUp end;local dk=targetVector:normalize()local dl=dk:project_on_plane(d9)local dm=dk:project_on_plane(da)local dn=dk:project_on_plane(db)local dp=dn:cross(d9):normalize()targetAngleR=dl:angle_between(db)local dq=utils.sign(dp:angle_between(db)-math.pi/2)if dq~=0 then targetAngleR=targetAngleR*dq;privTargetSignAngleR=dq else targetAngleR=targetAngleR*privTargetSignAngleR end;local dr=dm:cross(d9):normalize()targetAngleUp=dm:angle_between(-d9)-math.pi/2;local ds=utils.sign(dr:angle_between(da)-math.pi/2)if ds~=0 then targetAngleUp=targetAngleUp*ds;privTargetSignAngleUp=ds else targetAngleUp=targetAngleUp*privTargetSignAngleUp end;targetVectorWidget=[[

            <div class='circle' style='position:absolute;top:50%;left:4%;'>
            <div style='transform: translate(0px, -26px);color:#ffb750;'>]]..string.format("%0.1f",myAngleR*rad2deg)..[[°</div>
            <div style='transform: translate(70px, -45px);color:#f54425;'>]]..string.format("%0.1f",targetAngleR*rad2deg)..[[°</div>
            <div style='transform: translate(20px, 80px);color:#f54425;'>Δ ]]..string.format("%0.1f",myAngleR*rad2deg-targetAngleR*rad2deg)..[[°</div>
            </div>
            <div class='vectorLine' style='top:54.65%;left:4%;background:#ffb750;z-index:30;transform:rotate(]]..myAngleR*rad2deg+90 ..[[deg)'></div>


            <div class='circle' style='position:absolute;top:50%;left:12%;'>
            <div style='transform: translate(0px, -26px);color:#ffb750;'>]]..string.format("%0.1f",myAngleUp*rad2deg)..[[°</div>
            <div style='transform: translate(70px, -45px);color:#f54425;'>]]..string.format("%0.1f",targetAngleUp*rad2deg)..[[°</div>
            <div style='transform: translate(20px, 80px);color:#f54425;'>Δ ]]..string.format("%0.1f",myAngleUp*rad2deg-targetAngleUp*rad2deg)..[[°</div>
            </div>
            <div class='vectorLine' style='top:54.65%;left:12%;background:#ffb750;z-index:30;transform:rotate(]]..myAngleUp*rad2deg+180 ..[[deg)'></div>


            <div class='vectorLine' style='top:54.65%;left:4%;background:#f54425;z-index:29;transform:rotate(]]..targetAngleR*rad2deg+90 ..[[deg)'></div>
            <div class='vectorLine' style='top:54.65%;left:12%;background:#f54425;z-index:29;transform:rotate(]]..targetAngleUp*rad2deg+180 ..[[deg)'></div>
            ]]local dt=[[
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
               <div class="main4">]]..d8 ..[[</div>]]style=[[
               <style>
               .circle {
                  height: 100px;
                  width: 100px;
                  background-color: #555;
                  border-radius: 50%;
                  opacity: 0.5;
                  border: 4px solid white;
               }     .vectorLine{position:absolute;transform-origin: 100% 0%;width: 50px;height:0.15em;}</style>]]if system.getUtcTime()-pos2time>4 then pp1=''end;vectorHUD=style..targetVectorWidget..dt end end;function tickMarker(unit,system,text)if databank_1.getStringValue(1)~=""or databank_1.getStringValue(3)~=""and databank_1.getFloatValue(2)==0 or databank_1.getFloatValue(4)==0 then pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)meterMarker1=meterMarker1+tspeed;length1=meterMarker1;lengthSU1=string.format("%0.2f",length1/200000*100/100)resultVector1=vectorLengthen(pos11,pos22,length1)Waypoint1=getPos4Vector(resultVector1)meterMarker=meterMarker+calcTargetSpeed;length=meterMarker;lengthSU=string.format("%0.2f",length/200000*100/100)resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)if showMarker==true then if mmode==true then system.setWaypoint(Waypoint1,false)system.print("The target flew "..lengthSU1 .." su, speed "..tspeed1 .." km/h")else system.setWaypoint(Waypoint,false)system.print("The target flew "..lengthSU.." su, speed "..targetSpeed.." km/h")end end end end;function altUP(unit,system,text)if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then showMarker=false;SU=SU+2.5;length=SU*200000;pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)system.setWaypoint(Waypoint)system.print(Waypoint.." waypoint "..SU.." su")end end;function altDOWN(unit,system,text)if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then showMarker=false;SU=SU-2.5;length=SU*200000;pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)system.setWaypoint(Waypoint)system.print(Waypoint.." waypoint "..SU.." su")end end;function altRIGHT(unit,system,text)if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then showMarker=false;SU=SU+10;length=SU*200000;pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)system.setWaypoint(Waypoint)system.print(Waypoint.." waypoint "..SU.." su")end end;function altLEFT(unit,system,text)if databank_1.getStringValue(1)~=""and databank_1.getStringValue(3)~=""then showMarker=false;SU=SU-10;length=SU*200000;pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)system.setWaypoint(Waypoint)system.print(Waypoint.." waypoint "..SU.." su")end end;function GEAR(unit,system,text)posExport1=databank_1.getStringValue(1)posExport2=databank_1.getStringValue(3)timeExport1=math.floor(databank_1.getFloatValue(2))timeExport2=math.floor(databank_1.getFloatValue(4))system.print("The coordinates were exported to screen")screen_1.setCenteredText(posExport1 .."/"..timeExport1 .."/"..posExport2 .."/"..timeExport2)end;function radarPos(system,du)local bQ=activeRadar.getTargetId()if bQ~=0 then local cI=activeRadar.getConstructDistance(bQ)local dv=vec3(system.getCameraWorldForward())local dw=vec3(system.getCameraWorldPos())local dx=cI*dv+dw;if pos1~=0 and pos2==0 then pos2='::pos{0,0,'..dx.x..','..dx.y..','..dx.z..'}'databank_1.setStringValue(3,pos2)pos2time=math.floor(system.getUtcTime())databank_1.setFloatValue(4,pos2time)system.print(pos2 .." pos2 saved")pos11=zeroConvertToWorldCoordinates(pos1,system)pos22=zeroConvertToWorldCoordinates(pos2,system)local d2=pos11:dist(pos22)local d3=pos2time-pos1time;tspeed=d2/d3;tspeed1=math.floor(d2/d3*3.6)Pos1=pos1;Pos2=pos2;targetVector=makeVector(zeroConvertToWorldCoordinates(Pos1,system),zeroConvertToWorldCoordinates(Pos2,system))targetTracker=true;meterMarker1=meterMarker1+tspeed*4;length1=meterMarker1;resultVector1=vectorLengthen(pos11,pos22,6000000)Waypoint1=getPos4Vector(resultVector1)system.setWaypoint(Waypoint1)meterMarker=meterMarker+calcTargetSpeed*4;length=meterMarker;resultVector=vectorLengthen(pos11,pos22,length)Waypoint=getPos4Vector(resultVector)system.print("---------------")system.print("The coordinates are set manually!")posExport1=databank_1.getStringValue(1)posExport2=databank_1.getStringValue(3)timeExport1=math.floor(databank_1.getFloatValue(2))timeExport2=math.floor(databank_1.getFloatValue(4))system.print("The coordinates were exported to screen")screen_1.setCenteredText(posExport1 .."/"..timeExport1 .."/"..posExport2 .."/"..timeExport2)system.print("Target speed: "..tspeed1 .." km/h")pp1=tspeed1 ..' km/h'unit.setTimer("vectorhud",0.02)else if pos1==0 then pos1='::pos{0,0,'..dx.x..','..dx.y..','..dx.z..'}'pp1='pos1 saved'databank_1.setStringValue(1,pos1)pos1time=math.floor(system.getUtcTime())databank_1.setFloatValue(2,pos1time)system.print(pos1 .." pos1 saved")else if pos1~=0 and pos2~=0 then unit.stopTimer("marker")showMarker=true;databank_1.setStringValue(1,"")databank_1.setFloatValue(2,0)databank_1.setStringValue(3,"")databank_1.setFloatValue(4,0)pos1=0;pos2=0;lasttime=0;pos1time=0;pos2time=0;meterMarker=0;meterMarker1=0;SU=10;unit.stopTimer("vectorhud")vectorHUD=''Pos1=0;Pos2=0;privMySignAngleR=0;privMySignAngleUp=0;privTargetSignAngleR=0;privTargetSignAngleUp=0;targetVector=vec3.new(0,0,0)targetTracker=false;myAngleR=0;myAngleUp=0;targetAngleR=0;targetAngleUp=0;system.print("---------------")unit.stopTimer("vectorhud")pos1='::pos{0,0,'..dx.x..','..dx.y..','..dx.z..'}'pp1='pos1 saved'databank_1.setStringValue(1,pos1)pos1time=math.floor(system.getUtcTime())databank_1.setFloatValue(2,pos1time)system.print(pos1 .." pos1 saved")end end end end end;start(unit,system,text)local dy=system.getActionKeyName('option1')local dz=system.getActionKeyName('option2')local dA=system.getActionKeyName('option3')local dB=system.getActionKeyName('option4')local dC=system.getActionKeyName('option5')local dD=system.getActionKeyName('option6')local dE=system.getActionKeyName('option7')local dF=system.getActionKeyName('option8')local dG=system.getActionKeyName('option9')local dH=system.getActionKeyName('lshift')local dI=system.getActionKeyName('gear')local dJ=system.getActionKeyName('lalt')local dK=system.getActionKeyName('forward')local dL=system.getActionKeyName('backward')local dM=system.getActionKeyName('up')local dN=system.getActionKeyName('down')local dO=system.getActionKeyName('left')local dP=system.getActionKeyName('antigravity')local dQ=system.getActionKeyName('right')local dR=system.getActionKeyName('yawleft')local dS=system.getActionKeyName('yawright')local dT=system.getActionKeyName('brake')local dU=system.getActionKeyName('light')local dV=system.getActionKeyName('booster')helpHTML1=[[
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
         <ibold>RADAR WIDGET:</ibold>
         <br>
         <br>
         <bdr>]]..dJ..[[</bdr> + <bdr>]]..dN..[[</bdr> : switch between friends/enemies<br>
         <br>
         <bdr>]]..dJ..[[</bdr> + <bdr>]]..dM..[[</bdr> : construct size filter<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>]]..dy..[[</bdr> : add/remove selected target from whitelist<br>
         </div>
         <div class="helper2">
         <ibold>TARGET VECTOR:</ibold>
         <br>
         <br>
         <bdr>]]..dI..[[</bdr> : set pos1/pos2 for radar selected target<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>↓↑</bdr> : move destination ±2.5 su<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>←→</bdr> : move destination ±10 su<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>]]..dJ..[[</bdr> : destination to closest target pipe<br>
         <br>
         <bdr>]]..dJ..[[</bdr> + <bdr>]]..dI..[[</bdr> : on/off export mode<br>
         <br>
         <bdr>]]..dV..[[</bdr> : show/hide current target position (works only when manually setting coordinates or in export mode)<br>
         <br>
         <bdr>]]..dI..[[</bdr> + <bdr>]]..dB..[[</bdr> : switch target position between current speed or targetSpeed from LUA parameters<br>
         </div>
         </div>
         <div class="bottomL">
         <div class="helper3">
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
         <div class="helper4">
         <ibold>TARGET VECTOR LUA COMMANDS:</ibold>
         <br>
         <br>
         <luac>n</luac> : reset pos1/pos2<br>
         <br>
         <luac>mar345</luac> : get position in LUA chat, where 345 is SU ahead of the target<br>
         <br>
         <luac>export</luac> : export coordinates to screen in format - pos1/time1/pos2/time2<br>
         </div>
         </div>
         <div class="helperCenter">GEMINI FOUNDATION<br><br>Pilot Seat Controls 1/2</div>
         <div class="hudversion">GHUD v]]..HUD_version..[[</div>
         </body>
         </html>]]helpHTML2=[[
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
         <bdr>]]..dG..[[</bdr> : start/stop venting<br>
         <br>
         <bdr>]]..dF..[[</bdr> : on/off shield<br>
         <br>
         <bdr>]]..dE..[[</bdr> : switch AUTO/MANUAL shield mode<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>]]..dE..[[</bdr> : switch shield mode between MAX and 50/50 mode<br>
         <br>
         <bdr>]]..dD..[[</bdr> : agree and apply resists in manual shield mode<br>
         <br>
         <bdr>]]..dM..[[</bdr> + <bdr>]]..dy..[[</bdr> : 100% antimatter power<br>
         <br>
         <bdr>]]..dM..[[</bdr> + <bdr>]]..dz..[[</bdr> : 100% electromagnetic power<br>
         <br>
         <bdr>]]..dM..[[</bdr> + <bdr>]]..dA..[[</bdr> : 100% thermic power<br>
         <br>
         <bdr>]]..dM..[[</bdr> + <bdr>]]..dB..[[</bdr> : 100% kinetic power<br>
         <br>
         <bdr>]]..dN..[[</bdr> + <bdr>]]..dy..[[</bdr> : cannon profile<br>
         <br>
         <bdr>]]..dN..[[</bdr> + <bdr>]]..dz..[[</bdr> : railgun profile<br>
         <br>
         <bdr>]]..dN..[[</bdr> + <bdr>]]..dA..[[</bdr> : laser profile<br>
         <br>
         <bdr>]]..dN..[[</bdr> + <bdr>]]..dB..[[</bdr> : universal profile<br>
         </div>
         <div class="helper2">
         <ibold>Other:</ibold>
         <br>
         <br>
         <bdr>]]..dT..[[</bdr> + <bdr>]]..dH..[[</bdr> : lock brake<br>
         <br>
         <bdr>]]..dy..[[</bdr> : show/hide planets and planetary periscope<br>
         <br>
         <bdr>]]..dz..[[</bdr> : set destination to planet #1 (closest pipe planets)<br>
         <br>
         <bdr>]]..dA..[[</bdr> : set destination to closest pipe<br>
         <br>
         <bdr>]]..dB..[[</bdr> : set destination to planet #2 (closest pipe planets)<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>]]..dz..[[</bdr> : set destination to destination planet (LUA parameters)<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>]]..dA..[[</bdr> : set destination to custom pipe Destination - Departure (LUA parameters)<br>
         <br>
         <bdr>]]..dH..[[</bdr> + <bdr>]]..dB..[[</bdr> : set destination to departure planet (LUA parameters)<br>
         <br>
         <bdr>]]..dC..[[</bdr> : Helios system map<br>
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
         <ibold>Other LUA COMMANDS:</ibold>
         <br>
         <br>
         <luac>tag foxtrot</luac> : set transponder tag, where foxtrot is transponder tag<br>
         <br>
         <luac>m::pos{}</luac> : get info about position, safe position to dababank, add position to Helios map and planetary periscope<br>
         <br>
         <luac>drop</luac> : undock all constructs<br>
         <br>
         <luac>helper</luac> : show/hide build helper<br>
         </div>
         </div>
         <div class="helperCenter">GEMINI FOUNDATION<br><br>Pilot Seat Controls 2/2</div>
         <div class="hudversion">GHUD v]]..HUD_version..[[</div>
         </body>
         </html>]]system.print('GHUD Pilot seat v'..HUD_version)system.print(''..dI..' + ←: helper 1')system.print(''..dI..' + →: helper 2')transponder.deactivate()main1=coroutine.create(main)main2=coroutine.create(closestPipe)unit.setTimer('hud',0.016)unit.setTimer('brake',0.15)unit.setTimer('tr',2)unit.setTimer('prealarm',1.5)if warpdrive~=nil then unit.setTimer('warp',35)end;if collectgarbages==true then unit.setTimer('cleaner',30)end