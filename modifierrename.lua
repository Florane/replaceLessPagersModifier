local text_original = LocalizationManager.text
local testAllStrings = false

function LocalizationManager:text(string_id, ...)
    local paste_str = ""
    if string_id == "menu_cs_modifier_pagers" then
        local arg = ...
        paste_str = string.format("Decrease pager response time by %d seconds",arg.count*2)
    end
    return string_id == "menu_cs_modifier_pagers" and paste_str

    or testAllStrings == true and string_id
    or text_original(self, string_id, ...)
end