## Loading the Library

Load the source via `loadstring` and initialize a new instance:

```lua
local LoaderLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/StackFlow/refs/heads/main/src.lua"))()
local Library = LoaderLibrary()

local Window = Library.new()
```

## Creating the Window

Once you have a `Window` instance, call `:load()` to initialize it:

```lua
Window:load()
```
