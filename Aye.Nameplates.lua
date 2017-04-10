local Aye = Aye;
if not Aye.addModule("Aye.Nameplates") then return end;

Aye.modules.Nameplates.OnEnable = function()
	Aye.modules.Nameplates.radar.init();
	Aye.modules.Nameplates.radar.addPlayer();
	
	Aye.modules.Nameplates.updateTimer = C_Timer.NewTimer(Aye.db.global.Nameplates.updateInterval, function()
		Aye.modules.Nameplates.updateAll();
	end);
end;