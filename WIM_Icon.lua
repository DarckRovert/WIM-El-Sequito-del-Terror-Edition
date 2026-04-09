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

function WIM_Icon_OnClick()
	if(arg1 == "LeftButton") then
		WIM_Icon_Menu_Toggle();
	else
		WIM_Options:Show();
	end
end

function WIM_Icon_OnEnter()
	if(WIM_Data.showToolTips) then
		GameTooltip:SetOwner(this, "ANCHOR_LEFT");
		GameTooltip:SetText("WIM [Comm-Tier]");
		GameTooltip:AddLine(WIM_L_ICONTOOLTIP, 1, 1, 1);
		if(WIM_NewMessageCount > 0) then
			GameTooltip:AddLine("Messages: "..WIM_NewMessageCount, 0, 1, 0);
		end
		GameTooltip:Show();
	end
end

function WIM_Icon_AddUser(user)
	if(WIM_IconItems[user] == nil) then
		WIM_IconItems[user] = true;
		WIM_NewMessageCount = WIM_NewMessageCount + 1;
		WIM_NewMessageFlag = true;
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
	end
end
