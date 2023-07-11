
-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

-- locate our mech assets.
local mechPath = path .."img/imperator/"

local files = {
	"mech.png",
	"mech_a.png",
	"mech_w.png",
	"mech_w_broken.png", 
	"mech_broken.png", 
	"mech_ns.png", 
	"mech_h.png"
}


for _, file in ipairs(files) do
	modApi:appendAsset("img/units/player/imperator_".. file, mechPath .. file)
end

local a = ANIMS
a.imperator_mech =			a.MechUnit:new{Image = "units/player/imperator_mech.png", PosX = -20, PosY = -10}
a.imperator_mecha =			a.MechUnit:new{Image = "units/player/imperator_mech_a.png", PosX = -21, PosY = -4, NumFrames = 4 }
a.imperator_mechw =			a.MechUnit:new{Image = "units/player/imperator_mech_w.png", PosX = -21, PosY = 6 } 
a.imperator_mech_broken =	a.MechUnit:new{Image = "units/player/imperator_mech_broken.png", PosX = -21, PosY = -5 }
a.imperator_mechw_broken =	a.MechUnit:new{Image = "units/player/imperator_mech_w_broken.png", PosX = -21, PosY = 6 }
a.imperator_mech_ns =		a.MechIcon:new{Image = "units/player/imperator_mech_ns.png"}

mechPath = path .."img/warhound/"

for _, file in ipairs(files) do
	modApi:appendAsset("img/units/player/warhound_".. file, mechPath .. file)
end

a.warhound_mech =			a.MechUnit:new{Image = "units/player/warhound_mech.png", PosX = -20, PosY = -6} 
a.warhound_mecha =			a.MechUnit:new{Image = "units/player/warhound_mech_a.png", PosX = -21, PosY = -6, NumFrames = 4 }
a.warhound_mechw =			a.MechUnit:new{Image = "units/player/warhound_mech_w.png", PosX = -19, PosY = 8 }
a.warhound_mech_broken =	a.MechUnit:new{Image = "units/player/warhound_mech_broken.png", PosX = -22, PosY = -5  }
a.warhound_mechw_broken =	a.MechUnit:new{Image = "units/player/warhound_mech_w_broken.png", PosX = -21, PosY = 3 }
a.warhound_mech_ns =		a.MechIcon:new{Image = "units/player/warhound_mech_ns.png"}

mechPath = path .."img/nemesis/"

for _, file in ipairs(files) do
	modApi:appendAsset("img/units/player/nemesis_".. file, mechPath .. file)
end

a.nemesis_mech =			a.MechUnit:new{Image = "units/player/nemesis_mech.png", PosX = -23, PosY = -2} 
a.nemesis_mecha =			a.MechUnit:new{Image = "units/player/nemesis_mech_a.png", PosX = -24, PosY = -2, NumFrames = 4 }
a.nemesis_mechw =			a.MechUnit:new{Image = "units/player/nemesis_mech_w.png", PosX = -22, PosY = 5 } 
a.nemesis_mech_broken =		a.MechUnit:new{Image = "units/player/nemesis_mech_broken.png", PosX = -23, PosY = -2 }
a.nemesis_mechw_broken =	a.MechUnit:new{Image = "units/player/nemesis_mech_w_broken.png", PosX = -24, PosY = 8 }
a.nemesis_mech_ns =			a.MechIcon:new{Image = "units/player/nemesis_mech_ns.png"}

ImperatorMech = Pawn:new{
	Name = "Imperator Titan",
	Class = "Prime",
	Health = 4,
	MoveSpeed = 2,
	Massive = true,
	Armor = true,
	
	Image = "imperator_mech",
	
	ImageOffset = 5,
	
	SkillList = { "Prime_Flamethrower" },

	SoundLocation = "/mech/prime/punch_mech/",

	ImpactMaterial = IMPACT_METAL,

	DefaultTeam = TEAM_PLAYER,
}

WarhoundMech = Pawn:new{
	Name = "Warhound Titan",
	Class = "Brute",
	Health = 3,
	MoveSpeed = 3,
	Massive = true,
	
	Image = "warhound_mech",
	
	ImageOffset = 5,
	
	SkillList = { "Prime_Flamethrower" },

	SoundLocation = "/mech/prime/punch_mech/",

	ImpactMaterial = IMPACT_METAL,

	DefaultTeam = TEAM_PLAYER,
}

NemesisMech = Pawn:new{
	Name = "Nemesis Titan",
	Class = "Ranged",
	Health = 3,
	MoveSpeed = 3,
	Massive = true,
	
	Image = "nemesis_mech",
	
	ImageOffset = 5,
	
	SkillList = { "Prime_Flamethrower" },

	SoundLocation = "/mech/prime/punch_mech/",

	ImpactMaterial = IMPACT_METAL,

	DefaultTeam = TEAM_PLAYER,
}

