local element = system.getItem(elementId) --DeadRank
local name = element['displayName']
system.print(string.format('Destroyed %s on %s',name,activeRadar.getConstructName(targetId)))