scale = 1//0.2;

//if !audio_is_playing(sd_music)
//		{ audio_play_sound(sd_music, 1, 1);  }
		
//hero_left[1] = asset_get_index("s_"+global.hero_code_name[5]+"");
//hero_left[2] = asset_get_index("s_"+global.hero_code_name[7]+"");
//hero_left[3] = asset_get_index("s_"+global.hero_code_name[1]+"");

//hero_right[1] = asset_get_index("s_"+global.hero_code_name[6]+"");
//hero_right[2] = asset_get_index("s_huntress");
//hero_right[3] = asset_get_index("s_chief");

n = 0;

xn[1] = 200;
xn[2] = 600;
xn[3] = 1000;

alp = 0; // Прозрасность тени

go = 0; // Движение солнца, тени и текста

text1 = "SMART";
text2 = "COWBOYS";

text_y = 50;
text_scale = 0;
text_spd = 0.02; // Текст 1

text_y2 = 50;
text_scale2 = 0; // Текст2

back = s_menu0;

/////////////////
all_y      = 1200;
sun_y      = 200;
sun_angle  = 0;
sun_scale  = 0.7;

iphonex_s = 1;
iphonex_y = 0;

if global.size < 700
	{
	iphonex_y = 700 - global.size - 50;
	iphonex_s = global.size / 700 - 0.1;
	}

sherif_x   = 550//640;
chief_x    = 550//640;
heroes1_x  = 500;
heroes2_x  = 500;

sherif_dir  = 1;
chief_dir   = -1
sherif_y    = 0;
chief_y     = 0;
heroes1_dir = -1;
heroes2_dir = 1;

smart_y       = 1;
smart_angle   = 0;
smart_scale   = 0;

cowboys_y     = 1;
cowboys_angle = 0;
cowboys_scale = 0;

word_y = 0;

stage = 0;

back_scale = 0.3658;
back_scale1 = 0.3716 + 0.01;
	
dark_1 = 0.2;
dark_2 = 1;

load_alpha = 0;
load_go = 0;

of_scale = 10;
of_x = 0;
of_y = 0;

fire_alpha = 0;
fire_angle = 0;
fire_angle1 = 0;
fire_time = room_speed * 5;
fire_dir = 1;
fire_dir1 = 1;
fire_dist = 0;