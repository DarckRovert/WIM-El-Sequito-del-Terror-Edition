-- WIM_Shortcuts.lua
-- Shortcut Bar Logic for WIM windows

function WIM_LoadShortcutFrame()
	local tButtons = {
		{
			icon = "Interface\\Icons\\Ability_Hunter_AimedShot",
			cmd		= "target",
			tooltip = WIM_L_TARGET or "Target"
		},
		{
			icon = "Interface\\Icons\\Spell_Holy_MindVision",
			cmd		= "who",
			tooltip = WIM_L_WHO or "Who"
		},
		{
			icon = "Interface\\Icons\\INV_Misc_Note_02",
			cmd		= "invite",
			tooltip = WIM_L_INVITE or "Invite"
		},
		{
			icon = "Interface\\Icons\\INV_Misc_Bag_11",
			cmd		= "trade",
			tooltip = WIM_L_TRADE or "Trade"
		},
		{
			icon = "Interface\\Icons\\INV_Misc_Eye_01",
			cmd		= "inspect",
			tooltip = WIM_L_INSPECT or "Inspect"
		},
		{
			icon = "Interface\\Icons\\Spell_Holy_BlessingOfStrength",
			cmd		= "friend",
			tooltip = WIM_L_ADDFRIEND or "Add Friend"
		},
		{
			icon = "Interface\\Icons\\Ability_Physical_Taunt",
			cmd		= "ignore",
			tooltip = WIM_L_IGNORE or "Ignore"
		},
		{
			icon = "Interface\\Icons\\Spell_Holy_DispelMagic",
			cmd		= "clear",
			tooltip = WIM_L_CLEAR or "Clear Window"
		},
	};
	for i=1,8 do
		local btn = getglobal(this:GetName().."ShortcutFrameButton"..i);
		local icon = getglobal(this:GetName().."ShortcutFrameButton"..i.."Icon");
		if(btn and icon) then
			icon:SetTexture(tButtons[i].icon);
			btn.cmd = tButtons[i].cmd;
			btn.tooltip = tButtons[i].tooltip;
		end
	end
	getglobal(this:GetName().."ShortcutFrame"):SetScale(.80);
end

function WIM_ShortcutButton_Clicked()
	local cmd = this.cmd;
	local theUser = this:GetParent():GetParent().theUser;
	if (not theUser) then return; end
	
	if(cmd == "target") then
		TargetByName(theUser, true);
	elseif(cmd == "who") then
		SendWho('n-"'..theUser..'"');
	elseif(cmd == "invite") then
		InviteByName(theUser);
	elseif(cmd == "trade") then
		TargetByName(theUser, true);
		InitiateTrade("target");
	elseif(cmd == "inspect") then
		TargetByName(theUser, true);
		InspectUnit("target");
	elseif(cmd == "friend") then
		AddFriend(theUser);
	elseif(cmd == "ignore") then
		getglobal(this:GetParent():GetParent():GetName().."IgnoreConfirm"):Show();
	elseif(cmd == "clear") then
		getglobal(this:GetParent():GetParent():GetName().."ScrollingMessageFrame"):Clear();
	end
end

