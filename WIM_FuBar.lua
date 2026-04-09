-- WIM_FuBar.lua
-- FuBar/Broker Integration for WIM

if (AceLibrary and AceLibrary:HasInstance("FuBarPlugin-2.0")) then
	WIM_FuBar = AceLibrary("FuBarPlugin-2.0"):new({
		name          = "WIM [Comm-Tier]",
		description   = "World Interactive Messaging",
		version       = "1.3.2",
		category      = "Chat & Communication",
		icon          = "Interface\\AddOns\\WIM\\Images\\miniEnabled",
		OnTextUpdate  = function()
			WIM_FuBar:SetText(WIM_NewMessageCount > 0 and ("WIM ("..WIM_NewMessageCount..")") or "WIM");
		end,
		OnClick       = function(button)
			if (button == "LeftButton") then
				WIM_Icon_Menu_Toggle();
			else
				WIM_Options:Show();
			end
		end,
		OnTooltipUpdate = function()
			GameTooltip:AddLine("WIM [Comm-Tier]");
			GameTooltip:AddLine(WIM_L_ICONTOOLTIP);
		end
	});
end
