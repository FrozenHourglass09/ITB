
-- init.lua is the entry point of every mod

local mod = {
	id = "lmn_mech_template",
	name = "Mech Template",
	version = "0.1.0",
	requirements = {},
	modApiVersion = "2.3.0",
	icon = "img/mod_icon.png"
}

function mod:init()
	-- look in template/mech to see how to code mechs.
	require(self.scriptPath .."template/mech")
end

function mod:load(options, version)
	-- after we have added our mechs, we can add a squad using them.
	modApi:addSquad(
		{
			"Template Squad",		-- title
			"TemplateMech",			-- mech #1
			"TemplateMech",			-- mech #2
			"TemplateMech"			-- mech #3
		},
		"Holo Flamers",
		"A squad made for testing.",
		self.resourcePath .."img/mod_icon.png"
	)
end

return mod
