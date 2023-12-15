if shield.isVenting() == 1 then
    shield.stopVenting()
    system.print("Shield venting has been stopped!")
    local shield_hp = shield.getShieldHitpoints()
    last_shield_hp = shield_hp
 else
    if venttime < venttimemax and venttime ~= 0 then
       system.print("Shield venting is already stopped!")
    else
       shield.startVenting()
       local shield_hp = shield.getShieldHitpoints()
       last_shield_hp = shield_hp
       system.print("Shield regeneration started!")
    end
 end