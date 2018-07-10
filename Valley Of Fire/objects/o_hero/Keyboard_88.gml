if change = 0 && super = 0 && !enemy
	{
	skeleton_animation_set("super");
	change = 3;
	super  = 1;
	
	if global.hero = 1
		{ global.ability_dop_anim = 1; }
	}