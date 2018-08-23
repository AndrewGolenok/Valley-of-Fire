if keyboard_check_pressed(ord("1"))
	{ room_goto_t("logo"); }
if keyboard_check_pressed(ord("2"))
	{ room_goto_t("menu"); }
if keyboard_check_pressed(ord("3"))
	{ room_goto_t("duel"); }

if keyboard_check(vk_left)
	{
	if global.paral_x > -1
		{ global.paral_x -= 0.1; }
	}
if keyboard_check(vk_right)
	{
	if global.paral_x < 1
		{ global.paral_x += 0.1; }
	}
if keyboard_check(vk_up)
	{
	if global.paral_y > -1
		{ global.paral_y -= 0.1; }
	}
if keyboard_check(vk_down)
	{
	if global.paral_y < 1
		{ global.paral_y += 0.1; }
	}

if os_type != os_macosx
	{
	global.paral_x = device_get_tilt_y();
	global.paral_y = device_get_tilt_x();
	}
#region Отладка
	draw_set_font(global.game_font);
	//draw_text_transformed_t(mouse_x, mouse_y, string(global.paral_x) + ":" + string(global.paral_y), 0.25, 0.25, 0, c_white, c_black);
#endregion