if tz1 ~= 2 then
    brakeInput = brakeInput + 1
    local longitudinalCommandType = Nav.axisCommandManager:getAxisCommandType(axisCommandId.longitudinal)
    if (longitudinalCommandType == axisCommandType.byTargetSpeed) then
       local targetSpeed = Nav.axisCommandManager:getTargetSpeed(axisCommandId.longitudinal)
       if (math.abs(targetSpeed) > constants.epsilon) then
          Nav.axisCommandManager:updateCommandFromActionStart(axisCommandId.longitudinal, - utils.sign(targetSpeed))
       end
    end
    mybr=true
    tz1=1
 end
if tz1 == 2 and tz2 == 1 then tz2=0 tz1=0 mybr = false end