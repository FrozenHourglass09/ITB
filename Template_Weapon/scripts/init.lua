
-- init.lua is the entry point of every mod

local mod = {
	id = "lmn_weapon_template",
	name = "Weapon Template",
	version = "0.1.0",
	requirements = {},
	modApiVersion = "2.3.0",
	icon = "img/mod_icon.png"
}

function mod:init()
	-- look in template/weapon to see how to code weapons.
	require(self.scriptPath .."template/weapon")
end

function mod:load(options, version)
end

return mod
