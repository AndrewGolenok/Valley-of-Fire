//a = 0;
//text = "Hello, World!"

application_surface_enable(1);

surface_resize(application_surface, 1280 * 3, global.size * 3);
display_set_gui_size(1280, global.size);
room_set_width(room, 1280 * 3);
room_set_height(room, global.size * 3);
VIEW   = view_current; 
camera = camera_create_view(0, 0, 1280, global.size, 0, -1, 0, 0, 0, 0);
camera_destroy(camera_get_default());

view_enabled = true;
view_set_visible(VIEW, true);
view_set_xport(VIEW, 0);
view_set_yport(VIEW, 0);
view_set_wport(VIEW, 1280);
view_set_hport(VIEW, global.size);
	
window_set_size(1280, global.size);

view_set_camera(VIEW, camera);

global.hero = 1; // Переменная текущего персонажа

go_anim  = 0; // Есть анимация или нет
imgx     = 1; // Поворот персонажа
scale    = 0.6; // Скейл персонажа
anim_spd = 0.25; // Скорость анимации поворота

sc  = 1; // Поворот персонажа
set = 0; // Выбран персонаж

x = 200;
y = 544;

y += global.more_size / 2; // Автоподстройка

n = 0; // Анимация

var hero_sprite, hero_code_name;
hero_sprite    = asset_get_index("s_" + global.hero_code_name[global.hero] + "_idle");
hero_code_name = global.hero_code_name[global.hero];
	
sprite_index = hero_sprite;
image_speed  = 2.5;

load_go      = 0;
load_time    = 0;
load_alltime = 0;
load_second  = 0;
load_alpha   = 0;
load_scale   = 0;
load_angle   = 0;
load_angle1  = 0;
load_bullet  = 1;
load_text    = "Поиск соперника";
load_point   = "";
load_enemy_name   = "";
load_enemy_name   = generate_name();
load_enemy_sprite = asset_get_index("s_" + global.hero_code_name[irandom_range(1,11)] + "_idle_" + global.weapon);
load_enemy_scale  = 1;

load_image_index = 0;