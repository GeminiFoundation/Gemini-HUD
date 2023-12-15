if shift==false then
   if GHUD_shield_auto_calibration == true then
      GHUD_shield_auto_calibration = false
      system.print('Shield manual mode activated')
   else
      GHUD_shield_auto_calibration = true
      system.print('Shield auto mode activated')
   end
else
   if GHUD_shield_calibration_max == true then
      GHUD_shield_calibration_max = false
      system.print('Shield 50/50 activated')
   else
      GHUD_shield_calibration_max = true
      system.print('Shield max stress mode activated')
   end
end

if GHUD_shield_auto_calibration == true then
   shieldIcon = "A"
else
   shieldIcon = "M"
end