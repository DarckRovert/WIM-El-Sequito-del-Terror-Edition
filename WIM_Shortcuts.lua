-- WIM_Shortcuts.lua
-- Shortcut Bar Logic for WIM windows

function WIM_LoadShortcutFrame()
	local theWin = this;
	local theUser = theWin.theUser;
	local btn;
	
	-- Button 1: Target
	btn = getglobal(theWin:GetName().."ShortcutFrameButton1");
	btn.cmd = "target";
	btn.tooltip = WIM_L_TARGET;
	getglobal(btn:GetName().."Icon"):SetTexture("Interface\\Icons\\Ability_Hunter_SniperShot");
	
	-- Button 2: Invite
	btn = getglobal(theWin:GetName().."ShortcutFrameButton2");
	btn.cmd = "invite";
	btn.tooltip = WIM_L_INVITE;
	getglobal(btn:GetName().."Icon"):SetTexture("Interface\\Icons\\Spell_Magic_MagicalSentry");
	
	-- Button 3: Trade
	btn = getglobal(theWin:GetName().."ShortcutFrameButton3");
	btn.cmd = "trade";
	btn.tooltip = WIM_L_TRADE;
	getglobal(btn:GetName().."Icon"):SetTexture("Interface\\Icons\\INV_Misc_Coin_01");
	
	-- Button 4: Inspect
	btn = getglobal(theWin:GetName().."ShortcutFrameButton4");
	btn.cmd = "inspect";
	btn.tooltip = WIM_L_INSPECT;
	getglobal(btn:GetName().."Icon"):SetTexture("Interface\\Icons\\INV_Misc_Eye_02");
	
	-- Button 5: Ignore
	btn = getglobal(theWin:GetName().."ShortcutFrameButton5");
	btn.cmd = "ignore";
	btn.tooltip = WIM_L_IGNORE;
	getglobal(btn:GetName().."Icon"):SetTexture("Interface\\Icons\\Spell_Shadow_FingerOfDeath");
end

function WIM_ShorcutButton_Clicked()
	local cmd = this.cmd;
	local theUser = this:GetParent():GetParent().theUser;
	
	if(cmd == "target") then
		TargetByName(theUser, true);
	elseif(cmd == "invite") then
		InviteByName(theUser);
	elseif(cmd == "trade") then
		TargetByName(theUser, true);
		InitiateTrade("target");
	elseif(cmd == "inspect") then
		TargetByName(theUser, true);
		InspectUnit("target");
	elseif(cmd == "ignore") then
		getglobal(this:GetParent():GetParent():GetName().."IgnoreConfirm"):Show();
	end
end
