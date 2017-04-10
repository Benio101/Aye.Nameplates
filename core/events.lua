local Aye = Aye;

Aye.modules.Nameplates.events.NAME_PLATE_UNIT_ADDED = function(unitID)
	Aye.modules.Nameplates.radar.addUnit(unitID);
end;

Aye.modules.Nameplates.events.NAME_PLATE_UNIT_REMOVED = function(unitID)
	Aye.modules.Nameplates.radar.removeUnit(unitID);
end;

Aye.modules.Nameplates.events.PLAYER_TARGET_CHANGED = function(unitID)
	Aye.modules.Nameplates.updateAll();
end;