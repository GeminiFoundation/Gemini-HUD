if shield.isActive() == 0 and shield.isVenting() == 0 then
   shield.activate()
   system.print("SHIELD ONLINE")
else
   if varcombat == 0 then
      shield.deactivate()
      system.print("SHIELD OFFLINE")
   end
end