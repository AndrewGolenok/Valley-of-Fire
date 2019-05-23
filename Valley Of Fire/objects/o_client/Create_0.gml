global.online = true;

cl_stage = 0;
ls_stage = 0;

ip   = "192.168.1.10";
port = 4567;

socket_c     = network_create_socket(network_socket_tcp);
is_connected = network_connect_raw(socket_c, ip, port);
buffer_c     = buffer_create(1024, buffer_fixed, 1);

txt = "";

global.text[1]   = "";
global.text[2]   = "";
global.text[3,1] = "";
global.text[3,2] = "";
global.text[3,3] = "";

global.fight = 0;
global.myid  = -1;
global.enid  = 0;
global.f_id  = "";

yy = 8;
xx = 8;

stage = 0;

ran_hero = irandom_range(1,8);
ran_tot1 = irandom_range(7,12);
ran_tot2 = irandom_range(13,18);
ran_tot3 = irandom_range(17,16);

global.level1 = 1;
global.rank1  = 15;
global.vers   = "1";

ping_time = 0;
ping_go   = 0;
ping_step = 0;
ping_max  = 0;

play_bot = 0;
back     = -1;
first_p  = -1;

index      = -1;
searching  = 0;
time_start = -1;

hp[1]       = 0;
hp[2]       = 0;
hp_max[1]   = 0;
hp_max[2]   = 0;
atk[1]      = 0;
atk[2]      = 0;
rank[1]     = -1;
rank[2]     = -1;
level[1]    = -1;
level[2]    = -1;
hero[1]     = -1;
hero[2]     = -1;

totems[1,1] = -1;
totems[1,2] = -1;
totems[1,3] = -1;
totems[2,1] = -1;
totems[2,2] = -1;
totems[2,3] = -1;

ready[1]    = 0;
ready[2]    = 0;

round_num   = 1;
task[1]     = 0;
question[1] = 0;
task[2]     = 0;
question[2] = 0;

theme[1]    = -1;
theme[2]    = -1;
theme[3]    = -1;

theme_r[1]  = -1;
theme_r[2]  = -1;
theme_r[3]  = -1;

answer[1]   = -1;
answer[2]   = -1;

super[1]    = true;
super[2]    = false;

skul[1]     = -1;
skul[2]     = -1;
skul[3]     = -1;

winner      = -1;
waiting     = 0;

show_dmg[1] = -1;
show_dmg[2] = -1;
show_tim[1] = -1;
show_tim[2] = -1;

need_hp[1]  = 0;
need_hp[2]  = 0;

real_hp[1]  = 0;
real_hp[2]  = 0;

rearr        = -1//1;
rearr_t      = room_speed;

nameg  = 0;
nameg2 = 0;
nameg2_time = -1;

go_theme = 0;

dosul = 0;

need_f = -1;

///
ready[1] = 1;
ready[2] = 1;