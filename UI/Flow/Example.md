## Loading the Library

Load the source via `loadstring` and initialize a new instance:

```lua
local LoaderLibrary = loadstring(game:HttpGet("https://github.com/fantaloverzaa/Horizon/blob/main/UI/Flow/Library.lua"))()
local Library = LoaderLibrary;
local FlowLibrary = Library;
local Window = FlowLibrary.new();


```

## Creating the Window

Once you have a `Window` instance, call `:load()` to initialize it:

```lua
Window:load()
```

## Creating a Tab

Once your window is loaded, add a tab to it with `:create_tab()`, passing a name and an icon asset ID:

```lua
local Tab = Window:create_tab("Tab", "rbxassetid://10723407389")
```

## Creating a Module/section

Inside a tab, use :create_module() to add a collapsible module/section. It takes a config table:
```lua
local newModule = tab:create_module({
    rich = false,
    section = 'right', -- left , right
    --richtext = "better than neuron x", < you need to enable 'rich' before use this!
    title = "Example Module",
    description = "Sofia is femboy",
    flag = "Protected with moon sec",
    callback = function(a)
        print('Section visible =',a)
    end,
});
```

## Creating a toggle

Inside a module, use :create_toggle() to add a toggle switch:
```lua
local Toggle = newModule:create_toggle({
    title = "Enable Feature",
    flag = "TOGGLE_1",
    default = false,
    callback = function(state)
        print(state)
    end,
})

--[[
Toggle
    {
        ["_state"] = false,
        ["set_state"] = "function",
        ["toggle"] = "function"
    }
]]
```

## Creating a button

Inside a module, use :create_button() to add a clickable button:
```lua
local Button = newModule:create_button({
    title = "Click to Deobfuscate",
    callback = function()
        print('Click!')
    end,
})

--[[
Button
    {
        ["_state"] = false,
        ["fire"] = "function"
    }
]]
```

## Creating a dropdown menu

Inside a module, use :create_dropmenu() to add a dropdown/select menu:
```lua
local DROPMENU = newModule:create_dropmenu({
    options = {
        "OPTION 1",
        "OPTION 2",
        "OPTION 3",
    },

    flag = "dm1",
    title = "Dropmenu",
    callback = function(val)
        print(val)
    end,
})

--[[
Dropmenu
    {
        ["New"] = "function",
        ["_size"] = 51,
        ["_state"] = false,
        ["unfold_settings"] = "function",
        ["update"] = "function"
    }
]]
```

## Creating a slider

Inside a module, use :create_slider() to add a numeric slider:
```lua
local Slider = newModule:create_slider({
    title = "Speed",
    flag = "SLIDER_1",
    min = 0,
    max = 100,
    default = 50,
    suffix = "%",
    callback = function(value)
        print(value)
    end,
})

--[[
Slider
    {
        ["_state"] = 50,
        ["set_value"] = "function"
    }
]]
```
