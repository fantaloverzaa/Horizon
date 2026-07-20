local WindUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Window = WindUI:CreateWindow({
    Title = "Horizon Debug ESP",
    Icon = "eye",
    Folder = "ESP_Settings"
})

local Tab = Window:Tab({
    Title = "ESP"
})


local Settings = {
    Enabled = false,
    Name = false,
    Distance = false,
    Box = false,
    Color = Color3.fromRGB(255,0,0)
}

local Objects = {}


local function ClearESP()
    for _, obj in pairs(Objects) do
        if obj then
            obj:Destroy()
        end
    end

    table.clear(Objects)
end


local function CreateESP(player)
    if player == LocalPlayer then return end
    if not player.Character then return end

    local char = player.Character

    -- Highlight
    if Settings.Enabled then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = char
        highlight.FillColor = Settings.Color
        highlight.OutlineColor = Settings.Color
        highlight.Parent = char

        table.insert(Objects, highlight)
    end


    -- Name + Distance
    if Settings.Name or Settings.Distance then
        local gui = Instance.new("BillboardGui")
        gui.Adornee = char:FindFirstChild("Head")
        gui.Size = UDim2.fromOffset(200,50)
        gui.StudsOffset = Vector3.new(0,3,0)
        gui.AlwaysOnTop = true
        gui.Parent = char

        local text = Instance.new("TextLabel")
        text.Size = UDim2.fromScale(1,1)
        text.BackgroundTransparency = 1
        text.TextColor3 = Settings.Color
        text.TextScaled = true

        local function Update()
            local distance = math.floor(
                (LocalPlayer.Character.HumanoidRootPart.Position -
                char.HumanoidRootPart.Position).Magnitude
            )

            text.Text = ""

            if Settings.Name then
                text.Text ..= player.Name
            end

            if Settings.Distance then
                text.Text ..= " ["..distance.."m]"
            end
        end

        task.spawn(function()
            while gui.Parent do
                Update()
                task.wait(0.2)
            end
        end)

        text.Parent = gui
        table.insert(Objects, gui)
    end
end


local function Refresh()
    ClearESP()

    for _,player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end
end


Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        Refresh()
    end)
end)


Tab:Toggle({
    Title="Enable ESP",
    Default=false,
    Callback=function(v)
        Settings.Enabled=v
        Refresh()
    end
})


Tab:Toggle({
    Title="Name ESP",
    Default=false,
    Callback=function(v)
        Settings.Name=v
        Refresh()
    end
})


Tab:Toggle({
    Title="Distance ESP",
    Default=false,
    Callback=function(v)
        Settings.Distance=v
        Refresh()
    end
})


Tab:Toggle({
    Title="Box ESP",
    Default=false,
    Callback=function(v)
        Settings.Box=v
        -- Add your own box debug object here
    end
})


Tab:ColorPicker({
    Title="ESP Color",
    Default=Settings.Color,
    Callback=function(color)
        Settings.Color=color
        Refresh()
    end
})
