ki = ki + 2
if ki_x <= 339 then
    ki_x = ki_x - 3
end
if ki_x <= 289 then ki_x = 289 end
KI_res = [[
  <g transform="matrix(1, 0, 0, 1, ]]..ki_x..[[, 90)">
  <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: rgb(242, 166, 4);" rx="6"/>
  <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700; white-space: pre;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
</g>
]]
if ki >= 120 then
    ki_opacity = ki_opacity - 0.01
    KI_res = [[
      <g opacity="]]..ki_opacity..[[" transform="matrix(1, 0, 0, 1, 289, 90)">
      <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: rgb(242, 166, 4);" rx="6"/>
      <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700; white-space: pre;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
    </g>
]]
if ki_opacity <= 0 then
    ki_opacity = 1
    ki = 0
    ki_x = 339
    KI_res = ''
    unit.stopTimer('KI')
end
end