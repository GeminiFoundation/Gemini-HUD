if system.isFirstPerson() ~= 1 and flaunch == false then
    system.showScreen(0)
    slot1.deactivate()
    unit.setTimer('fix',0.1)
end
flaunch = false
