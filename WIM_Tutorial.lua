-- WIM_Tutorial.lua
-- Tutorial System for WIM

WIM_TutorialData = {
	{ title = "WIM [Comm-Tier]", text = "Welcome to WIM (World Interactive Messaging). Your whispers will now appear in separate windows." },
	{ title = "Minimap Icon", text = "You can manage your conversations and options by right-clicking the minimap icon." },
	{ title = "Tabs and Windows", text = "Use Tab to switch between active conversations quickly." }
};

function WIM_ShowTutorial(step)
	if(not WIM_Help) then return; end
	local data = WIM_TutorialData[step];
	if(data) then
		WIM_HelpTitle:SetText(data.title);
		WIM_HelpText:SetText(data.text);
		WIM_Help:Show();
	end
end
