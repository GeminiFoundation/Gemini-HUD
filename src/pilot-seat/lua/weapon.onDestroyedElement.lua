local e = system.getItem(elementId) --DeadRank
local n = e['displayName']
system.print(string.format('Destroyed %s on %s',n,activeRadar.getConstructName(targetId)))