-- WIM_Menu.lua
-- Context Menu and Conversation Menu Logic for WIM

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

-----------------------------------------------------------
-- Custom Conversation Menu Logic (Custom Frame)
-----------------------------------------------------------

function WIM_Icon_ToggleDropDown()
	if(WIM_ConversationMenu:IsVisible()) then
		WIM_ConversationMenu:Hide();
	else
		WIM_ConversationMenu:ClearAllPoints();
		WIM_ConversationMenu:SetPoint("BOTTOMRIGHT", WIM_IconFrame, "TOPLEFT", 10, -10);
		WIM_ConversationMenu:Show();
		WIM_Icon_DropDown_Update();
	end
end

function WIM_Icon_DropDown_Update()
	local tList = {}
	local tListActivity = {}
	local tCount = 0
	for key in WIM_IconItems do
		table.insert(tListActivity, key)
		tCount = tCount + 1
	end
	
	table.sort(tListActivity, WIM_Icon_SortByActivity)
	for i=1,table.getn(tListActivity) do
		if i <= WIM_MaxMenuCount then
			table.insert(tList, tListActivity[i])
		end
	end
	
	for i=1,20 do 
		local btnClose = getglobal("WIM_ConversationMenuTellButton"..i.."Close")
		local btn = getglobal("WIM_ConversationMenuTellButton"..i)
		if btnClose then btnClose:Show() end
		if btn then
			btn:Enable()
			btn:Hide()
		end
	end
	
	WIM_NewMessageCount = 0;
	
	if tCount == 0 then
		getglobal("WIM_ConversationMenuTellButton1Close"):Hide()
		getglobal("WIM_ConversationMenuTellButton1"):Disable()
		getglobal("WIM_ConversationMenuTellButton1"):SetText(WIM_L_NONEC or " - None -")
		getglobal("WIM_ConversationMenuTellButton1"):Show()
	else
		if WIM_Data.sortAlpha then
			table.sort(tList)
		end
		WIM_NewMessageFlag = false
		for i=1,table.getn(tList) do
			local win = WIM_Windows[tList[i]]
			local item = WIM_IconItems[tList[i]]
			local btn = getglobal("WIM_ConversationMenuTellButton"..i)
			
			if win and item and btn then
				if win.newMSG and win.is_visible == false then
					item.color = "|cff"..WIM_RGBtoHex(77/255, 135/233, 224/255)
					WIM_NewMessageFlag = true
					WIM_NewMessageCount = WIM_NewMessageCount + 1
				else
					item.color = "|cffffffff"
				end
				btn:SetText(item.color..WIM_GetAlias(item.text, true))
				btn.theUser = item.text
				btn.value = item.value
				btn:Show()
			end
		end
	end
	
	local ConvoMenuHeight = 60
	local CMH_Delta = 16 * (table.getn(tList)-1)
	if CMH_Delta < 0 then CMH_Delta = 0 end
	ConvoMenuHeight = ConvoMenuHeight + CMH_Delta
	if WIM_ConversationMenu then
		WIM_ConversationMenu:SetHeight(ConvoMenuHeight)
	end
	
	-- Update Minimap icon texture based on message state
	if WIM_Data.enableWIM == true and WIM_IconFrameButton then
		if WIM_NewMessageFlag == true then
			WIM_IconFrameButton:SetNormalTexture("Interface\\AddOns\\WIM\\Images\\miniEnabled")
		else
			WIM_IconFrameButton:SetNormalTexture("Interface\\AddOns\\WIM\\Images\\miniDisabled")
		end
	elseif WIM_IconFrameButton then
		WIM_IconFrameButton:SetNormalTexture("Interface\\AddOns\\WIM\\Images\\miniOff")
	end
end

function WIM_Icon_AddUser(theUser)
	local info = {}
	info.text = theUser;
	info.justifyH = "LEFT"
	info.isTitle = nil
	info.notCheckable = 1
	info.value = WIM_Windows[theUser].frame
	info.func = WIM_Icon_PlayerClick
	WIM_IconItems[theUser] = info
	WIM_Icon_DropDown_Update()
end

function WIM_Icon_PlayerClick()
	if(this.value ~= nil) then
		getglobal(this.value):Show()
		local user = getglobal(this.value).theUser
		WIM_Windows[user].newMSG = false
		WIM_Windows[user].is_visible = true
		WIM_Icon_DropDown_Update()
	end
end

function WIM_Icon_SortByActivity(user1, user2)
	if(WIM_Windows[user1] and WIM_Windows[user2]) then
		return WIM_Windows[user1].last_msg > WIM_Windows[user2].last_msg
	end
	return false
end

function WIM_ConversationMenu_OnUpdate(elapsed)
	if this.isCounting then
		this.timeElapsed = this.timeElapsed + elapsed
		if this.timeElapsed > 1 then
			this:Hide()
			this.timeElapsed = 0
			this.isCounting = false
		end
	end
end

function WIM_ShowNewMessages()
	for key in WIM_Windows do
		if(WIM_Windows[key].newMSG == true) then
			getglobal(WIM_Windows[key].frame):Show();
			WIM_Windows[key].newMSG = false;
		end
	end
	WIM_Icon_DropDown_Update();
end

function WIM_RGBtoHex(r,g,b)
	return string.format ("%.2x%.2x%.2x", r*255, g*255, b*255)
end
