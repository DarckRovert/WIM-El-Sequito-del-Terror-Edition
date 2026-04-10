-- WIM_Icon.lua
-- Minimap Icon Logic for WIM

function WIM_Icon_OnLoad()
	this:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	this:RegisterForDrag("LeftButton");
	WIM_Icon_UpdatePosition();
end

function WIM_Icon_Move(toDegree)
	WIM_Data.iconPosition = toDegree;
	WIM_Icon_UpdatePosition();
end

function WIM_Icon_UpdatePosition()
	if(not WIM_IconFrame or not WIM_Data) then return; end
	if(WIM_Data.showMiniMap == false) then
		WIM_IconFrame:Hide();
	else
		if(WIM_Data.miniFreeMoving.enabled == false) then
			WIM_IconFrame:SetPoint(
				"TOPLEFT",
				"Minimap",
				"TOPLEFT",
				54 - (78 * cos(WIM_Data.iconPosition)),
				(78 * sin(WIM_Data.iconPosition)) - 55
			);
		end
		WIM_IconFrame:Show();
	end
end

function WIM_Icon_OnUpdate(elapsedTime)
	if WIM_NewMessageFlag == false then
		this.TimeSinceLastUpdate = 0
		if WIM_Icon_NewMessageFlash:IsVisible() then
			WIM_Icon_NewMessageFlash:Hide()
		end
		return
	end

	this.TimeSinceLastUpdate = this.TimeSinceLastUpdate + elapsedTime 	

	while this.TimeSinceLastUpdate > WIM_Icon_UpdateInterval do
		if WIM_Icon_NewMessageFlash:IsVisible() then
			WIM_Icon_NewMessageFlash:Hide()
		else
			WIM_Icon_NewMessageFlash:Show()
		end
		this.TimeSinceLastUpdate = this.TimeSinceLastUpdate - WIM_Icon_UpdateInterval
	end
end

function WIM_Icon_OnEnter()
	GameTooltip:SetOwner(this, "ANCHOR_LEFT");
	GameTooltip:SetText("WIM v"..WIM_VERSION.."              ");
	GameTooltip:AddDoubleLine("Conversation Menu", "Left-Click", 1,1,1,1,1,1);
	GameTooltip:AddDoubleLine("Show New Messages", "Right-Click", 1,1,1,1,1,1);
	GameTooltip:AddDoubleLine("WIM Options", "/wim", 1,1,1,1,1,1);
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
