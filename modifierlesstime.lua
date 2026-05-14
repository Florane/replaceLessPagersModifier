if ModifierCSRLessPagers1 then
	--CSR implementation
	local function init(self, data)
		self._data = data
		self.icon = "crime_spree_pager"

		tweak_data.player.alarm_pager.call_duration[1][1] = 6 - data.count*2
		tweak_data.player.alarm_pager.call_duration[2][1] = 6 - data.count*2
		tweak_data.player.alarm_pager.call_duration[1][2] = 6 - data.count*2
		tweak_data.player.alarm_pager.call_duration[2][2] = 6 - data.count*2

		if EHIPagerTracker then
			EHIPagerTracker._forced_time = 12 - (data.count*2)
		end
		if EHIPagerWaypoint then
			EHIPagerWaypoint._forced_time = 12 - (data.count*2)
		end
	end
	--awesome code, did chatgpt write it for you?
	ModifierCSRLessPagers1.init = init
	ModifierCSRLessPagers2.init = init
	ModifierCSRLessPagers3.init = init
	ModifierCSRLessPagers4.init = init

	ModifierCSRLessPagers1.desc_id = "menu_cs_modifier_pagers"
	ModifierCSRLessPagers2.desc_id = "menu_cs_modifier_pagers"
	ModifierCSRLessPagers3.desc_id = "menu_cs_modifier_pagers"
	ModifierCSRLessPagers4.desc_id = "menu_cs_modifier_pagers"
else
	--General implementation
	Hooks:OverrideFunction(ModifierLessPagers, "init", function (self, data)
		ModifierLessPagers.super.init(self, data)
		tweak_data.player.alarm_pager.call_duration[1][1] = 6 - self:value()
		tweak_data.player.alarm_pager.call_duration[2][1] = 6 - self:value()
		tweak_data.player.alarm_pager.call_duration[1][2] = 6 - self:value()
		tweak_data.player.alarm_pager.call_duration[2][2] = 6 - self:value()

		--i am forever thankful for this
		if EHIPagerTracker then
			EHIPagerTracker._forced_time = 12 - (self:value()*2)
		end
		if EHIPagerWaypoint then
			EHIPagerWaypoint._forced_time = 12 - (self:value()*2)
		end
	end)
end
