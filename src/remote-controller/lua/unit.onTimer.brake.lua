fuel_lvl = math.ceil(spacefueltank_1.getItemsVolume()/spacefueltank_1.getMaxVolume() * 100)
FUEL_svg = maxFUEL * (fuel_lvl * 0.01)
local maxBrake = json.decode(unit.getWidgetData()).maxBrake
local dockedMass = 0
for _,id in pairs(construct.getDockedConstructs()) do 
   dockedMass = dockedMass + construct.getDockedConstructMass(id)
end
for _,id in pairs(construct.getPlayersOnBoard()) do 
   dockedMass = dockedMass + construct.getBoardedPlayerMass(id)
end
local mass = construct.getMass()
local speedVec = vec3(construct.getWorldVelocity())
local speed = speedVec:len() * 3.6
local dis = Kinematic.computeDistanceAndTime(speed/3.6,0,mass + dockedMass,0,0,maxBrake)
if dis > 100000 then
   brakeDist = string.format(math.floor((dis/200000) * 10)/10)
   brakeS = "SU"
elseif dis > 1000 then
   brakeDist = string.format(math.floor((dis/1000)*10)/10)
   brakeS = "KM"
else
   brakeDist = string.format(math.floor(dis))
   brakeS = "M"
end