local csi = require("mr-void.cursor.modules.csi")

local srg = {}

--#region Srg Style

srg.style = {
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

function srg.style.set_style(mode)
	mode = mode or 0
	assert(type(mode) == "number")
	csi(mode .. csi.SRG_CHAR)
end

--#endregion

--#region Srg Color
srg.color = {
	SET_FOREGROUND_COLOR_RGB = "38;2;",
	SET_BACKGROUND_COLOR_RGB = "48;2;",
}

function srg.set_background_rgb(r, g, b)
	assert(type(r) == "number" and r >= 0 and r <= 255)
	assert(type(g) == "number" and g >= 0 and g <= 255)
	assert(type(b) == "number" and b >= 0 and b <= 255)
	csi(srg.color.SET_BACKGROUND_COLOR_RGB .. r .. ";" .. g .. ";" .. b .. csi.SRG_CHAR)
end

function srg.set_foreground_rgb(r, g, b)
	assert(type(r) == "number" and r >= 0 and r <= 255)
	assert(type(g) == "number" and g >= 0 and g <= 255)
	assert(type(b) == "number" and b >= 0 and b <= 255)
	csi(srg.color.SET_FOREGROUND_COLOR_RGB .. r .. ";" .. g .. ";" .. b .. csi.SRG_CHAR)
end

--#endregion

return srg
