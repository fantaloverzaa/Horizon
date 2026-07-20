local Loader = loadstring(game:HttpGet("https://vanta.my/loader-ui"))()

Loader:Create({
Name = "Horizon",
Status = "Working / Undetected",
LastUpdated = "20/7/2026",
Version = "V1.0.0",
Type = "Free",

-- Optional URL to fetch these statuses live (returns JSON)  
-- ConfigURL = "https://pastebin.com/raw/...",  
  
EnableTOS = false,  
TOSLink = "",  
  
Scripts = {  
    "Loader (PC)"

},
URLs = {
["Loader (PC)"] = "https://github.com/fantaloverzaa/Horizon/blob/main/pc.lua"
}
}
