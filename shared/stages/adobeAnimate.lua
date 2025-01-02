
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example

--so for example, i made the sprites "stagelight_left" and "stagelight_right", i can use "scaleObject('stagelight_left', 1.1, 1.1)"
--to adjust the scale of specifically the one stage light on left instead of both of them

local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 420.95;
local yy = 313;
local xx2 = 952.9;
local yy2 = 350;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	makeLuaSprite('Aroom', 'si/Aroom', -1675, -950);
	setScrollFactor('Aroom', 1, 1);
	scaleObject('Aroom', 1.75, 1.75);

	makeLuaSprite('Awall', 'si/Awall', -1675, -950);
	setScrollFactor('Awall', 1, 1);
	scaleObject('Awall', 1.75, 1.75);

	makeLuaSprite('Al', 'si/Al', -1675, -950);
	setScrollFactor('Al', 1.35, 1.1);
	scaleObject('Al', 1.75, 1.75);

	makeLuaSprite('Ar', 'si/Ar', -1675, -950);
	setScrollFactor('Ar', 1.15, 1.05);
	scaleObject('Ar', 1.75, 1.75);

	makeLuaSprite('Abg', 'si/Abg', -960, -540);
	setScrollFactor('Abg', 0, 0);
	scaleObject('Abg', 1.2, 1.2);
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('stagelight_left', 'stage_light', -125, -100);
		setScrollFactor('stagelight_left', 0.9, 0.9);
		scaleObject('stagelight_left', 1.1, 1.1);

		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
		setScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setProperty('stagelight_right.flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
		setScrollFactor('stagecurtains', 1, 1);
		scaleObject('stagecurtains', 0.9, 0.9);

	end

	addLuaSprite('Awall', true);
	addLuaSprite('Abg', false);
	addLuaSprite('Al', false);
	addLuaSprite('Ar', false);
	addLuaSprite('Aroom', false);


end
