local Aye = Aye;
if not Aye.load then return end;

Aye.options.args.Nameplates = {
	name = "Nameplates",
	type = "group",
	args = {
		header1 = {
			order = 1,
			type = "header",
			name = "Nameplates",
		},
		description2 = {
			order = 2,
			type = "description",
			name = "|cffe6cc80Nameplates|r Radar |cff9d9d9daka|r Unit Minimap.",
		},
		enable = {
			order = 3,
			name = "Enable",
			desc = "Enable \"Nameplates\" options at all",
			type = "toggle",
			get = function() return Aye.db.global.Nameplates.enable end,
			set = function(_, v)
				Aye.db.global.Nameplates.enable = v;
				Aye.modules.Nameplates.radar.background:SetAlpha(Aye.db.global.Nameplates.enable and 1 or 0);
				Aye.modules.Nameplates.radar.addPlayer();
				Aye.modules.Nameplates.updateAll();
			end,
		},
		execute5 = {
			order = 5,
			type = "execute",
			name = "Disable & Reload",
			func = function() DisableAddOn("Aye.Nameplates"); ReloadUI(); end,
			hidden = function() return Aye.db.global.Nameplates.enable end,
		},
		description6 = {
			order = 6,
			type = "description",
			name = "This module is currently temporary |cff9d9d9ddisabled|r at will and should no longer work.\n"
				.. "|cff9d9d9dIf you wish to keep this module disabled, you should disable related addon completelly.\n"
				.. "You can always re–enable module by re–enabling related addon addon the same way.\n|r"
			,
			hidden = function() return Aye.db.global.Nameplates.enable end,
		},
		execute7 = {
			order = 7,
			type = "execute",
			name = "Default module settings",
			desc = "Reset settings of this module to default.\n\n|cff9d9d9dIf you wish to reset settings of all Aye modules instead, "
				.. "use \"Defaults\" options from left bottom corner of \"Interface\" window, then select \"These Settings\".|r"
			,
			func = function()
				Aye.db.global.Nameplates = CopyTable(Aye.default.global.Nameplates);
				Aye.libs.ConfigRegistry:NotifyChange("Aye");
				Aye.modules.Nameplates.radar.background:SetWidth(UIParent:GetHeight() *Aye.db.global.Nameplates.radarSize /100);
				Aye.modules.Nameplates.radar.background:SetHeight(UIParent:GetHeight() *Aye.db.global.Nameplates.radarSize /100);
				Aye.modules.Nameplates.radar.background:SetBackdropColor(unpack(Aye.db.global.Nameplates.backgroundColor));
				Aye.modules.Nameplates.radar.background:SetBackdropBorderColor(unpack(Aye.db.global.Nameplates.backgroundBorderColor));
				Aye.modules.Nameplates.radar.addPlayer();
				Aye.modules.Nameplates.updateAll();
			end,
			hidden = function() return not Aye.db.global.Nameplates.enable end,
		},
		header11 = {
			order = 11,
			type = "header",
			name = "\"Nameplates\" options",
		},
		radarSize = {
			order = 13,
			name = "Radar size |cff9d9d9d(in screen height %)|r",
			desc = "Size of radar minimap in percent of screen |cff9d9d9d(UIParent)|r height. Radar will be squared |cff9d9d9d(width will be scaled to height)|r.",
			type = "range",
			min = 0,
			max = 100,
			softMin = 10,
			softMax = 30,
			bigStep = 5,
			get = function() return Aye.db.global.Nameplates.radarSize end,
			set = function(_, v)
				Aye.db.global.Nameplates.radarSize = v;
				Aye.modules.Nameplates.radar.background:SetWidth(UIParent:GetHeight() *Aye.db.global.Nameplates.radarSize /100);
				Aye.modules.Nameplates.radar.background:SetHeight(UIParent:GetHeight() *Aye.db.global.Nameplates.radarSize /100);
				Aye.modules.Nameplates.radar.addPlayer();
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return not Aye.db.global.Nameplates.enable end,
		},
		updateInterval = {
			order = 15,
			name = "Update interval |cff9d9d9d(in s)|r",
			desc = "Interval of radar updates |cff9d9d9d(in s)|r.\n\n|cff9d9d9dIncreasing this value will increase performance, but may cause unit icons not to move smoothly.|r",
			type = "range",
			min = 0,
			max = 1,
			softMin = .01,
			softMax = .1,
			bigStep = .01,
			get = function() return Aye.db.global.Nameplates.updateInterval end,
			set = function(_, v) Aye.db.global.Nameplates.updateInterval = v end,
			disabled = function() return not Aye.db.global.Nameplates.enable end,
		},
		layer = {
			order = 16,
			name = "Layer",
			desc = "Choose layer level |cff9d9d9d(higher is more important)|r",
			type = "select",
			values = {
				["1BACKGROUND"]	= "|cff9d9d9d1.|r BACKGROUND",
				["2BORDER"]		= "|cff9d9d9d2.|r BORDER",
				["3ARTWORK"]	= "|cff9d9d9d3.|r ARTWORK",
				["4OVERLAY"]	= "|cff9d9d9d4.|r OVERLAY",
			},
			get = function() return Aye.db.global.Nameplates.layer end,
			set = function(_, v)
				Aye.db.global.Nameplates.layer = v;
				Aye.modules.Nameplates.radar.addPlayer();
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return not Aye.db.global.Nameplates.enable end,
		},
		header17 = {
			order = 17,
			type = "header",
			name = "Radar Background options",
		},
		backgroundColor = {
			order = 18,
			name = "Background Color",
			desc = "Set radar background color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates.backgroundColor) end,
			set = function(_, ...)
				Aye.db.global.Nameplates.backgroundColor = {...};
				Aye.modules.Nameplates.radar.background:SetBackdropColor(unpack(Aye.db.global.Nameplates.backgroundColor));
			end,
			disabled = function() return not Aye.db.global.Nameplates.enable end,
		},
		backgroundBorderColor = {
			order = 19,
			name = "Background Border Color",
			desc = "Set radar background border color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates.backgroundBorderColor) end,
			set = function(_, ...)
				Aye.db.global.Nameplates.backgroundBorderColor = {...};
				Aye.modules.Nameplates.radar.background:SetBackdropBorderColor(unpack(Aye.db.global.Nameplates.backgroundBorderColor));
			end,
			disabled = function() return not Aye.db.global.Nameplates.enable end,
		},
		
		targeting = {
			order = 20,
			type = "group",
			name = "Target |cff9d9d9d&|r Focus",
			args = {
				header21 = {
					order = 21,
					type = "header",
					name = "Target options",
				},
				targetEnable = {
					order = 23,
					name = "Show Target icon",
					desc = "Show Target icon around current target",
					type = "toggle",
					get = function() return Aye.db.global.Nameplates.targetEnable end,
					set = function(_, v)
						Aye.db.global.Nameplates.targetEnable = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return not Aye.db.global.Nameplates.enable end,
				},
				targetIcon = {
					order = 24,
					name = "Target Icon",
					desc = "Choose Target icon texture",
					type = "select",
					values = Aye.modules.Nameplates.TARGETING_TEXTURES_OPTIONS,
					get = function() return Aye.db.global.Nameplates.targetIcon end,
					set = function(_, v)
						Aye.db.global.Nameplates.targetIcon = v;
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.targetEnable
					end,
				},
				targetLayerOverride = {
					order = 26,
					name = "Override Target priority",
					desc = "Override Target priority |cff9d9d9d(and it's target icon priority aswell)|r",
					type = "toggle",
					get = function() return Aye.db.global.Nameplates.targetLayerOverride end,
					set = function(_, v)
						Aye.db.global.Nameplates.targetLayerOverride = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.targetEnable
					end,
				},
				targetLayerPriority = {
					order = 27,
					name = "Target Priority |cff9d9d9d(0−15)|r",
					desc = "Set priority of displaying Target and Target icon |cff9d9d9d(higher is more important)|r",
					type = "range",
					min = 0,
					max = 15,
					softMin = 0,
					softMax = 15,
					bigStep = 1,
					get = function() return Aye.db.global.Nameplates.targetLayerPriority end,
					set = function(_, v)
						Aye.db.global.Nameplates.targetLayerPriority = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.targetEnable
						or	not Aye.db.global.Nameplates.targetLayerOverride
					end,
				},
				header31 = {
					order = 31,
					type = "header",
					name = "Focus options",
				},
				focusEnable = {
					order = 33,
					name = "Show Focus icon",
					desc = "Show Focus icon around current focus target",
					type = "toggle",
					get = function() return Aye.db.global.Nameplates.focusEnable end,
					set = function(_, v)
						Aye.db.global.Nameplates.focusEnable = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return not Aye.db.global.Nameplates.enable end,
				},
				focusIcon = {
					order = 34,
					name = "Focus Icon",
					desc = "Choose Focus icon texture",
					type = "select",
					values = Aye.modules.Nameplates.TARGETING_TEXTURES_OPTIONS,
					get = function() return Aye.db.global.Nameplates.focusIcon end,
					set = function(_, v)
						Aye.db.global.Nameplates.focusIcon = v;
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.focusEnable
					end,
				},
				focusLayerOverride = {
					order = 36,
					name = "Override Focus priority",
					desc = "Override Focus priority |cff9d9d9d(and it's focus icon priority aswell)|r",
					type = "toggle",
					get = function() return Aye.db.global.Nameplates.focusLayerOverride end,
					set = function(_, v)
						Aye.db.global.Nameplates.focusLayerOverride = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.focusEnable
					end,
				},
				focusLayerPriority = {
					order = 37,
					name = "Focus Priority |cff9d9d9d(0−15)|r",
					desc = "Set priority of displaying Focus and Focus icon |cff9d9d9d(higher is more important)|r",
					type = "range",
					min = 0,
					max = 15,
					softMin = 0,
					softMax = 15,
					bigStep = 1,
					get = function() return Aye.db.global.Nameplates.focusLayerPriority end,
					set = function(_, v)
						Aye.db.global.Nameplates.focusLayerPriority = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.focusEnable
						or	not Aye.db.global.Nameplates.focusLayerOverride
					end,
				},
			},
		},
		
		unitsmarker = {
			order = 40,
			type = "group",
			name = "Marker |cff9d9d9d&|r Player",
			args = {
				header41 = {
					order = 41,
					type = "header",
					name = "\"Marker icon\" options",
				},
				markerIconEnable = {
					order = 43,
					name = "Enable",
					desc = "Enable \"Marker icon\" options at all",
					type = "toggle",
					get = function() return Aye.db.global.Nameplates.markerIconEnable end,
					set = function(_, v)
						Aye.db.global.Nameplates.markerIconEnable = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return not Aye.db.global.Nameplates.enable end,
				},
				description44 = {
					order = 44,
					type = "description",
					name = "",
				},
				markerIconSize = {
					order = 47,
					name = "Size",
					desc = "Set size of marker icon",
					type = "range",
					min = 4,
					max = 256,
					softMin = 8,
					softMax = 64,
					bigStep = 8,
					get = function() return Aye.db.global.Nameplates.markerIconSize end,
					set = function(_, v)
						Aye.db.global.Nameplates.markerIconSize = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.markerIconEnable
					end,
				},
				markerIconPriority = {
					order = 48,
					name = "Priority |cff9d9d9d(0−15)|r",
					desc = "Set priority of displaying marker icon |cff9d9d9d(higher is more important)|r",
					type = "range",
					min = 0,
					max = 15,
					softMin = 0,
					softMax = 15,
					bigStep = 1,
					get = function() return Aye.db.global.Nameplates.markerIconPriority end,
					set = function(_, v)
						Aye.db.global.Nameplates.markerIconPriority = v;
						Aye.modules.Nameplates.updateAll();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.markerIconEnable
					end,
				},
				
				header51 = {
					order = 51,
					type = "header",
					name = "\"Player icon\" options",
				},
				playerIconEnable = {
					order = 53,
					name = "Enable",
					desc = "Enable \"Player icon\" options at all",
					type = "toggle",
					get = function() return Aye.db.global.Nameplates.playerIconEnable end,
					set = function(_, v)
						Aye.db.global.Nameplates.playerIconEnable = v;
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return not Aye.db.global.Nameplates.enable end,
				},
				description54 = {
					order = 54,
					type = "description",
					name = "",
				},
				playerIcon = {
					order = 55,
					name = "Icon",
					desc = "Choose player icon texture",
					type = "select",
					values = Aye.modules.Nameplates.TEXTURES_OPTIONS,
					get = function() return Aye.db.global.Nameplates.playerIcon end,
					set = function(_, v)
						Aye.db.global.Nameplates.playerIcon = v;
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.playerIconEnable
					end,
				},
				playerIconColor = {
					order = 56,
					name = "Color",
					desc = "Set player icon color",
					type = "color",
					hasAlpha = true,
					get = function() return unpack(Aye.db.global.Nameplates.playerIconColor) end,
					set = function(_, ...)
						Aye.db.global.Nameplates.playerIconColor = {...};
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.playerIconEnable
					end,
				},
				playerIconSize = {
					order = 57,
					name = "Size",
					desc = "Set size of player icon",
					type = "range",
					min = 4,
					max = 256,
					softMin = 8,
					softMax = 64,
					bigStep = 8,
					get = function() return Aye.db.global.Nameplates.playerIconSize end,
					set = function(_, v)
						Aye.db.global.Nameplates.playerIconSize = v;
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.playerIconEnable
					end,
				},
				playerIconPriority = {
					order = 58,
					name = "Priority |cff9d9d9d(0−15)|r",
					desc = "Set priority of displaying player icon |cff9d9d9d(higher is more important)|r",
					type = "range",
					min = 0,
					max = 15,
					softMin = 0,
					softMax = 15,
					bigStep = 1,
					get = function() return Aye.db.global.Nameplates.playerIconPriority end,
					set = function(_, v)
						Aye.db.global.Nameplates.playerIconPriority = v;
						Aye.modules.Nameplates.radar.addPlayer();
					end,
					disabled = function() return
							not Aye.db.global.Nameplates.enable
						or	not Aye.db.global.Nameplates.playerIconEnable
					end,
				},
			},
		},
	},
};

local i = 70;
for unitID, option in pairs({
	-- Friendly Player
	{
		id = "friendlyPlayer",
		desc = "Friendly Player",
		player = true,
	},
	-- Enemy Player
	{
		id = "enemyPlayer",
		desc = "Enemy Player",
		player = true,
	},
	-- Enemy NPC
	{
		id = "enemyNPCBoss",
		desc = "Enemy NPC: Boss",
		player = false,
	},
	{
		id = "enemyNPCRareElite",
		desc = "Enemy NPC: Rare Elite",
		player = false,
	},
	{
		id = "enemyNPCRare",
		desc = "Enemy NPC: Rare",
		player = false,
	},
	{
		id = "enemyNPCElite",
		desc = "Enemy NPC: Elite",
		player = false,
	},
	{
		id = "enemyNPCNormal",
		desc = "Enemy NPC: Normal",
		player = false,
	},
	{
		id = "enemyNPCMinus",
		desc = "Enemy NPC: Minus",
		player = false,
	},
	{
		id = "enemyNPCTrivial",
		desc = "Enemy NPC: Trivial",
		player = false,
	},
}) do
	-- group group
	i =i +1;
	Aye.options.args.Nameplates.args["units" ..unitID] = {
		order = i,
		type = "group",
		name = option.desc,
		args = {},
	};
	
	-- group header
	i =i +1;
	Aye.options.args.Nameplates.args["units" ..unitID].args["header" ..i] = {
		order = i,
		type = "header",
		name = "\"" ..option.desc .." icon\" options",
	};
	
	-- enable group checkbox
	i =i +2;
	Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconEnable"] = {
		order = i,
		name = "Enable",
		desc = "Enable \"" ..option.desc .." icon\" options at all",
		type = "toggle",
		get = function() return Aye.db.global.Nameplates[option.id .."IconEnable"] end,
		set = function(_, v)
			Aye.db.global.Nameplates[option.id .."IconEnable"] = v;
			Aye.modules.Nameplates.updateAll();
		end,
		disabled = function() return not Aye.db.global.Nameplates.enable end,
	};
	
	-- spacer
	i =i +3;
	Aye.options.args.Nameplates.args["units" ..unitID].args["description" ..i] = {
		order = i,
		type = "description",
		name = "",
	};
	
	-- icon texture
	i =i +1;
	Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."Icon"] = {
		order = i,
		name = "Icon",
		desc = "Choose " ..option.desc .." icon texture",
		type = "select",
		values = Aye.modules.Nameplates.TEXTURES_OPTIONS,
		get = function() return Aye.db.global.Nameplates[option.id .."Icon"] end,
		set = function(_, v)
			Aye.db.global.Nameplates[option.id .."Icon"] = v;
			Aye.modules.Nameplates.updateAll();
		end,
		disabled = function() return
				not Aye.db.global.Nameplates.enable
			or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
		end,
	};
	
	-- spacer
	i =i +4;
	Aye.options.args.Nameplates.args["units" ..unitID].args["description" ..i] = {
		order = i,
		type = "description",
		name = "",
	};
	
	if option.player then
		-- Player
		
		-- is icon color constant checkbox
		i =i +2;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorConstant"] = {
			order = i,
			name = "Constant color",
			desc = "Set constant " ..option.desc .." icon color.\n\n|cff9d9d9dIf disabled, " ..option.desc .." icon color will be dynamically set to its class color.|r",
			type = "toggle",
			get = function() return Aye.db.global.Nameplates[option.id .."IconColorConstant"] end,
			set = function(_, v)
				Aye.db.global.Nameplates[option.id .."IconColorConstant"] = v;
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
			end,
		};
		
		-- icon color
		i =i +1;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColor"] = {
			order = i,
			name = "Color",
			desc = "Set " ..option.desc .." icon color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates[option.id .."IconColor"]) end,
			set = function(_, ...)
				Aye.db.global.Nameplates[option.id .."IconColor"] = {...};
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
				or	not Aye.db.global.Nameplates[option.id .."IconColorConstant"]
			end,
		};
		
		i =i +10;
	else
		-- NPC
		
		-- is icon color custom
		i =i +2;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorCustom"] = {
			order = i,
			name = "Custom color",
			desc = "Set custom " ..option.desc .." icon color dynamically, according to combat status.\n\n|cff9d9d9dIf disabled, "
				.. option.desc .." icon color will be automatically determined by Blizzard, ex. yellow, red, or gray.|r"
			,
			type = "toggle",
			get = function() return Aye.db.global.Nameplates[option.id .."IconColorCustom"] end,
			set = function(_, v)
				Aye.db.global.Nameplates[option.id .."IconColorCustom"] = v;
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
			end,
		};
		
		-- icon color: Tanked
		i =i +1;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorTanked"] = {
			order = i,
			name = "Tanked Color",
			desc = "Set " ..option.desc .." tanked icon color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates[option.id .."IconColorTanked"]) end,
			set = function(_, ...)
				Aye.db.global.Nameplates[option.id .."IconColorTanked"] = {...};
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
				or	not Aye.db.global.Nameplates[option.id .."IconColorCustom"]
			end,
		};
		
		-- icon color: Aggroed
		i =i +1;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorAggroed"] = {
			order = i,
			name = "Aggroed Color",
			desc = "Set " ..option.desc .." aggroed icon color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates[option.id .."IconColorAggroed"]) end,
			set = function(_, ...)
				Aye.db.global.Nameplates[option.id .."IconColorAggroed"] = {...};
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
				or	not Aye.db.global.Nameplates[option.id .."IconColorCustom"]
			end,
		};
		
		-- icon color: Hostile
		i =i +1;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorHostile"] = {
			order = i,
			name = "Hostile Color",
			desc = "Set " ..option.desc .." hostile icon color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates[option.id .."IconColorHostile"]) end,
			set = function(_, ...)
				Aye.db.global.Nameplates[option.id .."IconColorHostile"] = {...};
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
				or	not Aye.db.global.Nameplates[option.id .."IconColorCustom"]
			end,
		};
		
		-- icon color: Neutral
		i =i +1;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorNeutral"] = {
			order = i,
			name = "Neutral Color",
			desc = "Set " ..option.desc .." neutral icon color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates[option.id .."IconColorNeutral"]) end,
			set = function(_, ...)
				Aye.db.global.Nameplates[option.id .."IconColorNeutral"] = {...};
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
				or	not Aye.db.global.Nameplates[option.id .."IconColorCustom"]
			end,
		};
		
		-- icon color: Tapped
		i =i +1;
		Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconColorTapped"] = {
			order = i,
			name = "Tapped Color",
			desc = "Set " ..option.desc .." tapped |cff9d9d9d(by other group)|r icon color",
			type = "color",
			hasAlpha = true,
			get = function() return unpack(Aye.db.global.Nameplates[option.id .."IconColorTapped"]) end,
			set = function(_, ...)
				Aye.db.global.Nameplates[option.id .."IconColorTapped"] = {...};
				Aye.modules.Nameplates.updateAll();
			end,
			disabled = function() return
					not Aye.db.global.Nameplates.enable
				or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
				or	not Aye.db.global.Nameplates[option.id .."IconColorCustom"]
			end,
		};
	end;
	
	-- icon size
	i =i +2;
	Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconSize"] = {
		order = i,
		name = "Size",
		desc = "Set size of " ..option.desc .." icon",
		type = "range",
		min = 4,
		max = 256,
		softMin = 8,
		softMax = 64,
		bigStep = 8,
		get = function() return Aye.db.global.Nameplates[option.id .."IconSize"] end,
		set = function(_, v)
			Aye.db.global.Nameplates[option.id .."IconSize"] = v;
			Aye.modules.Nameplates.updateAll();
		end,
		disabled = function() return
				not Aye.db.global.Nameplates.enable
			or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
		end,
	};
	
	-- icon priority
	i =i +1;
	Aye.options.args.Nameplates.args["units" ..unitID].args[option.id .."IconPriority"] = {
		order = i,
		name = "Priority |cff9d9d9d(0−15)|r",
		desc = "Set priority of displaying " ..option.desc .." icon |cff9d9d9d(higher is more important)|r",
		type = "range",
		min = 0,
		max = 15,
		softMin = 0,
		softMax = 15,
		bigStep = 1,
		get = function() return Aye.db.global.Nameplates[option.id .."IconPriority"] end,
		set = function(_, v)
			Aye.db.global.Nameplates[option.id .."IconPriority"] = v;
			Aye.modules.Nameplates.updateAll();
		end,
		disabled = function() return
				not Aye.db.global.Nameplates.enable
			or	not Aye.db.global.Nameplates[option.id .."IconEnable"]
		end,
	};
	
	-- in sum, i += 30 per iteration
	i =i +3;
end;