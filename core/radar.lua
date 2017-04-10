local Aye = Aye;

-- create radar
--
-- @noparam
-- @noreturn
Aye.modules.Nameplates.radar.init = function()
	Aye.modules.Nameplates.radar.background = CreateFrame("Frame", nil, UIParent);
	Aye.modules.Nameplates.radar.background:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8X8",  
		edgeFile = "Interface\\Buttons\\WHITE8X8",
		tile = false, tileSize = 0, edgeSize = 1,
		insets = {left = 0, right = 0, top = 0, bottom = 0},
	});
	Aye.modules.Nameplates.radar.background:SetBackdropColor(unpack(Aye.db.global.Nameplates.backgroundColor));
	Aye.modules.Nameplates.radar.background:SetBackdropBorderColor(unpack(Aye.db.global.Nameplates.backgroundBorderColor));
	
	Aye.modules.Nameplates.radar.background:ClearAllPoints();
	Aye.modules.Nameplates.radar.background:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 330, 260);
	
	Aye.modules.Nameplates.radar.background:SetWidth(UIParent:GetHeight() *Aye.db.global.Nameplates.radarSize /100);
	Aye.modules.Nameplates.radar.background:SetHeight(UIParent:GetHeight() *Aye.db.global.Nameplates.radarSize /100);
end;

-- add "player" unit to radar
--
-- @noparam
-- @noreturn
Aye.modules.Nameplates.radar.addPlayer = function()
	if not Aye.modules.Nameplates.radar.markers.player then
		Aye.modules.Nameplates.radar.markers.player = CreateFrame("Frame", nil, Aye.modules.Nameplates.radar.background);
		Aye.modules.Nameplates.radar.markers.player:ClearAllPoints();
		Aye.modules.Nameplates.radar.markers.player:SetPoint("CENTER", Aye.modules.Nameplates.radar.background, "CENTER");
		
		Aye.modules.Nameplates.radar.markers.player.icon = Aye.modules.Nameplates.radar.markers.player:CreateTexture();
		Aye.modules.Nameplates.radar.markers.player.icon:SetAllPoints();
		Aye.modules.Nameplates.radar.markers.player.icon:SetBlendMode("BLEND");
		Aye.modules.Nameplates.radar.markers.player.icon:SetDesaturated(true);
	end;
	
	Aye.modules.Nameplates.radar.markers.player:SetAlpha(Aye.db.global.Nameplates.enable and Aye.db.global.Nameplates.playerIconEnable and 1 or 0);
	
	Aye.modules.Nameplates.radar.markers.player:SetWidth(Aye.db.global.Nameplates.playerIconSize);
	Aye.modules.Nameplates.radar.markers.player:SetHeight(Aye.db.global.Nameplates.playerIconSize);
	
	if		type(Aye.modules.Nameplates.TEXTURES[Aye.db.global.Nameplates.playerIcon]) == "table"
	then	Aye.modules.Nameplates.radar.markers.player.icon:SetAtlas(Aye.modules.Nameplates.TEXTURES[Aye.db.global.Nameplates.playerIcon][1]);
	else	Aye.modules.Nameplates.radar.markers.player.icon:SetTexture(Aye.modules.Nameplates.TEXTURES[Aye.db.global.Nameplates.playerIcon]);
	end;
	
	Aye.modules.Nameplates.radar.markers.player.icon:SetVertexColor(unpack(Aye.db.global.Nameplates.playerIconColor));
	Aye.modules.Nameplates.radar.markers.player.icon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), Aye.db.global.Nameplates.playerIconPriority -8);
end;

-- add not "player" unit to radar
--
-- @param unitID {"nameplate" ..uint} unit to add to radar
-- @noreturn
Aye.modules.Nameplates.radar.addUnit = function(unitID)
	local nameplate = C_NamePlate.GetNamePlateForUnit(unitID, true);
	
	-- create new marker
	if not Aye.modules.Nameplates.radar.markers.units[unitID] then
		Aye.modules.Nameplates.radar.markers.units[unitID] = CreateFrame("Frame", nil, Aye.modules.Nameplates.radar.background);
		Aye.modules.Nameplates.radar.markers.units[unitID].icon = Aye.modules.Nameplates.radar.markers.units[unitID]:CreateTexture();
		Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetAllPoints();
		Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetBlendMode("BLEND");
		
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame = CreateFrame("Frame", nil, Aye.modules.Nameplates.radar.markers.units[unitID]);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon = Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:CreateTexture();
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetAllPoints();
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetBlendMode("ADD");
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetTexture(Aye.modules.Nameplates.TARGETING_TEXTURES[Aye.db.global.Nameplates.targetIcon]);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetDesaturated(false);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetVertexColor(0, 0, 0, 0);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), 1);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:SetWidth(24);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:SetHeight(24);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:ClearAllPoints();
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:SetPoint("CENTER", Aye.modules.Nameplates.radar.markers.units[unitID], "CENTER", 0, 0);
		
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame = CreateFrame("Frame", nil, Aye.modules.Nameplates.radar.markers.units[unitID]);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon = Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:CreateTexture();
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetAllPoints();
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetBlendMode("ADD");
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetTexture(Aye.modules.Nameplates.TARGETING_TEXTURES[Aye.db.global.Nameplates.focusIcon]);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetDesaturated(false);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetVertexColor(0, 0, 0, 0);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), 1);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:SetWidth(24);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:SetHeight(24);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:ClearAllPoints();
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:SetPoint("CENTER", Aye.modules.Nameplates.radar.markers.units[unitID], "CENTER", 0, 0);
	end;
	
	-- marker
	local markerID = GetRaidTargetIndex(unitID);
	
	-- nameplate unit type
	local unitType = "friendly";
	if UnitCanAttack("player", unitID) then unitType = "enemy" end;
	
	if UnitIsPlayer(unitID) then
		unitType = unitType .."Player";
	else
		unitType = unitType .."NPC";
		
		local classification = UnitClassification(unitID);
		if		UnitIsUnit(unitID, "boss1")
			or	UnitIsUnit(unitID, "boss2")
			or	UnitIsUnit(unitID, "boss3")
			or	UnitIsUnit(unitID, "boss4")
			or	UnitIsUnit(unitID, "boss5")
			or	classification == "worldboss"	then unitType = unitType .."Boss";
		elseif	classification == "rareelite"	then unitType = unitType .."RareElite";
		elseif	classification == "rare"		then unitType = unitType .."Rare";
		elseif	classification == "elite"		then unitType = unitType .."Elite";
		elseif	classification == "minus"		then unitType = unitType .."Minus";
		elseif	classification == "trivial"		then unitType = unitType .."Trivial";
		else									     unitType = unitType .."Normal";
		end;
	end;
	
	if
			(
					markerID
				and	Aye.db.global.Nameplates.markerIconEnable
			)
		or	(
					-- filter out friendly NPC
					not string.match(unitType, "^friendlyNPC")
					
					-- don't show icon if disabled
				and	Aye.db.global.Nameplates[unitType .."IconEnable"]
			)
	then
		if
				markerID
			and	Aye.db.global.Nameplates.markerIconEnable
		then
			-- marker icon
			Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetTexture("Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_" ..markerID);
			Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetDesaturated(false);
			Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(1, 1, 1, 1);
			Aye.modules.Nameplates.radar.markers.units[unitID]:SetWidth(Aye.db.global.Nameplates.markerIconSize);
			Aye.modules.Nameplates.radar.markers.units[unitID]:SetHeight(Aye.db.global.Nameplates.markerIconSize);
			Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), Aye.db.global.Nameplates.markerIconPriority -8);
		else
			-- icon
			if		type(Aye.modules.Nameplates.TEXTURES[Aye.db.global.Nameplates[unitType .."Icon"]]) == "table"
			then	Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetAtlas(Aye.modules.Nameplates.TEXTURES[Aye.db.global.Nameplates[unitType .."Icon"]][1]);
			else	Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetTexture(Aye.modules.Nameplates.TEXTURES[Aye.db.global.Nameplates[unitType .."Icon"]]);
			end;
			
			Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetDesaturated(true);
			
			-- color
			if string.match(unitType, "Player$") then
				-- Player
				if Aye.db.global.Nameplates[unitType .."IconColorConstant"] then
					-- constant color
					Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(Aye.db.global.Nameplates[unitType .."IconColor"]);
				else
					-- class color
					local _, class = UnitClass(unitID);
					local color = RAID_CLASS_COLORS[class];
					
					Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(color.r, color.g, color.b, 1);
				end;
			else
				-- NPC
				if Aye.db.global.Nameplates[unitType .."IconColorCustom"] then
					-- custom color
					local r, g, b = UnitSelectionColor(unitID);
					local threatStatus = UnitThreatSituation("player", unitID);
					local combatState = "Neutral";
					
					if
							r > .4 and r < .6
						and	g > .4 and g < .6
						and b > .4 and b < .6
					then
						-- Tapped
						combatState = "Tapped";
					elseif
							threatStatus
						and	threatStatus >1
					then
						-- Tanked
						combatState = "Tanked";
					elseif UnitAffectingCombat(unitID) then
						-- Aggroed
						combatState = "Aggroed";
					elseif
							r > .9
						and	g < .1
						and b < .1
					then
						-- Hostile
						combatState = "Hostile";
					end;
					
					Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(unpack(Aye.db.global.Nameplates[unitType .."IconColor" ..combatState]));
				else
					-- blizzard color
					Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(unpack(UnitSelectionColor(unitID)));
				end;
			end;
			
			-- size
			Aye.modules.Nameplates.radar.markers.units[unitID]:SetWidth(Aye.db.global.Nameplates[unitType .."IconSize"]);
			Aye.modules.Nameplates.radar.markers.units[unitID]:SetHeight(Aye.db.global.Nameplates[unitType .."IconSize"]);
			
			-- ptiority
			Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), Aye.db.global.Nameplates[unitType .."IconPriority"] -8);
		end;
		
		-- set position of icon on radar
		Aye.modules.Nameplates.radar.markers.units[unitID]:ClearAllPoints();
		Aye.modules.Nameplates.radar.markers.units[unitID]:SetPoint(
			"CENTER",
			Aye.modules.Nameplates.radar.background,
			"BOTTOMLEFT",
			(
					(nameplate:GetLeft() +nameplate:GetWidth() /2)
				*	Aye.db.global.Nameplates.radarSize /100
				*	Aye.modules.Nameplates.__TARGET_REVERSE_SCALING(unitID)
				*	UIParent:GetWidth() /WorldFrame:GetWidth()
				*	WorldFrame:GetHeight() /WorldFrame:GetWidth()
			), (
					(nameplate:GetBottom() +nameplate:GetHeight() /2)
				*	Aye.db.global.Nameplates.radarSize /100
				*	Aye.modules.Nameplates.__TARGET_REVERSE_SCALING(unitID)
				*	UIParent:GetHeight() /WorldFrame:GetHeight()
			)
		);
		
		-- focusing mark
		if
				Aye.db.global.Nameplates.focusEnable
			and	UnitIsUnit(unitID, "focus")
		then
			-- override focus priority
			if Aye.db.global.Nameplates.focusLayerOverride then
				Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), Aye.db.global.Nameplates.focusLayerPriority -8);
			end;
			
			-- set and adjust focusing mark
			Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:SetWidth(Aye.modules.Nameplates.radar.markers.units[unitID]:GetWidth() *1.5);
			Aye.modules.Nameplates.radar.markers.units[unitID].focusingFrame:SetHeight(Aye.modules.Nameplates.radar.markers.units[unitID]:GetHeight() *1.5);
			Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetTexture(Aye.modules.Nameplates.TARGETING_TEXTURES[Aye.db.global.Nameplates.focusIcon]);
			Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetDrawLayer(Aye.modules.Nameplates.radar.markers.units[unitID].icon:GetDrawLayer());
			Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetVertexColor(1, 1, 1, 1);
		else
			Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetVertexColor(0, 0, 0, 0);
		end;
		
		-- targeting mark
		if
				Aye.db.global.Nameplates.targetEnable
			and	UnitIsUnit(unitID, "target")
		then
			-- override target priority
			if Aye.db.global.Nameplates.targetLayerOverride then
				Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetDrawLayer(string.sub(Aye.db.global.Nameplates.layer, 2), Aye.db.global.Nameplates.targetLayerPriority -8);
			end;
			
			-- set and adjust targeting mark
			Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:SetWidth(Aye.modules.Nameplates.radar.markers.units[unitID]:GetWidth() *1.5);
			Aye.modules.Nameplates.radar.markers.units[unitID].targetingFrame:SetHeight(Aye.modules.Nameplates.radar.markers.units[unitID]:GetHeight() *1.5);
			Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetTexture(Aye.modules.Nameplates.TARGETING_TEXTURES[Aye.db.global.Nameplates.targetIcon]);
			Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetDrawLayer(Aye.modules.Nameplates.radar.markers.units[unitID].icon:GetDrawLayer());
			Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetVertexColor(1, 1, 1, 1);
		else
			Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetVertexColor(0, 0, 0, 0);
		end;
	else
		-- hide icon
		Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(0, 0, 0, 0);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetVertexColor(0, 0, 0, 0);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetVertexColor(0, 0, 0, 0);
	end;
end;

-- remove not "player" unit from radar
--
-- @param unitID {"nameplate" ..uint} unit to remove from radar
-- @noreturn
Aye.modules.Nameplates.radar.removeUnit = function(unitID)
	if Aye.modules.Nameplates.radar.markers.units[unitID] then
		Aye.modules.Nameplates.radar.markers.units[unitID].icon:SetVertexColor(0, 0, 0, 0);
		Aye.modules.Nameplates.radar.markers.units[unitID].targetingIcon:SetVertexColor(0, 0, 0, 0);
		Aye.modules.Nameplates.radar.markers.units[unitID].focusingIcon:SetVertexColor(0, 0, 0, 0);
	end;
end;

-- update all units on radar
--
-- @noparam
-- @noreturn
Aye.modules.Nameplates.updateAll = function()
	if Aye.modules.Nameplates.updateTimer then Aye.modules.Nameplates.updateTimer:Cancel() end;
	
	for _, frame in pairs(C_NamePlate.GetNamePlates(true)) do
		if UnitExists(frame.namePlateUnitToken) then
			Aye.modules.Nameplates.radar.addUnit(frame.namePlateUnitToken);
		end;
	end;
	
	if Aye.db.global.Nameplates.enable then
		Aye.modules.Nameplates.updateTimer = C_Timer.NewTimer(Aye.db.global.Nameplates.updateInterval, function()
			Aye.modules.Nameplates.updateAll();
		end);
	end;
end;