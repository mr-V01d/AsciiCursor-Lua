# AsciiCursor-Lua

AsciiCursor-Lua is a lightweight Lua library for manipulating the terminal cursor and colors using ASCII control sequences.

## Installation

You can install AsciiCursor-Lua by simply copying the `cursor` folder into your project and importing it as shown below:

```lua
-- Import AsciiCursor module
require 'cursor'
```

or via luarocks:

```bash
$ luarocks install asciicursor-lua
```

## Usage

Here are some basic functions provided by AsciiCursor-Lua:

### Move Cursor

```lua
-- Move cursor to position (x, y)
Cursor.csi.set(x, y)

-- Move cursor to position specified as a table {x, y}
Cursor.csi.set({x, y})

-- Move cursor horizontally
Cursor.csi.move_x(x)

-- Move cursor vertically
Cursor.csi.move_y(y)
```

### Scroll

```lua
-- Scroll the terminal screen by y lines
Cursor.csi.scroll(y)
```

### Erase

```lua
-- Erase the terminal screen
Cursor.erase_screen()
```

### Set Colors

```lua
-- Set text color to RGB (r, g, b)
Cursor.srg.set_foreground_rgb(r,g,b)

-- Set background color to RGB (r, g, b)
Cursor.srg.set_background_rgb(r,g,b)
```

## Example

```lua
-- Import AsciiCursor module
require 'cursor'

-- Move cursor to position (10, 10)
Cursor.csi.set(10, 10)

-- Set text color to red
Cursor.srg.set_foreground_rgb(255, 0, 0)

-- Output colored text
io.write("Hello, World!")
```

## Contribution

Contributions and feedback are welcome! Feel free to open an issue for bugs, ideas, or suggestions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
