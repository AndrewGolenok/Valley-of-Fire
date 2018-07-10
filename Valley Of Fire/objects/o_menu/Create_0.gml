surf_blur_pass = surface_create(display_get_width(), display_get_height());//surface_create(1280, global.size); display_get_height() * 1280) / display_get_width()
application_surface_draw_enable(false);
uscale = shader_get_uniform (glsl_gaussian_blur, "u_Scale");

menu_stage = "dificult";

s0 = 0;
s1 = 0;
s2 = 0;
s3 = 0;

sd1 = 1;
sd2 = 1;
sd3 = 1;

///
px1 = 0;
py1 = 0;
ps1 = 1;

px2 = 0;
py2 = 0;
ps2 = 1;

px3 = 0;
py3 = 0;
ps3 = 1;

px4 = 0;
py4 = 0;
ps4 = 1;

px5 = 0;
py5 = 0;
ps5 = 1;

px6 = 0;
py6 = 0;
ps6 = 1;

px7 = 0;
py7 = 0;
ps7 = 1;

px8 = 0;
py8 = 0;
ps8 = 1;

px9 = 0;
py9 = 0;
ps9 = 1;

px10 = 0;
py10 = 0;
ps10 = 1;

px11 = 0;
py11 = 0;
ps11 = 1;
///

show = 1;

anim = 0;

s_time  = irandom_range(3, 6) * room_speed;
s_stage = 0;

hold_start = 0;
hold_true  = 0;
hold_time  = 0;
hold_go    = 0;