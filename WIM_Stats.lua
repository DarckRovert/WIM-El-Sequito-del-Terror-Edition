-- WIM_Stats.lua
-- Messaging Statistics for WIM

WIM_Stats = {
	whispersIn = 0,
	whispersOut = 0,
	mostActive = "",
	totalChars = 0
};

function WIM_Stats_Update(ttype, user, msg)
	if(ttype == 1) then
		WIM_Stats.whispersIn = WIM_Stats.whispersIn + 1;
	elseif(ttype == 2) then
		WIM_Stats.whispersOut = WIM_Stats.whispersOut + 1;
	end
	
	if(msg) then
		WIM_Stats.totalChars = WIM_Stats.totalChars + string.len(msg);
	end
end

function WIM_Stats_Reset()
	WIM_Stats.whispersIn = 0;
	WIM_Stats.whispersOut = 0;
	WIM_Stats.mostActive = "";
	WIM_Stats.totalChars = 0;
end
