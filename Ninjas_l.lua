local Vanta = loadstring(game:HttpGet("https://vanta.my/ui"))()

local Window = Vanta:CreateWindow({
    Name = "Horizon",
    Subtitle = "Ninja legends by luka",
})

Vanta:Notify({
    Title = "Success",
    Content = "Your script has successfully loaded!",
    Duration = 5
})

local MainTab = Window:CreateTab("Main", "sword")

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

getgenv().AutoSwing = false
getgenv().AutoSell = false
getgenv().AutoRank = false

task.spawn(function()
    while task.wait() do
        if getgenv().AutoSwing then
            local event = player:FindFirstChild("ninjaEvent")
            if event then
                event:FireServer("swingKatana")
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        if getgenv().AutoSell then
            local gui = player:FindFirstChild("PlayerGui")
            local gameGui = gui and gui:FindFirstChild("gameGui")
            local maxMenu = gameGui and gameGui:FindFirstChild("maxNinjitsuMenu")

            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")

            local sell = workspace:FindFirstChild("sellAreaCircles")
            local circle = sell and sell:FindFirstChild("sellAreaCircle")
            local part = circle and circle:FindFirstChild("circleInner")

            if hrp and part and maxMenu and maxMenu.Visible then
                firetouchinterest(hrp, part, 0)
                task.wait(0.1)
                firetouchinterest(hrp, part, 1)
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if getgenv().AutoRank then
            local event = player:FindFirstChild("ninjaEvent")
            local ranks = ReplicatedStorage:FindFirstChild("Ranks")
            local ground = ranks and ranks:FindFirstChild("Ground")

            if event and ground then
                for _, rank in ipairs(ground:GetChildren()) do
                    event:FireServer("buyRank", rank.Name)
                end
            end
        end
    end
end)


MainTab:CreateSection("Auto Swing")

MainTab:CreateToggle({
    Name = "Auto swing",
    CurrentValue = false,
    Flag = "AutoSwing",
    Callback = function(Value)
        getgenv().AutoSwing = Value

        Vanta:Notify({
            Title = "Auto Swing",
            Content = Value and "Enabled" or "Disabled",
            Duration = 3
        })
    end
})


MainTab:CreateSection("Auto Sell")

MainTab:CreateToggle({
    Name = "Auto sell",
    CurrentValue = false,
    Flag = "AutoSell",
    Callback = function(Value)
        getgenv().AutoSell = Value

        Vanta:Notify({
            Title = "Auto Sell",
            Content = Value and "Enabled" or "Disabled",
            Duration = 3
        })
    end
})


MainTab:CreateSection("Auto Rank")

MainTab:CreateToggle({
    Name = "Auto rank",
    CurrentValue = false,
    Flag = "AutoRank",
    Callback = function(Value)
        getgenv().AutoRank = Value

        Vanta:Notify({
            Title = "Auto Rank",
            Content = Value and "Enabled" or "Disabled",
            Duration = 3
        })
    end
})
