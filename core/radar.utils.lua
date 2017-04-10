local Aye = Aye;

Aye.modules.Nameplates.__TARGET_REVERSE_SCALING_FACTOR = 1.25;
Aye.modules.Nameplates.__TARGET_REVERSE_SCALING = function(unitID)
	return (UnitIsUnit(unitID, "target") and 1 or (1 /Aye.modules.Nameplates.__TARGET_REVERSE_SCALING_FACTOR));
end;