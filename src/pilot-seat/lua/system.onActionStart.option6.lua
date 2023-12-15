if shield.getResistancesCooldown() == 0 and not GHUD_shield_auto_calibration then
   local stress = shield.getStressRatioRaw()
   local resistance = shield.getResistances()
   local res = getRes(stress, resMAX)

   if GHUD_shield_calibration_max then
      if resistance[1] == res[1] and
      resistance[2] == res[2] and
      resistance[3] == res[3] and
      resistance[4] == res[4]then
         --system.print("Максимальный стресс не изменился")
      else
         if shield.setResistances(res[1],res[2],res[3],res[4]) == 1 then
            system.print("Shield power has been set to max stress")
            actionRes(res)
           system.playSound('shieldNewResists.mp3')
         end
      end
   else
      local re1 = gR2D(stress)[1]
      local re2 = gR2D(stress)[2]
      local re3 = gR2D(stress)[3]
      local re4 = gR2D(stress)[4]
      if re1 == resistance[1] and
      re2 == resistance[2] and
      re3 == resistance[3] and
      re4 == resistance[4] then
         --system.print("2 максимальных стресса не изменились")
      else
         if shield.setResistances(re1,re2,re3,re4) == 1 then
            system.print("Shield power has been split 50/50%")
            local re = {re1,re2,re3,re4}
            actionRes(re)
           system.playSound('shieldNewResists.mp3')
         end
      end
   end
end