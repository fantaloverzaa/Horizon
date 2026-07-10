## Loading the Library

Load the source via `loadstring` and initialize a new instance:

```lua
local LoaderLibrary = loadstring(game:HttpGet("https://github.com/fantaloverzaa/Horizon/blob/main/UI/Flow/Library.lua"))()
local Library = LoaderLibrary()

local Window = Library.new()
```

## Creating the Window

Once you have a `Window` instance, call `:load()` to initialize it:

```lua
Window:load()
```
