//draw_set_valign(fa_center);
//draw_set_halign(fa_center);

draw_set_color(argument10);
draw_sprite_ext(argument0, argument1, argument2 - 2, argument3, argument4, argument5, argument6, argument10, argument8);
draw_sprite_ext(argument0, argument1, argument2 + 2, argument3, argument4, argument5, argument6, argument10, argument8);
draw_sprite_ext(argument0, argument1, argument2, argument3 - 2, argument4, argument5, argument6, argument10, argument8);
draw_sprite_ext(argument0, argument1, argument2, argument3 + 2, argument4, argument5, argument6, argument10, argument8);

draw_sprite_ext(argument0, argument1, argument2 - 1, argument3 - 1, argument4, argument5, argument6, argument10, argument8);
draw_sprite_ext(argument0, argument1, argument2 + 1, argument3 + 1, argument4, argument5, argument6, argument10, argument8);
draw_sprite_ext(argument0, argument1, argument2 + 1, argument3 - 1, argument4, argument5, argument6, argument10, argument8);
draw_sprite_ext(argument0, argument1, argument2 - 1, argument3 + 1, argument4, argument5, argument6, argument10, argument8);

draw_set_color(argument9);
draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);