if keyboard_check_pressed(ord("1"))
	{ room_goto_t("logo"); }
if keyboard_check_pressed(ord("2"))
	{ room_goto_t("menu"); }
if keyboard_check_pressed(ord("3"))
	{ room_goto_t("sethero"); }
if keyboard_check_pressed(ord("4"))
	{ room_goto_t("duel"); }

//global.player_name=keyboard_string;
/*
draw_set_font(f_description_regular);
draw_text(mouse_x, mouse_y, "o_set="+string(instance_number(o_set))+"\no_logo="+string(instance_number(o_logo))+"\no_set_hero="+string(instance_number(o_set_hero))+"\no_control="+string(instance_number(o_control))+"\no_player="+string(instance_number(o_player))+"\no_transf="+string(instance_number(o_transf)));