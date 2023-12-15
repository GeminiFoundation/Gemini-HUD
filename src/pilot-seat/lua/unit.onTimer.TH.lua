th = th + 2
if th_x <= 339 then
    th_x = th_x - 3
end
if th_x <= 289 then th_x = 289 end
TH_res = [[
  <g transform="matrix(1, 0, 0, 1, ]]..th_x..[[, 0)">
  <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: #FFB12C;" rx="6"/>
  <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700; white-space: pre;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
</g>
]]
if th >= 120 then
    th_opacity = th_opacity - 0.01
    TH_res = [[
      <g opacity="]]..th_opacity..[[" transform="matrix(1, 0, 0, 1, 289, 0)">
      <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: #FFB12C;" rx="6"/>
      <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700; white-space: pre;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
    </g>
]]
if th_opacity <= 0 then
    th_opacity = 1
    th = 0
    th_x = 339
    TH_res = ''
    unit.stopTimer('TH')
end
end