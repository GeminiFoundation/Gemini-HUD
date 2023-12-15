map = 1
system.lockView(1)
local gmap = mapGalaxy .. drawMap()
system.setScreen(gmap)
xDelta = xDelta + system.getMouseDeltaX()
yDelta = yDelta + system.getMouseDeltaY()