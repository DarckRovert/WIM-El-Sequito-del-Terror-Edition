-- WIM_Menu.lua
-- Context Menu Logic for WIM

function WIM_Icon_Menu_Toggle()
	if(WIM_Icon_TheMenu == nil) then
		WIM_Icon_TheMenu = CreateFrame("Frame", "WIM_Icon_Menu", UIParent, "UIDropDownMenuTemplate");
	end
	UIDropDownMenu_Initialize(WIM_Icon_TheMenu, WIM_Icon_DropDown_Initialize, "MENU");
	ToggleDropDownMenu(1, nil, WIM_Icon_TheMenu, "WIM_IconFrame", 0, 0);
end

function WIM_Icon_DropDown_Initialize()
	local info = {};
	
	info.text = "WIM [Comm-Tier]";
	info.isTitle = true;
	UIDropDownMenu_AddButton(info);
	
	if(WIM_NewMessageCount > 0) then
		for user in WIM_IconItems do
			info = {};
			info.text = WIM_GetAlias(user, true);
			info.func = function() WIM_PostMessage(this.value, "", 5, "", ""); end;
			info.value = user;
			UIDropDownMenu_AddButton(info);
		end
		
		info = {};
		info.text = "---";
		info.disabled = true;
		UIDropDownMenu_AddButton(info);
	end
	
	info = {};
	info.text = WIM_L_OPTIONS;
	info.func = function() WIM_Options:Show(); end;
	UIDropDownMenu_AddButton(info);
	
	info = {};
	info.text = WIM_L_HISTORY;
	info.func = function() WIM_HistoryFrame:Show(); end;
	UIDropDownMenu_AddButton(info);
end

function WIM_Icon_DropDown_Update()
	if(WIM_Icon_TheMenu and WIM_Icon_TheMenu:IsVisible()) then
		WIM_Icon_Menu_Toggle();
	end
end
