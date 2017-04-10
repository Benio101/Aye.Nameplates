local Aye = Aye;

-- textures
Aye.modules.Nameplates.TEXTURES = {};
Aye.modules.Nameplates.TEXTURES_OPTIONS = {};

-- TEXTURES order
-- Lower number is higher on list
--
--  1 = Circle				MINIMAP				Atlas
--  2 = Ring				MINIMAP				Atlas
--  3 = Focus				MINIMAP/Ping		Texture
--  4 = Target				MINIMAP/Ping		Texture
-- 11 = Skull				WorldMap			Texture
-- 12 = Skull (3D)			WorldMap			Texture
-- 13 = Skull (Glow)		WorldMap			Texture
-- 14 = Skull (Circled)		MINIMAP				Texture
-- 21 = Gear				WorldMap			Texture
-- 22 = "X" Mark			WorldMap			Texture
-- 41 = Horde (Logo)		Timer				Texture
-- 42 = Alliance (Logo)		Timer				Texture
-- 51 = Chat Bubble			WorldMap			Texture
-- 61 = Minus				WorldMap			Texture
-- 62 = Plus				PaperDollInfoFrame	Texture
-- 63 = Plus (Circled)		MINIMAP				Texture
-- 81 = Shield				HELPFRAME			Texture
-- 82 = Sword				HELPFRAME			Texture
-- 83 = Fire				HELPFRAME			Texture
-- 84 = Lightning			HELPFRAME			Texture
-- 85 = Shoes				HELPFRAME			Texture
-- 86 = Bulb				HELPFRAME			Texture

Aye.modules.Nameplates.TARGETING_TEXTURES = {};
Aye.modules.Nameplates.TARGETING_TEXTURES_OPTIONS = {};

-- TARGETING_TEXTURES order
-- Lower number is higher on list
--
--  1 = Arrows				MINIMAP/Ping		Texture
--  2 = Circle				MINIMAP/Ping		Texture
--  3 = Circle (with dot)	MINIMAP/Ping		Texture

-- HELPFRAME Textures
Aye.modules.Nameplates.TEXTURES["81Shield"] = "INTERFACE\\HELPFRAME\\HelpIcon-AccountSecurity";
Aye.modules.Nameplates.TEXTURES_OPTIONS["81Shield"] = "|TINTERFACE\\HELPFRAME\\HelpIcon-AccountSecurity:16|t Shield";

Aye.modules.Nameplates.TEXTURES["83Fire"] = "INTERFACE\\HELPFRAME\\HelpIcon-HotIssues";
Aye.modules.Nameplates.TEXTURES_OPTIONS["83Fire"] = "|TINTERFACE\\HELPFRAME\\HelpIcon-HotIssues:16|t Fire";

Aye.modules.Nameplates.TEXTURES["82Sword"] = "INTERFACE\\HELPFRAME\\HelpIcon-ItemRestoration";
Aye.modules.Nameplates.TEXTURES_OPTIONS["82Sword"] = "|TINTERFACE\\HELPFRAME\\HelpIcon-ItemRestoration:16|t Sword";

Aye.modules.Nameplates.TEXTURES["86Bulb"] = "INTERFACE\\HELPFRAME\\HelpIcon-Suggestion";
Aye.modules.Nameplates.TEXTURES_OPTIONS["86Bulb"] = "|TINTERFACE\\HELPFRAME\\HelpIcon-Suggestion:16|t Bulb";

Aye.modules.Nameplates.TEXTURES["85Shoes"] = "INTERFACE\\HELPFRAME\\ReportLagIcon-Movement";
Aye.modules.Nameplates.TEXTURES_OPTIONS["85Shoes"] = "|TINTERFACE\\HELPFRAME\\ReportLagIcon-Movement:16|t Shoes";

Aye.modules.Nameplates.TEXTURES["84Lightning"] = "INTERFACE\\HELPFRAME\\ReportLagIcon-Spells";
Aye.modules.Nameplates.TEXTURES_OPTIONS["84Lightning"] = "|TINTERFACE\\HELPFRAME\\ReportLagIcon-Spells:16|t Lightning";

-- MINIMAP Atlas
-- credits to nevcairiel and ls- #wowuidev for pointing out PartyRaidBlipsV2
Aye.modules.Nameplates.TEXTURES["01Circle"] = {"WhiteCircle-RaidBlips"};
Aye.modules.Nameplates.TEXTURES_OPTIONS["01Circle"] = "|TINTERFACE\\MINIMAP\\PartyRaidBlipsV2:16:16:0:0:64:32:1:20:1:19|t Circle";

Aye.modules.Nameplates.TEXTURES["02Ring"] = {"WhiteDotCircle-RaidBlips"};
Aye.modules.Nameplates.TEXTURES_OPTIONS["02Ring"] = "|TINTERFACE\\MINIMAP\\PartyRaidBlipsV2:16:16:0:0:64:32:22:41:1:19|t Ring";

-- MINIMAP Textures
Aye.modules.Nameplates.TEXTURES["14SkullCircled"] = "INTERFACE\\MINIMAP\\Minimap_skull_normal";
Aye.modules.Nameplates.TEXTURES_OPTIONS["14SkullCircled"] = "|TINTERFACE\\MINIMAP\\Minimap_skull_normal:16|t Skull |cff9d9d9d(Circled)|r";

Aye.modules.Nameplates.TEXTURES["63PlusCircled"] = "INTERFACE\\MINIMAP\\UI-Minimap-ZoomInButton-Disabled";
Aye.modules.Nameplates.TEXTURES_OPTIONS["63PlusCircled"] = "|TINTERFACE\\MINIMAP\\UI-Minimap-ZoomInButton-Disabled:16|t Plus |cff9d9d9d(Circled)";

-- MINIMAP/Ping Targeting Textures
Aye.modules.Nameplates.TARGETING_TEXTURES["1Arrows"] = "INTERFACE\\MINIMAP\\Ping\\ping5";
Aye.modules.Nameplates.TARGETING_TEXTURES_OPTIONS["1Arrows"] = "|TINTERFACE\\MINIMAP\\Ping\\ping5:16|t Arrows";

Aye.modules.Nameplates.TARGETING_TEXTURES["2Circle"] = "INTERFACE\\MINIMAP\\Ping\\ping4";
Aye.modules.Nameplates.TARGETING_TEXTURES_OPTIONS["2Circle"] = "|TINTERFACE\\MINIMAP\\Ping\\ping4:16|t Circle";

Aye.modules.Nameplates.TARGETING_TEXTURES["3CircleWithDot"] = "INTERFACE\\MINIMAP\\Ping\\ping2";
Aye.modules.Nameplates.TARGETING_TEXTURES_OPTIONS["3CircleWithDot"] = "|TINTERFACE\\MINIMAP\\Ping\\ping2:16|t Circle |cff9d9d9d(with dot)|r";

-- MINIMAP/TRACKING Textures
Aye.modules.Nameplates.TEXTURES["04Target"] = "INTERFACE\\MINIMAP\\TRACKING\\Target";
Aye.modules.Nameplates.TEXTURES_OPTIONS["04Target"] = "|TINTERFACE\\MINIMAP\\TRACKING\\Target:16|t Target";

Aye.modules.Nameplates.TEXTURES["03Focus"] = "INTERFACE\\MINIMAP\\TRACKING\\Focus";
Aye.modules.Nameplates.TEXTURES_OPTIONS["03Focus"] = "|TINTERFACE\\MINIMAP\\TRACKING\\Focus:16|t Focus";

-- PaperDollInfoFrame Textures
Aye.modules.Nameplates.TEXTURES["62Plus"] = "INTERFACE\\PaperDollInfoFrame\\Character-Plus";
Aye.modules.Nameplates.TEXTURES_OPTIONS["62Plus"] = "|TINTERFACE\\PaperDollInfoFrame\\Character-Plus:16|t Plus";

-- Timer Textures
Aye.modules.Nameplates.TEXTURES["41Horde"] = "INTERFACE\\Timer\\HordeGlow-Logo";
Aye.modules.Nameplates.TEXTURES_OPTIONS["41Horde"] = "|TINTERFACE\\Timer\\HordeGlow-Logo:16|t Horde |cff9d9d9dLogo|r";

Aye.modules.Nameplates.TEXTURES["42Alliance"] = "INTERFACE\\Timer\\AllianceGlow-Logo";
Aye.modules.Nameplates.TEXTURES_OPTIONS["42Alliance"] = "|TINTERFACE\\Timer\\AllianceGlow-Logo:16|t Alliance |cff9d9d9dLogo|r";

-- WorldMap Textures
Aye.modules.Nameplates.TEXTURES["11Skull"] = "INTERFACE\\WorldMap\\Skull_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["11Skull"] = "|TINTERFACE\\WorldMap\\Skull_64Grey:16|t Skull";

Aye.modules.Nameplates.TEXTURES["13SkullGlow"] = "INTERFACE\\WorldMap\\GlowSkull_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["13SkullGlow"] = "|TINTERFACE\\WorldMap\\GlowSkull_64Grey:16|t Skull |cff9d9d9d(Glow)|r";

Aye.modules.Nameplates.TEXTURES["12Skull3D"] = "INTERFACE\\WorldMap\\3DSkull_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["12Skull3D"] = "|TINTERFACE\\WorldMap\\3DSkull_64Grey:16|t Skull |cff9d9d9d(3D)|r";

Aye.modules.Nameplates.TEXTURES["21Gear"] = "INTERFACE\\WorldMap\\Gear_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["21Gear"] = "|TINTERFACE\\WorldMap\\Gear_64Grey:16|t Gear";

Aye.modules.Nameplates.TEXTURES["22X"] = "Interface\\WorldMap\\X_Mark_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["22X"] = "|TINTERFACE\\WorldMap\\X_Mark_64Grey:16|t |cff9d9d9d\"|rX|cff9d9d9d\"|r Mark";

Aye.modules.Nameplates.TEXTURES["61Minus"] = "INTERFACE\\WorldMap\\Dash_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["61Minus"] = "|TINTERFACE\\WorldMap\\Dash_64Grey:16|t Minus";

Aye.modules.Nameplates.TEXTURES["51ChatBubble"] = "INTERFACE\\WorldMap\\ChatBubble_64Grey";
Aye.modules.Nameplates.TEXTURES_OPTIONS["51ChatBubble"] = "|TINTERFACE\\WorldMap\\ChatBubble_64Grey:16|t Chat Bubble";

-- radar
Aye.modules.Nameplates.radar = {};
Aye.modules.Nameplates.radar.markers = {};
Aye.modules.Nameplates.radar.markers.units = {};