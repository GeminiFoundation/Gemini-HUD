-- slot1 is manual switch linked to the programming board 2
periscope_border_color = 'rgba(255, 255, 255, 0.3)' --export:
unit.hideWidget()
flaunch = true
lalt = false
zoom = false
gearB = false
local periscope = [[
<style>
img {
   position: fixed;
   width: 20vw;
   max-height: 100%;
   bottom: 34vh;
   left: 1.8vw;
   border-radius: 8px;
   animation:blinking 0.5s 1;
   border-left: 4px solid ]]..periscope_border_color..[[;
   border-right: 4px solid ]]..periscope_border_color..[[;
}
@keyframes blinking{
   0%{   width: 0vw;  }
   100%{  width: 20vw;   }
}
</style>
<img src="gunner_target.liveview">]]
system.playSound('periscope.mp3')
system.setScreen(periscope)
system.showScreen(1)