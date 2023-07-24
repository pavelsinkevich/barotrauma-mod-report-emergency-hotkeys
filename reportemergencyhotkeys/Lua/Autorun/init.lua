
REH = {} -- Report Emergency Hotkeys
REH.Name="Report Emergency Hotkeys"
REH.Version = "1.0.0.0" 
REH.VersionNum = 01000000 -- seperated into groups of two digits: 01020304 -> 1.2.3h4; major, minor, patch, hotfix
REH.Path = table.pack(...)[1]

-- config loading
if not File.Exists(REH.Path .. "/config.json") then

    -- create default config if there is no config file
    REH.Config = dofile(REH.Path .. "/Lua/defaultconfig.lua")
    File.Write(REH.Path .. "/config.json", json.serialize(REH.Config))

else

    -- load existing config
    REH.Config = json.parse(File.Read(REH.Path .. "/config.json"))
    
    -- add missing entries
    local defaultConfig = dofile(REH.Path .. "/Lua/defaultconfig.lua")
    for key, value in pairs(defaultConfig) do
        if REH.Config[key] == nil then
            REH.Config[key] = value
        end
    end
end

-- shared code
    
-- server-side code (also run in singleplayer)
if (Game.IsMultiplayer and SERVER) or not Game.IsMultiplayer then

    -- Version and expansion display
    Timer.Wait(function() Timer.Wait(function()
        local runstring = "\n/// Running Report Emergency Hotkeys V "..REH.Version.." ///\n"

        -- add dashes
        local linelength = string.len(runstring)+4
        local i = 0
        while i < linelength do runstring=runstring.."-" i=i+1 end
        print(runstring)
    end,1) end,1)
end

-- client-side code
if CLIENT then
	dofile(REH.Path.."/Lua/Scripts/Client/reportemergencyhotkeys.lua")--client-side
end