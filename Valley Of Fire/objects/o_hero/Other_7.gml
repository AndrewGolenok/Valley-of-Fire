if bill_stage = 1
	{
	bill_stage = 2;
	global.super_ability = 0;
	hero_sprite = s_jbill;
	if !enemy
		{ o_list.atk   /= 3; }
		else
		{ o_list.e_atk /= 3; }
	image_speed = 2;
	change = 1;
	}

if diego_dynamit = 1
	{
	if global.super_ability = 1 && change = 3
		{ global.super_ability = 0; }
	hero_sprite = asset_get_index("s_" + global.hero_code_name[hero] + "2");
	}
	
if diego_dynamit != 1 && bill_stage = 0//>= 2
	{ hero_sprite = asset_get_index("s_" + global.hero_code_name[hero]); }

if change = 1
	{
	if global.super_ability = 1 && huntress_poison
		{
		global.super_ability  = 0;
		global.super_ability1 = 1;
		}
	if global.game_stage = 0
		{ global.game_stage = 1; }
	sprite_index = hero_sprite;
	skeleton_animation_set("idle");
	image_index = 0;
	image_speed = 2;
	change = 0;
	exit;
	}
if change = 2
	{
	sprite_index = hero_sprite;
	skeleton_animation_set("gunsout");
	image_index = 0;
	image_speed = 2;
	change = 1;
	exit;
	}
if change = 3
	{ sprite_index = hero_sprite; skeleton_animation_set("reload"); image_index = 0; image_speed = 2; change = 1; exit; }
	
if change = 4
	{
	stun_seconds -= 1;
	if stun_seconds > 1
		{ change = 4; }
		else
		{
		if hero = 6 && skeleton_animation_get() = "win"
			{ change = 2; }
			else
			{ change = 1; stun = 0; }
		}
	}
	
if change = 5
	{
	if hero = 6 or hero = 3
		{ image_index = 35; }
	if hero = 4
		{ image_index = 18; }
	if hero = 1
		{ image_index = 35; }
	if hero = 2
		{ image_index = 35; }
	stun_seconds -= 1;
	if stun_seconds > 1
		{ change = 5; }
		else
		{ change = 2; }
	}
	
//godamaged = 1;