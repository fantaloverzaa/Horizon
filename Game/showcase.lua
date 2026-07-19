local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local esp = loadstring(game:HttpGet('https://raw.githubusercontent.com/0f76/seere_v3/main/ESP/v3_esp.lua'))()

local Window = Fluent:CreateWindow({
    Title = "ESP Showcase",
    SubTitle = "by horizon",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "ESP", Icon = "" })
}

local Options = Fluent.Options

local Toggle = Tabs.Main:AddToggle("ESP3", {Title = "ESP", Default = false})

Toggle:OnChanged(function(Value)
    esp.enabled = Value
end)

Options.ESP3:SetValue(false)
