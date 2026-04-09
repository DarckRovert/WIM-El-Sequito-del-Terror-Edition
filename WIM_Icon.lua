-- WIM_Icon.lua
-- Minimap Icon Logic for WIM

function WIM_Icon_OnLoad()
	this:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	this:RegisterForDrag("LeftButton");
end

function WIM_Icon_UpdateInterval_OnUpdate(elapsedTime)
	WIM_Icon_UpdateInterval = WIM_Icon_UpdateInterval - elapsedTime;
	if (WIM_Icon_UpdateInterval <= 0) then
		WIM_Icon_UpdateInterval = 0.5;
		WIM_Icon_Update();
	end
end

function WIM_Icon_Update()
	if(WIM_NewMessageFlag) then
		WIM_IconFrameIcon:SetTexture("Interface\\AddOns\\WIM\\Images\\miniEnabled");
	else
		WIM_IconFrameIcon:SetTexture("Interface\\AddOns\\WIM\\Images\\miniOff");
	end
end






function WIM_Icon_RemoveUser(user)
	if(WIM_IconItems[user]) then
		WIM_IconItems[user] = nil;
		WIM_NewMessageCount = WIM_NewMessageCount - 1;
		if(WIM_NewMessageCount <= 0) then
			WIM_NewMessageCount = 0;
			WIM_NewMessageFlag = false;
		end
		WIM_Icon_DropDown_Update();
	end
end
