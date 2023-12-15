if shield.isActive() == 1 then
    local shield_hp = shield.getShieldHitpoints() 
    last_shield_hp = shield_hp
    local HP = shield_hp/shieldMaxHP * 100
    svghp = maxSHP * (HP*0.01)
end