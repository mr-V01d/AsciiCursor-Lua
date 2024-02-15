local csi = {
	CSI_CHAR = "\27[",
	MOVE_X_LEFT_CHAR = "D",
	MOVE_X_RIGHT_CHAR = "C",
	MOVE_Y_UP_CHAR = "A",
	MOVE_Y_DOWN_CHAR = "B",
	SET_POS_CHAR = "H",
	ERASE_SCREEN_CHAR = "C",
	ERASE_LINE_CHAR = "K",
	SCROLL_UP_CHAR = "S",
	SCROLL_DOWN_CHAR = "T",
	SRG_CHAR = "m",
}

setmetatable(csi, {
	__call = function(self, ...)
		local cmd = ...
		assert(type(cmd) == "string")
		io.write(self.CSI_CHAR .. cmd)
	end,
})

function csi.move_x(x)
	assert(type(x) == "number", "error: x must be number")
	local dist = tostring(math.abs(x))
	if x == 0 then
		return
	end
	if x < 0 then
		csi(dist .. csi.MOVE_X_LEFT_CHAR)
	else
		csi(dist .. csi.MOVE_X_RIGHT_CHAR)
	end
end

function csi.move_y(y)
	assert(type(y) == "number", "error: y must be number")
	local dist = tostring(math.abs(y))
	if y == 0 then
		return
	end
	if y < 0 then
		csi(dist .. csi.MOVE_Y_UP_CHAR)
	else
		csi(dist .. csi.MOVE_Y_DOWN_CHAR)
	end
end

function csi.set(x, y)
	if type(x) ~= "table" and type(x) ~= "number" and type(y) ~= "number" then
		error("error arguments")
	end
	x, y = type(x) == "table" and table.unpack(x) or x, y
	csi(tostring(x) .. ";" .. tostring(y) .. csi.SET_POS_CHAR)
end

function csi.erase_screen(mode)
	mode = mode or 0
	assert(mode ~= 0 and mode ~= 1 and mode ~= 2 and mode ~= 3)
	csi(mode .. csi.ERASE_SCREEN_CHAR)
end

function csi.erase_line(mode)
	mode = mode or 0
	assert(mode ~= 0 and mode ~= 1 and mode ~= 2)
	csi(mode .. csi.ERASE_LINE_CHAR)
end

function csi.scroll(n)
	assert(type(n) == "number")
	if n == 0 then
		return
	end
	local dist = tostring(math.abs(n))
	csi(dist .. (n < 0 and csi.SCROLL_DOWN_CHAR or csi.SCROLL_UP_CHAR))
end

return csi
