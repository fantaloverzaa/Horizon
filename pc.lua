local NotificationModule = "https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"
local NotificationClient = "https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"

local GamesURL = "https://raw.githubusercontent.com/fantaloverzaa/Horizon/main/S.lua"
local GameFolderURL = "https://raw.githubusercontent.com/fantaloverzaa/Horizon/main/Game/"

getgenv().Unsupported_executors = {
    "xeno",
    "solara"
}

local Executor = (identifyexecutor and identifyexecutor() or "Unknown"):lower()

for _, v in pairs(getgenv().Unsupported_executors) do
    if Executor == v:lower() then
        local NotificationHolder = loadstring(game:HttpGet(NotificationModule))()
        local Notification = loadstring(game:HttpGet(NotificationClient))()

        Notification:Notify(
            {
                Title = "Horizon",
                Description = "PC executor is not supported"
            },
            {
                OutlineColor = Color3.fromRGB(80, 80, 80),
                Time = 5,
                Type = "default"
            }
        )

        return
    end
end

local Games = loadstring(game:HttpGet(GamesURL))()

local PlaceId = tostring(game.PlaceId)
local FallbackScript = nil

for _, v in pairs(Games) do
    if v.ID == nil then
        FallbackScript = v.Link
    end

    if tostring(v.ID) == PlaceId then
        local ScriptURL = GameFolderURL .. v.Link

        loadstring(game:HttpGet(ScriptURL))()
        return
    end
end

if FallbackScript then
    local ScriptURL = GameFolderURL .. FallbackScript

    loadstring(game:HttpGet(ScriptURL))()
    return
end
