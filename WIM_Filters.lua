-- WIM_Filters.lua
-- Management of Spam and System filters for WIM

function WIM_Filter_Add(key, rule)
	if(key and rule) then
		WIM_Filters[key] = rule;
		WIM_FilteringScrollBar_Update();
	end
end

function WIM_Filter_Remove(key)
	if(WIM_Filters[key]) then
		WIM_Filters[key] = nil;
		WIM_FilteringScrollBar_Update();
	end
end

-- Hook for checking aliases as filters
function WIM_Filter_CheckAlias(user)
	if(WIM_Data.enableAlias and WIM_Alias[user]) then
		-- Logic for alias filtering if needed
		return false;
	end
	return false;
end
