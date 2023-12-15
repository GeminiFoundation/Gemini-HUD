start:
if lalt == true then
    zoom = true
local periscope = [[
<style>
img {
   position: fixed;
   width: 40vw;
   max-height: 100%;
   bottom: 34vh;
   left: 1.8vw;
   border-radius: 8px;
   animation:blinking 0.5s 1;
   border-left: 4px solid ]]..periscope_border_color..[[;
   border-right: 4px solid ]]..periscope_border_color..[[;
}

@keyframes blinking{
   0%{   width: 20vw;  }
   100%{  width: 40vw;   }
}
</style>
<img src="gunner_target.liveview">]]
system.setScreen(periscope)
end

stop:
if zoom == true then
    zoom = false
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
   0%{   width: 40vw;  }
   100%{  width: 20vw;   }
}

</style>
<img src="gunner_target.liveview">]]
system.setScreen(periscope)
end
