-- init.lua is the entry point of every mod

local mod = {
	id = "40k_legio_viatores",
	name = "Legio Viatores",
	version = "0.1.0",
	requirements = {},
	modApiVersion = "2.3.0",
	icon = "img/mod_icon.png"
}

function mod:init()
	--require(self.scriptPath .."palettes")
	require(self.scriptPath .."pawns")
	--require(self.scriptPath .."pilots")
	--require(self.scriptPath .."weapons")
end

function mod:load(options, version)
	modApi:addSquad(
		{
			"Legio Viatores",		
			"ImperatorMech",			
			"WarhoundMech",			
			"NemesisMech"			
		},
		"Legio Viatores",
		"A Titan Legion of the Collegia Titanica.",
		self.resourcePath .."img/mod_icon.png"
	)
end

return mod