local function getFile(url, lname)
    local r = http.get(url, nil, true)
    if not r then
        error("Failed to download " .. url)
    end
    local f = fs.open(lname, "wb")
    f.write(r.readAll())
    f.close()
end

local function setupAndPlay()
    local musicFile = "Market.dfpwm"
    if not fs.exists(musicFile) then
        -- Downloading Market.dfpwm from the new URL
        getFile("https://github.com/kacesensitive/dfpwm-music/raw/master/Market.dfpwm", musicFile)
    end
    
    -- Assuming videoplayer can play .dfpwm files or you have a specific player for that.
    -- You might need to adjust this part if a different player is needed.
    shell.run("videoplayer", musicFile)
end

setupAndPlay()
