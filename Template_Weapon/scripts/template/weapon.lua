
--[[
	some simple examples of how to start coding weapons.
	to test these weapons, you can - with this mod enabled - write in the console:
	
	weapon Weapon_Template
	weapon Weapon_Template2
	
	you can then look over the code below to see how they were made.
	you'll notice Weapon_Template looks cooler than Weapon_Template2.
	to find out more on why that is, you can look at
	Prime_Punchmech in ITB/scripts/weapons_prime.lua,
	and look at how the GetSkillEffect of this weapon is different.
]]


-- this line just gets the file path for your mod, so you can find all your files easily.
local path = mod_loader.mods[modApi.currentMod].resourcePath

-- add assets from our mod so the game can find them.
modApi:appendAsset("img/weapons/template_weapon.png", path .."img/weapons/template/weapon.png")

-- create a weapon based on Punchmech's Prime Punch.
-- using the new function creates a copy of an existing table,
-- and will use the variables and  function from it, unless we specify new values.
Weapon_Template = Prime_Punchmech:new{
	Name = "Awesome Punch!",
	Description = "Punches things.",
	Icon = "weapons/template_weapon.png", -- notice how the game starts looking in /img/
	Damage = 10,
	
	-- adding upgrades for your weapon can be a fun part.
	-- their names would be Weapon_Template_A, Weapon_Template_B and Weapon_Template_AB (combined)
	-- since we haven't made them yet, we set upgrades to 0 to avoid crashing the game.
	Upgrades = 0,
}

-- If we want our weapon to not have a base, we usually base it on Skill - the base for all weapons.
Weapon_Template2 = Skill:new{
	Name = "Dull Punch",
	Description = "Punches without any effects.",
	Icon = "weapons/template_weapon.png", -- we can reuse the image here, or we could have appended a different image.
	Damage = 1,
}

Weapon_Template3 = Prime_Flamethrower:new{
	Name = "THE RRRROASTINATOR!",
	Description = "ROASTS things.",
	Icon = "weapons/template_weapon.png", -- notice how the game starts looking in /img/
	Damage = 5,
	
	-- adding upgrades for your weapon can be a fun part.
	-- their names would be Weapon_Template_A, Weapon_Template_B and Weapon_Template_AB (combined)
	-- since we haven't made them yet, we set upgrades to 0 to avoid crashing the game.
	Upgrades = 0,
}

-- every weapon uses GetTargetArea to find out which tiles are clickable when activating the weapon.
-- p: the location of the shooter.
function Weapon_Template2:GetTargetArea(p)
	-- create a new list of points.
	local ret = PointList()
	
	-- look in every direction
	-- DIR_START == 0, DIR_END == 3
	for dir = DIR_START, DIR_END do
		-- we can convert a direction to a vector with DIR_VECTORS.
		-- we can then add two vectors together, to find all points adjacent to p.
		local adjacent = p + DIR_VECTORS[dir]
		
		-- Board.IsValid returns true if a point is on the board.
		if Board:IsValid(adjacent) then
			-- push_back is a function in PointList that adds a point to it.
			ret:push_back(adjacent)
		end
	end
	
	-- we should now have a list of all points adjacent to the shooter that is also on the board.
	-- we can output all valid points in the console to make sure.
	LOG("query Weapon_Template2 for list of points")
	LOG(save_table(extract_table(ret)))
	
	-- return this pointlist to the game.
	return ret
end

-- every weapon uses GetSkillEffect to preview an attack as well as executing it.
-- it is important to understand that all the code in this function runs
-- every time you hover over a new tile to target - updating the preview.
-- at the end of the function, we return a special variable of type SkillEffect.
-- when we select a tile to attack, the game will read through this variable
-- and execute anything you added to it.
-- p1: the location of the shooter.
-- p2: the location of the target.
function Weapon_Template2:GetSkillEffect(p1, p2)
	-- create a new effect object.
	local ret = SkillEffect()
	-- we can reference anything in Weapon_Template2 with the keyword 'self'.
	local damage = self.Damage
	
	local d = SpaceDamage(p2, damage)
	ret:AddMelee(p1, d)
	
	--return the effect object, both for preview purposes, as well as executing the attack.
	return ret
end
