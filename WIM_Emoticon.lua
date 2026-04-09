-- WIM_Emoticon.lua
-- Emoticon Support for WIM

WIM_Emoticons = {
	{ pattern = ":%)", texture = "Interface\\Icons\\Spell_Holy_BlessingOfWisdom" },
	{ pattern = ":%(", texture = "Interface\\Icons\\Spell_Shadow_GatherShadows" },
	{ pattern = ";%)", texture = "Interface\\Icons\\Ability_Ambush" },
	{ pattern = ":P", texture = "Interface\\Icons\\Ability_Creature_Disease_02" }
};

function WIM_ParseEmoticons(text)
	if(not WIM_Data.enableEmoticons) then return text; end
	for _, emo in WIM_Emoticons do
		text = string.gsub(text, emo.pattern, "|T"..emo.texture..":16:16|t");
	end
	return text;
end
