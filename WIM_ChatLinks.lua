-- WIM_ChatLinks.lua
-- Hyperlink Integration for WIM windows

function WIM_ChatLinks_OnHyperlinkClick(link, text, button)
	if(WIM_isLinkURL(link)) then
		WIM_DisplayURL(link);
	else
		ChatFrame_OnHyperlinkShow(link, text, button);
	end
end

-- Hook into standard SetItemRef to handle WIM URLs globally
local _SetItemRef = SetItemRef;
function SetItemRef(link, text, button)
	if(WIM_isLinkURL(link)) then
		WIM_DisplayURL(link);
		return;
	end
	_SetItemRef(link, text, button);
end
