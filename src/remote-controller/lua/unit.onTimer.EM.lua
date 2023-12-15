em = em + 2
if em_x >= -50 then
    em_x = em_x + 3
end
if em_x >= 0 then em_x = 0 end
EM_res = [[
  <g transform="matrix(1, 0, 0, 1, ]]..em_x..[[, 90)">
  <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: #FFB12C;" rx="6"/>
  <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700; white-space: pre;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
</g>
]]
if em >= 120 then
    em_opacity = em_opacity - 0.01
    EM_res = [[
      <g opacity="]]..em_opacity..[[" transform="matrix(1, 0, 0, 1, 0, 90)">
      <rect x="82" y="199" width="45" height="12" style="stroke: black; stroke-width: 1.5px; fill: #FFB12C;" rx="6"/>
      <text style="fill: rgb(51, 51, 51); font-family: Arial, sans-serif; font-size: 7.87472px; font-weight: 700; white-space: pre;" transform="matrix(0.831276, 0, 0, 0.88892, -62.084976, 26.864447)"><tspan x="179.08" y="202.948">ACTIVATED</tspan></text>
    </g>
]]
if em_opacity <= 0 then
    em_opacity = 1
    em = 0
    em_x = -50
    EM_res = ''
    unit.stopTimer('EM')
end
end