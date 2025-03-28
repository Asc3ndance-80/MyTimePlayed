-- TimePlayedMenu.lua

TimePlayedMenu = CreateFrame("Frame", "TimePlayedMenu", UIParent, "UIDropDownMenuTemplate")

function InitializeMenu(self, level)
    if not level then return end
    local info = UIDropDownMenu_CreateInfo()

    if level == 1 then
        info.text = "Font Color"
        info.hasArrow = true
        info.notCheckable = true
        info.value = "fontColor"
        UIDropDownMenu_AddButton(info, level)

        info.text = "Background Color"
        info.hasArrow = true
        info.notCheckable = true
        info.value = "backgroundColor"
        UIDropDownMenu_AddButton(info, level)

        info.text = "Border Color"
        info.hasArrow = true
        info.notCheckable = true
        info.value = "borderColor"
        UIDropDownMenu_AddButton(info, level)

        info.text = "Font Size"
        info.hasArrow = true
        info.notCheckable = true
        info.value = "fontSize"
        UIDropDownMenu_AddButton(info, level)

    elseif level == 2 then
        if UIDROPDOWNMENU_MENU_VALUE == "fontColor" then
            info.text = "Black"
            info.func = function()
                TimePlayedText:SetTextColor(0, 0, 0, 1)
                TimePlayedDB.textColor = {0, 0, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "White"
            info.func = function()
                TimePlayedText:SetTextColor(1, 1, 1, 1)
                TimePlayedDB.textColor = {1, 1, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Red"
            info.func = function()
                TimePlayedText:SetTextColor(1, 0, 0, 1)
                TimePlayedDB.textColor = {1, 0, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Green"
            info.func = function()
                TimePlayedText:SetTextColor(0, 1, 0, 1)
                TimePlayedDB.textColor = {0, 1, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Blue"
            info.func = function()
                TimePlayedText:SetTextColor(0, 0, 1, 1)
                TimePlayedDB.textColor = {0, 0, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Yellow"
            info.func = function()
                TimePlayedText:SetTextColor(1, 1, 0, 1)
                TimePlayedDB.textColor = {1, 1, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Purple"
            info.func = function()
                TimePlayedText:SetTextColor(0.5, 0, 1, 1)
                TimePlayedDB.textColor = {0.5, 0, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Orange"
            info.func = function()
                TimePlayedText:SetTextColor(1, 0.5, 0, 1)
                TimePlayedDB.textColor = {1, 0.5, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Cyan"
            info.func = function()
                TimePlayedText:SetTextColor(0, 1, 1, 1)
                TimePlayedDB.textColor = {0, 1, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Pink"
            info.func = function()
                TimePlayedText:SetTextColor(1, 0.5, 1, 1)
                TimePlayedDB.textColor = {1, 0.5, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

        elseif UIDROPDOWNMENU_MENU_VALUE == "backgroundColor" then
            info.text = "None"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0, 0, 0, 0)
                TimePlayedDB.background = nil
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Default"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.1, 0.1, 0.1, 0.7)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.1, g = 0.1, b = 0.1, a = 0.7}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Black"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0, 0, 0, 1)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0, g = 0, b = 0, a = 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Gray"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.5, 0.5, 0.5, 1)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.5, g = 0.5, b = 0.5, a = 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Light Grey"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.75, 0.75, 0.75, 1)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.75, g = 0.75, b = 0.75, a = 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Dark Grey"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.25, 0.25, 0.25, 1)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.25, g = 0.25, b = 0.25, a = 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Blue"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0, 0, 0.8, 0.7)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0, g = 0, b = 0.8, a = 0.7}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Green"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0, 0.8, 0, 0.7)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0, g = 0.8, b = 0, a = 0.7}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Red"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.8, 0, 0, 0.7)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.8, g = 0, b = 0, a = 0.7}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Purple"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.5, 0, 0.8, 0.7)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.5, g = 0, b = 0.8, a = 0.7}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Orange"
            info.func = function(self)
                TimePlayedBG:SetColorTexture(0.8, 0.5, 0, 0.7)
                TimePlayedBG:Show()
                TimePlayedDB.background = {type = "color", r = 0.8, g = 0.5, b = 0, a = 0.7}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

        elseif UIDROPDOWNMENU_MENU_VALUE == "borderColor" then
            info.text = "White"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(1, 1, 1, 1)
                TimePlayedBorderLeft:SetColorTexture(1, 1, 1, 1)
                TimePlayedBorderRight:SetColorTexture(1, 1, 1, 1)
                TimePlayedDB.borderColor = {1, 1, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Black"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(0, 0, 0, 1)
                TimePlayedBorderLeft:SetColorTexture(0, 0, 0, 1)
                TimePlayedBorderRight:SetColorTexture(0, 0, 0, 1)
                TimePlayedDB.borderColor = {0, 0, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Red"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(1, 0, 0, 1)
                TimePlayedBorderLeft:SetColorTexture(1, 0, 0, 1)
                TimePlayedBorderRight:SetColorTexture(1, 0, 0, 1)
                TimePlayedDB.borderColor = {1, 0, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Blue"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(0, 0, 1, 1)
                TimePlayedBorderLeft:SetColorTexture(0, 0, 1, 1)
                TimePlayedBorderRight:SetColorTexture(0, 0, 1, 1)
                TimePlayedDB.borderColor = {0, 0, 1, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Gold"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(1, 0.82, 0, 1)
                TimePlayedBorderLeft:SetColorTexture(1, 0.82, 0, 1)
                TimePlayedBorderRight:SetColorTexture(1, 0.82, 0, 1)
                TimePlayedDB.borderColor = {1, 0.82, 0, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Light Grey"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(0.75, 0.75, 0.75, 1)
                TimePlayedBorderLeft:SetColorTexture(0.75, 0.75, 0.75, 1)
                TimePlayedBorderRight:SetColorTexture(0.75, 0.75, 0.75, 1)
                TimePlayedDB.borderColor = {0.75, 0.75, 0.75, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Dark Grey"
            info.func = function()
                TimePlayedBorderTop:SetColorTexture(0.25, 0.25, 0.25, 1)
                TimePlayedBorderLeft:SetColorTexture(0.25, 0.25, 0.25, 1)
                TimePlayedBorderRight:SetColorTexture(0.25, 0.25, 0.25, 1)
                TimePlayedDB.borderColor = {0.25, 0.25, 0.25, 1}
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

        elseif UIDROPDOWNMENU_MENU_VALUE == "fontSize" then
            info.text = "Small (10)"
            info.func = function()
                TimePlayedText:SetFont("Fonts\\FRIZQT__.TTF", 10)
                TimePlayedDB.fontSize = 10
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Medium (14)"
            info.func = function()
                TimePlayedText:SetFont("Fonts\\FRIZQT__.TTF", 14)
                TimePlayedDB.fontSize = 14
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Large (18)"
            info.func = function()
                TimePlayedText:SetFont("Fonts\\FRIZQT__.TTF", 18)
                TimePlayedDB.fontSize = 18
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)

            info.text = "Extra Large (22)"
            info.func = function()
                TimePlayedText:SetFont("Fonts\\FRIZQT__.TTF", 22)
                TimePlayedDB.fontSize = 22
            end
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)
        end
    end
end