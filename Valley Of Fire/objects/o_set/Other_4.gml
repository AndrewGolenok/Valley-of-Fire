/*
if room!=o_set
	{
	#region Автоподстройка разрешения
		application_surface_enable(1);
	
		surface_resize(application_surface,1280,global.size);
		display_set_gui_size(1280,global.size);
		room_set_height(room,global.size);
		var VIEW=view_current; 
		var camera=camera_create_view(0,0,1280,global.size,0,-1,0,0,0,0);
		camera_destroy(camera_get_default());

		view_enabled = true;
		view_set_visible(VIEW,true);
		view_set_xport(VIEW,0);
		view_set_yport(VIEW,0);
		view_set_wport(VIEW,1280);
		view_set_hport(VIEW,global.size);
	
		window_set_size(1280,global.size);

		view_set_camera(VIEW, camera);
	#endregion
	}
if room=r_logo
	{ instance_create_depth(0,0,0,o_logo); }
if room=r_menu
	{ instance_create_depth(0,0,0,o_set_hero); }
if room=r_duel
	{ instance_create_depth(0,0,0,o_player); }