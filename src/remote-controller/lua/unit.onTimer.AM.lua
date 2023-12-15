am = am + 2
if am_x >= -50 then
    am_x = am_x + 3
end
if am_x >= 0 then am_x = 0 end
AM_res = [[
    <g transform="matrix(1, 0, 0, 1, ]]..am_x..[[, 0)">
    <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: #FFB12C;" rx="6"/>
    <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
  </g>
]]
if am >= 120 then
    am_opacity = am_opacity - 0.01
    AM_res = [[
    <g opacity="]]..am_opacity..[[" transform="matrix(1, 0, 0, 1, 0, 0)">
    <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: #FFB12C;" rx="6"/>
    <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
  </g>
]]
if am_opacity <= 0 then
    am_opacity = 1
    am = 0
    am_x = -50
    AM_res = ''
    unit.stopTimer('AM')
end
end