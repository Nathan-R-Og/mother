local PLAYER_X = 0x6780+4
local PLAYER_Y = 0x6780+6
local META_X = 0x7400+4
local META_Y = 0x7400+6
local DEBUG_X = 0x73FC
local DEBUG_Y = 0x73FE

function show()
    local x = emu.read16(PLAYER_X, emu.memType.nesDebug) >> 6
    local y = emu.read16(PLAYER_Y, emu.memType.nesDebug) >> 6

    emu.drawString(8, 8, string.format("%d, %d", x, y))
    emu.drawString(8, 16, string.format("%x, %x", x, y))
    
    if emu.isKeyPressed("P") then
    
	    --local x = emu.read16(DEBUG_X, emu.memType.nesDebug)
	    --local y = emu.read16(DEBUG_Y, emu.memType.nesDebug)
	    local x = 509
	    local y = 534
	    x = (x-8) << 6
	    y = (y-7) << 6
	    
    	emu.drawString(8, 24, "Warping...", 0xFFFFFF, 0, 0, 16, 0)
	
    	emu.write16(META_X, x, emu.memType.nesDebug)
    	emu.write16(META_Y, y, emu.memType.nesDebug)
    	
    	-- fade_flag
    	emu.write(0x20, 0x40, emu.memType.nesDebug)
    	-- fade type
    	emu.write(0xe, 0, emu.memType.nesDebug)
    end
end

emu.addEventCallback(show, emu.eventType.endFrame);