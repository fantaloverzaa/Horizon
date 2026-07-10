# Loading the source
### How are we meant to run the script?
```lua
local LoaderLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/StackFlow/refs/heads/main/src.lua"))();
local Library = LoaderLibrary();

local Window = Library.new();
```

# Loading the window
### We need a window right?
```lua
Window:load()
```
