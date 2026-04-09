-- WIM_Minimap.lua
-- Advanced Minimap Positioning for WIM

function WIM_Minimap_Dragging()
	local xpos, ypos = GetCursorPosition();
	local xmin, ymin = Minimap:GetLeft(), Minimap:GetBottom();
	xpos = xmin - xpos / Minimap:GetEffectiveScale() + 80;
	ypos = ypos / Minimap:GetEffectiveScale() - ymin - 80;
	WIM_Icon_Move(math.deg(math.atan2(ypos, xpos)));
end

function WIM_Minimap_OnDragStart()
	this:StartMoving();
	this:SetScript("OnUpdate", WIM_Minimap_Dragging);
end

function WIM_Minimap_OnDragStop()
	this:StopMovingOrSizing();
	this:SetScript("OnUpdate", nil);
end
