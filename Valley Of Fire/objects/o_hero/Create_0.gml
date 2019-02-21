search = 1;

godamaged = 0;
damaged   = 0;

global.bill_propil = 0;

enemy = global.enemy;

bullet_index = 0;

have_posion = 0;

if enemy
	{ global.enemy_object  = id; }
	else
	{ global.player_object = id; }

global.weapon = global.hero_code_weapon[global.hero];
global.enemy_weapon = global.hero_code_weapon[global.enemy_hero];

if !enemy
	{
	hero   = global.hero;
	weapon = global.weapon;
	
	x  = -sprite_width / 2;
	xn = 150;
	
	ox = 1280 + sprite_width / 2;
	}
	else
	{
	hero   = global.enemy_hero;
	weapon = global.enemy_weapon;
	
	x  = 1280 + sprite_width / 2;
	xn = 1280 - 150; // 1130
	
	ox = -sprite_width / 2;
	}

//weapon = "";
hero_sprite = asset_get_index("s_" + global.hero_code_name[hero]/* + weapon*/);
hero_code_name = global.hero_code_name[hero];
//if weapon = "standard"
//	{ hero_bullet = asset_get_index("s_bullet_" + global.hero_code_weapon[hero]); }
//	else
//	{
hero_bullet   = asset_get_index("s_bullet_" + weapon);
hero_bullet_w = asset_get_index("s_bullet_" + weapon + "_w");
sc = enemy - !enemy;

sprite_index = hero_sprite;
image_speed  = 0;
skeleton_animation_set("greetings");

scale = 0.33 + global.more_size / 2700; // 1800 // 0.57 * global.size / 680;

if scale < 0.33
	{ scale = 0.33; }
if scale > 0.4
	{ scale = 0.4; } // 0.4
	
y = global.size - 460 + o_control.back_y// - 110 * scale / 0.4; //global.more_size / 2 + 294; //544 + global.more_size / 2;

change = 0;
shoot  = 0;

weapon_spd = 70;

stun_seconds = 1;
stun = 0;

super     = 0;
super_img = 0;
	
ability_index = 0;
ability_alpha = 1;
ability_back  = s_ability_back; //asset_get_index("s_ability_back_" + string(global.hero_code_name[hero]));

hero_shoot = 20;
knife_i = 0;
switch(hero)
	{
	case 1: hero_shoot = 9; hero_abindex = 23; break;
	case 2: hero_abindex = 23; break;
	case 5: hero_abindex = 23; break;
	case 7: hero_abindex = 23; break;
	
	case 6: hero_abindex = 26; break;
	case 4: hero_abindex = 26; break; // DIEGO ???
	case 3: hero_abindex = 35; break;
	}

hero_color = global.color_hero[hero];

sx = x;
sy = y; // Координаты снаряда

xx = 0;
yy = 0;

abil_n = 0;

bullet_alpha = 1;

answer = -1;

poisoned = 0;
huntress_poison = 0;
diego_dynamit   = 0;
dynamit_x  = 0;
dynamit_y  = 0;
dynamit_a  = 0;
dynamit_i  = 0;
dynamit_d  = 0;
diego_boom = -1;

bill_stage = 0;
bill_boom  = -1;

fire_time  = 0;

hand_away  = 0;

for(i=0;i<=10;i++)
	{ bullet_lx[i] = 0; }
bullet_lt = 0;
bullet_timer = 0;

if global.background = "mine"
	{
	y += 230;
	scale = 0.45;
	}
if global.background = "waterfall"
	{
	y += 100;
	}
if global.background = "saloon"
	{
	xn += 70 * !enemy - 70 * enemy;
	y  += 130;
	}
if global.background = "house"
	{
	y += 230;
	}
	
sc_dist  = 0;
sc_dir   = 1;
sc_spd   = 0.5;
sc_angle = 0;
if global.training > 0
	{
	if enemy
		{
		hero_sprite  = s_training_scarecrow;
		sprite_index = hero_sprite;
		image_index  = 0;
		image_speed  = 0;
		x = xn;
		change = 2;
		sc_dist = 10;
		}
	}