
-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

-- read out other files and add what they return to variables.
local tooltips = require(path .."scripts/libs/tooltip")
local personalities = require(path .."scripts/libs/personality")
local dialog = require(path .."scripts/template/dialog")

local pilot = {
	Id = "Pilot_Template",					-- id must be unique. Used to link to art assets.
	Personality = "template_personality",	-- must match the id for a personality you have added to the game.
	Name = "Billy",
	Rarity = 1,
	Voice = "/voice/ralph",					-- audio. look in pilots.lua for more alternatives.
	Skill = "template_ability",				-- pilot's ability - Must add a tooltip for new skills.
}

-- add pilot to the game.
CreatePilot(pilot)

-- add assets - notice how the name is identical to pilot.Id
modApi:appendAsset("img/portraits/pilots/Pilot_Template.png", path .."img/portraits/template/pilot.png")
modApi:appendAsset("img/portraits/pilots/Pilot_Template_2.png", path .."img/portraits/template/pilot_2.png")
modApi:appendAsset("img/portraits/pilots/Pilot_Template_blink.png", path .."img/portraits/template/pilot_blink.png")

-- add ability tooltip - notice how the name is the same as pilot.Skill
tooltips.Add(
	"template_ability",
	PilotSkill(
		"Being Awesome",
		"Is Awesome"
	)
)

-- add personality.
local personality = personalities:new{ Label = "Template" }

-- add dialog to personality.
personality:AddDialog(dialog)

-- add personality to game - notice how the id is the same as pilot.Personality
Personality["template_personality"] = personality
