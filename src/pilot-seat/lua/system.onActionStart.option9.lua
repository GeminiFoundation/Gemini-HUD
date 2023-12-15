if shield.isVenting() == 1 then
    shield.stopVenting()
    system.print("Shield venting has been stopped!")
    last_shield_hp = shield.getShieldHitpoints()
 else
    if venttime < venttimemax and venttime ~= 0 then
       system.print("Shield venting is already stopped!")
    else
       shield.startVenting()
       last_shield_hp = shield.getShieldHitpoints()
       system.print("Shield regeneration started!")
    end
 end