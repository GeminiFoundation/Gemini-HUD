if shield.isActive() == 1 then
    last_shield_hp = shield.getShieldHitpoints()
    local HP = shield_hp/shieldMaxHP * 100
    svghp = maxSHP * (HP*0.01)
end