Hooks:OverrideFunction(ModifierLessPagers, "init", function (self, data)
    ModifierLessPagers.super.init(self, data)
    tweak_data.player.alarm_pager.call_duration[1][1] = 6 - self:value()
    tweak_data.player.alarm_pager.call_duration[2][1] = 6 - self:value()
    tweak_data.player.alarm_pager.call_duration[1][2] = 6 - self:value()
    tweak_data.player.alarm_pager.call_duration[2][2] = 6 - self:value()

    if EHIPagerTracker then
        EHIPagerTracker._forced_time = 12 - (self:value()*2)
    end
    if EHIPagerWaypoint then
        EHIPagerWaypoint._forced_time = 12 - (self:value()*2)
    end
end)
