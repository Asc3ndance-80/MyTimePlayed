-- TimePlayed.lua

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("TIME_PLAYED_MSG")

-- Flag to suppress chat messages
local suppressTimePlayedMessage = false
local TIME_PLAYED_PATTERNS = {
    "Total time played:",
    "Time played this level:",
    "Time played this class:"
}

-- Function to format time
local function FormatTime(totalTime)
    local years = math.floor(totalTime / 31536000) -- 365 days * 86400 seconds
    local days = math.floor((totalTime % 31536000) / 86400)
    local hours = math.floor((totalTime % 86400) / 3600)
    local minutes = math.floor((totalTime % 3600) / 60)

    local timeParts = {}
    if years > 0 then table.insert(timeParts, string.format("%d yrs", years)) end
    if days > 0 then table.insert(timeParts, string.format("%d days", days)) end
    if hours > 0 then table.insert(timeParts, string.format("%d hrs", hours)) end
    if minutes > 0 then table.insert(timeParts, string.format("%d mins", minutes)) end

    return #timeParts > 0 and table.concat(timeParts, ", ") or "Less than a minute"
end

-- Function to set up the time display in the Character Info page
local function SetupTimeDisplay()
    -- Initialize SavedVariables
    if not TimePlayedDB then
        TimePlayedDB = {}
    end

    -- Create the text string in the PaperDollFrame, locked to "Above"
    TimePlayedText = PaperDollFrame:CreateFontString("TimePlayedText", "OVERLAY", "GameFontNormal")
    TimePlayedText:SetPoint("BOTTOM", PaperDollFrame, "TOP", 0, 5)
    TimePlayedText:SetText("Time Played: Click to see time played")

    -- Create background texture
    TimePlayedBG = PaperDollFrame:CreateTexture("TimePlayedBG", "BACKGROUND")
    TimePlayedBG:SetPoint("TOPLEFT", TimePlayedText, "TOPLEFT", -5, 5)
    TimePlayedBG:SetPoint("BOTTOMRIGHT", TimePlayedText, "BOTTOMRIGHT", 5, -7)

    -- Create white border textures (top, left, right; bottom stays hidden)
    TimePlayedBorderTop = PaperDollFrame:CreateTexture("TimePlayedBorderTop", "BORDER")
    TimePlayedBorderTop:SetPoint("TOPLEFT", TimePlayedBG, "TOPLEFT", -2, 2) 
    TimePlayedBorderTop:SetPoint("TOPRIGHT", TimePlayedBG, "TOPRIGHT", 2, 2)
    TimePlayedBorderTop:SetHeight(2)

    TimePlayedBorderLeft = PaperDollFrame:CreateTexture("TimePlayedBorderLeft", "BORDER")
    TimePlayedBorderLeft:SetPoint("TOPLEFT", TimePlayedBG, "TOPLEFT", -2, 0)
    TimePlayedBorderLeft:SetPoint("BOTTOMLEFT", TimePlayedBG, "BOTTOMLEFT", -2, 0)
    TimePlayedBorderLeft:SetWidth(2)

    TimePlayedBorderRight = PaperDollFrame:CreateTexture("TimePlayedBorderRight", "BORDER")
    TimePlayedBorderRight:SetPoint("TOPRIGHT", TimePlayedBG, "TOPRIGHT", 2, 0)
    TimePlayedBorderRight:SetPoint("BOTTOMRIGHT", TimePlayedBG, "BOTTOMRIGHT", 2, 0)
    TimePlayedBorderRight:SetWidth(2)

    -- Apply saved border color or default to white
    local borderColor = TimePlayedDB.borderColor or {1, 1, 1, 1} -- Default white
    TimePlayedBorderTop:SetColorTexture(unpack(borderColor))
    TimePlayedBorderLeft:SetColorTexture(unpack(borderColor))
    TimePlayedBorderRight:SetColorTexture(unpack(borderColor))

    -- Apply saved settings or defaults
    if TimePlayedDB.textColor then
        TimePlayedText:SetTextColor(unpack(TimePlayedDB.textColor))
    else
        TimePlayedText:SetTextColor(1, 1, 1, 1) -- Default white
    end

    if TimePlayedDB.fontSize then
        TimePlayedText:SetFont("Fonts\\FRIZQT__.TTF", TimePlayedDB.fontSize)
    else
        TimePlayedText:SetFont("Fonts\\FRIZQT__.TTF", 14) -- Default medium
    end

    if TimePlayedDB.background and TimePlayedDB.background.type == "color" then
        TimePlayedBG:SetColorTexture(TimePlayedDB.background.r, TimePlayedDB.background.g, TimePlayedDB.background.b, TimePlayedDB.background.a)
        TimePlayedBG:Show()
    else
        TimePlayedBG:SetColorTexture(0, 0, 0, 0) -- Transparent by default
    end

    -- Enable right-click for menu
    TimePlayedText:SetScript("OnMouseUp", function(self, button)
        if button == "RightButton" then
            ToggleDropDownMenu(1, nil, TimePlayedMenu, self, 0, 0)
        end
    end)

    -- Show and update when CharacterFrame is visible
    CharacterFrame:HookScript("OnShow", function()
        TimePlayedText:Show()
        TimePlayedBG:Show()
        TimePlayedBorderTop:Show()
        TimePlayedBorderLeft:Show()
        TimePlayedBorderRight:Show()
        suppressTimePlayedMessage = true
        RequestTimePlayed()
    end)
    CharacterFrame:HookScript("OnHide", function()
        TimePlayedText:Hide()
        TimePlayedBG:Hide()
        TimePlayedBorderTop:Hide()
        TimePlayedBorderLeft:Hide()
        TimePlayedBorderRight:Hide()
    end)

    -- Initial fetch on login (hidden until panel opens)
    suppressTimePlayedMessage = true
    RequestTimePlayed()
end

-- Event handler
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        UIDropDownMenu_Initialize(TimePlayedMenu, InitializeMenu, "MENU")
        SetupTimeDisplay()
    elseif event == "TIME_PLAYED_MSG" then
        local totalTime, currentLevelTime = ...
        local timeString = "Time Played: " .. FormatTime(totalTime)
        TimePlayedText:SetText(timeString)
        -- Adjust background size to fit text
        TimePlayedBG:SetPoint("TOPLEFT", TimePlayedText, "TOPLEFT", -5, 5)
        TimePlayedBG:SetPoint("BOTTOMRIGHT", TimePlayedText, "BOTTOMRIGHT", 5, -7)
        -- Adjust border size to fit background
        TimePlayedBorderTop:SetPoint("TOPLEFT", TimePlayedBG, "TOPLEFT", -2, 2) 
        TimePlayedBorderTop:SetPoint("TOPRIGHT", TimePlayedBG, "TOPRIGHT", 2, 2)
        TimePlayedBorderLeft:SetPoint("TOPLEFT", TimePlayedBG, "TOPLEFT", -2, 0)
        TimePlayedBorderLeft:SetPoint("BOTTOMLEFT", TimePlayedBG, "BOTTOMLEFT", -2, 0)
        TimePlayedBorderRight:SetPoint("TOPRIGHT", TimePlayedBG, "TOPRIGHT", 2, 0)
        TimePlayedBorderRight:SetPoint("BOTTOMRIGHT", TimePlayedBG, "BOTTOMRIGHT", 2, 0)
        -- Delay reset to ensure chat messages are caught
        C_Timer.After(0.1, function()
            suppressTimePlayedMessage = false
        end)
    end
end)

-- Hook chat frames to suppress time played messages
local function SuppressTimePlayedMessage(self, message, ...)
    if suppressTimePlayedMessage and message then
        for _, pattern in ipairs(TIME_PLAYED_PATTERNS) do
            if message:find(pattern) then
                return -- Suppress the message if it matches any pattern
            end
        end
    end
    self:OriginalAddMessage(message, ...) -- Pass through other messages
end

-- Apply the hook to all chat frames
for i = 1, NUM_CHAT_WINDOWS do
    local chatFrame = _G["ChatFrame" .. i]
    if chatFrame then
        if not chatFrame.OriginalAddMessage then
            chatFrame.OriginalAddMessage = chatFrame.AddMessage
            chatFrame.AddMessage = SuppressTimePlayedMessage
        end
    end
end