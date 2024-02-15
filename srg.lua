local csi = require("csi")

local srg = {
	NORMAL = 0,
	BOLD = 1,
	FAINT = 2,
	ITALIC = 3,
	UNDERLINE = 4,
	SLOW_BLINK = 5,
	RAPID_BLINK = 6,
	INVERT = 7,
	STRIKE = 9,
	NORMAL_INTECITY = 22,
	NOT_ITALIC = 23,
	NOT_UNDERLINE = 24,
	NOT_BLINKING = 25,
	NOT_INVERT = 27,
	NOT_STRIKE = 29,
}

function srg.set_style(mode)
	mode = mode or 0
	assert(type(mode) == "number")
	csi(mode .. csi.SGR_CHAR)
end

return srg
