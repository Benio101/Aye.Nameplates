local Aye = Aye;
if not Aye.load then return end;

Aye.default.global.Nameplates = {
	-- radar
	enable = true,
	radarSize = 30,
	updateInterval = .03,
	layer = "3" .."ARTWORK",
	
	-- background
	backgroundColor = {0, 0, 0, .5};
	backgroundBorderColor = {0, 0, 0, 1};
	
	-- Default priorities
	-- Higher is more important
	--
	-- 15 = Player
	-- 14 = Target (override)
	-- 13 = Focus (override)
	-- 12 = Marker
	-- 10 = Enemy Player
	--  9 = Enemy NPC: Boss
	--  8 = Enemy NPC: Rare Elite
	--  7 = Enemy NPC: Rare
	--  6 = Enemy NPC: Elite
	--  5 = Enemy NPC: Normal
	--  4 = Enemy NPC: Minus
	--  3 = Enemy NPC: Trivial
	--  1 = Friendly Player
	
	-- Targeting
	targetEnable = true,
	targetIcon = "1" .."Arrows",
	targetLayerOverride = true,
	targetLayerPriority = 14,
	
	focusEnable = true,
	focusIcon = "2" .."Circle",
	focusLayerOverride = true,
	focusLayerPriority = 13,
	
	-- Marker
	markerIconEnable = true,
	markerIconSize = 24,
	markerIconPriority = 12,
	
	-- Player
	playerIconEnable = true,
	playerIcon = "01" .."Circle",
	playerIconColor = (function()
		local _, class = UnitClass("player");
		local color = RAID_CLASS_COLORS[class];
		
		return {color.r, color.g, color.b, 1};
	end)(),
	playerIconSize = 18,
	playerIconPriority = 15,
	
	-- Friendly Player
	friendlyPlayerIconEnable = true,
	friendlyPlayerIcon = "01" .."Circle",
	friendlyPlayerIconColorConstant = false,
	friendlyPlayerIconColor = (function()
		local faction = UnitFactionGroup("player");
		
		-- return faction color
		for factionID, factionName in pairs(PLAYER_FACTION_GROUP) do
			if factionName == faction then
				local color = PLAYER_FACTION_COLORS[factionID];
				return {color.r, color.g, color.b, 1};
			end;
		end;
		
		-- fallback
		return {1, 1, 1, .5};
	end)(),
	friendlyPlayerIconSize = 16,
	friendlyPlayerIconPriority = 1,
	
	-- Enemy Player
	enemyPlayerIconEnable = true,
	enemyPlayerIcon = "14" .."SkullCircled",
	enemyPlayerIconColorConstant = false,
	enemyPlayerIconColor = (function()
		local faction = UnitFactionGroup("player");
		
		-- return faction color
		for factionID, factionName in pairs(PLAYER_FACTION_GROUP) do
			if factionName ~= faction then
				local color = PLAYER_FACTION_COLORS[factionID];
				return {color.r, color.g, color.b, 1};
			end;
		end;
		
		-- fallback
		return {1, 1, 1, .5};
	end)(),
	enemyPlayerIconSize = 24,
	enemyPlayerIconPriority = 10,
	
	-- Enemy NPC: Boss
	enemyNPCBossIconEnable = true,
	enemyNPCBossIcon = "13" .."SkullGlow",
	enemyNPCBossIconColorCustom = true,
	enemyNPCBossIconColorTanked = {1, 0, 0, 1};
	enemyNPCBossIconColorAggroed = {1, .25, .25, 1};
	enemyNPCBossIconColorHostile = {1, 1, .25, 1};
	enemyNPCBossIconColorNeutral = {1, 1, 1, 1};
	enemyNPCBossIconColorTapped = {.5, .5, .5, 1};
	enemyNPCBossIconSize = 27,
	enemyNPCBossIconPriority = 9,
	
	-- Enemy NPC: Rare Elite
	enemyNPCRareEliteIconEnable = true,
	enemyNPCRareEliteIcon = "12" .."Skull3D",
	enemyNPCRareEliteIconColorCustom = true,
	enemyNPCRareEliteIconColorTanked = {.2, .4, .8, 1};
	enemyNPCRareEliteIconColorAggroed = {.25, .5, 1, 1};
	enemyNPCRareEliteIconColorHostile = {.5, .75, 1, 1};
	enemyNPCRareEliteIconColorNeutral = {.75, .75, 1, 1};
	enemyNPCRareEliteIconColorTapped = {.5, .5, .75, 1};
	enemyNPCRareEliteIconSize = 24,
	enemyNPCRareEliteIconPriority = 8,
	
	-- Enemy NPC: Rare
	enemyNPCRareIconEnable = true,
	enemyNPCRareIcon = "11" .."Skull",
	enemyNPCRareIconColorCustom = true,
	enemyNPCRareIconColorTanked = {.2, .4, .8, 1};
	enemyNPCRareIconColorAggroed = {.25, .5, 1, 1};
	enemyNPCRareIconColorHostile = {.5, .75, 1, 1};
	enemyNPCRareIconColorNeutral = {.75, .825, 1, 1};
	enemyNPCRareIconColorTapped = {.5, .625, .75, 1};
	enemyNPCRareIconSize = 24,
	enemyNPCRareIconPriority = 7,
	
	-- Enemy NPC: Elite
	enemyNPCEliteIconEnable = true,
	enemyNPCEliteIcon = "12" .."Skull3D",
	enemyNPCEliteIconColorCustom = true,
	enemyNPCEliteIconColorTanked = {1, 0, 0, 1};
	enemyNPCEliteIconColorAggroed = {1, .25, .25, 1};
	enemyNPCEliteIconColorHostile = {1, 1, .25, 1};
	enemyNPCEliteIconColorNeutral = {1, 1, 1, 1};
	enemyNPCEliteIconColorTapped = {.5, .5, .5, 1};
	enemyNPCEliteIconSize = 24,
	enemyNPCEliteIconPriority = 6,
	
	-- Enemy NPC: Normal
	enemyNPCNormalIconEnable = true,
	enemyNPCNormalIcon = "11" .."Skull",
	enemyNPCNormalIconColorCustom = true,
	enemyNPCNormalIconColorTanked = {1, 0, 0, 1};
	enemyNPCNormalIconColorAggroed = {1, .25, .25, 1};
	enemyNPCNormalIconColorHostile = {1, 1, .25, 1};
	enemyNPCNormalIconColorNeutral = {1, 1, 1, 1};
	enemyNPCNormalIconColorTapped = {.5, .5, .5, 1};
	enemyNPCNormalIconSize = 24,
	enemyNPCNormalIconPriority = 5,
	
	-- Enemy NPC: Minus
	enemyNPCMinusIconEnable = true,
	enemyNPCMinusIcon = "11" .."Skull",
	enemyNPCMinusIconColorCustom = true,
	enemyNPCMinusIconColorTanked = {1, 0, 0, 1};
	enemyNPCMinusIconColorAggroed = {1, .25, .25, 1};
	enemyNPCMinusIconColorHostile = {1, 1, .25, 1};
	enemyNPCMinusIconColorNeutral = {1, 1, 1, 1};
	enemyNPCMinusIconColorTapped = {.5, .5, .5, 1};
	enemyNPCMinusIconSize = 20,
	enemyNPCMinusIconPriority = 4,
	
	-- Enemy NPC: Trivial
	enemyNPCTrivialIconEnable = true,
	enemyNPCTrivialIcon = "11" .."Skull",
	enemyNPCTrivialIconColorCustom = true,
	enemyNPCTrivialIconColorTanked = {1, 0, 0, .75};
	enemyNPCTrivialIconColorAggroed = {1, .25, .25, .75};
	enemyNPCTrivialIconColorHostile = {1, 1, .25, .75};
	enemyNPCTrivialIconColorNeutral = {1, 1, 1, .75};
	enemyNPCTrivialIconColorTapped = {.5, .5, .5, .75};
	enemyNPCTrivialIconSize = 20,
	enemyNPCTrivialIconPriority = 3,
};