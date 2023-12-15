newcolor = "white"
znak = ""
newcolor2 = "white"
znak2 = ""
if speedT>lastspeed then newcolor = "#07e88e" znak = "▲" end
if speedT<lastspeed then newcolor = "#fc033d" znak = "▼" end
if distT>lastdist then newcolor2 = "#07e88e" znak2 = "▲" end
if distT<lastdist then newcolor2 = "#fc033d" znak2 = "▼" end
lastspeed = speedT
lastdist = distT
if #loglist ~= 0 then
    if #loglist < 5 then --system print performance
       for i = 1, #loglist do
          system.print(loglist[1])
          table.remove(loglist, 1)
       end
    else
       for i = 1, 5 do
          system.print(loglist[1])
          table.remove(loglist, 1)
       end
    end
 end