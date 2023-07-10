
-- init.lua is the entry point of every mod

local mod = {
	id = "lmn_pilot_template",
	name = "Pilot Template",
	version = "0.1.0",
	requirements = {},
	modApiVersion = "2.3.0",
	icon = "img/mod_icon.png"
}

function mod:init()
	-- look in template/pilot to see how to code pilots.
	require(self.scriptPath .."template/pilot")
end

function mod:load(options, version)
end

return mod
