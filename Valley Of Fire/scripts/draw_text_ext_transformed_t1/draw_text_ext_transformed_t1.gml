//draw_set_valign(fa_center);
//draw_set_halign(fa_center);

draw_set_color(argument9);
draw_text_ext_transformed(argument0 - 2, argument1, argument2, argument3, argument4, argument5, argument6, argument7);
draw_text_ext_transformed(argument0 + 2, argument1, argument2, argument3, argument4, argument5, argument6, argument7);
draw_text_ext_transformed(argument0, argument1 - 2, argument2, argument3, argument4, argument5, argument6, argument7);
draw_text_ext_transformed(argument0, argument1 + 2, argument2, argument3, argument4, argument5, argument6, argument7);

draw_text_ext_transformed(argument0 - 1, argument1 - 1, argument2, argument3, argument4, argument5, argument6, argument7);
draw_text_ext_transformed(argument0 + 1, argument1 + 1, argument2, argument3, argument4, argument5, argument6, argument7);
draw_text_ext_transformed(argument0 + 1, argument1 - 1, argument2, argument3, argument4, argument5, argument6, argument7);
draw_text_ext_transformed(argument0 - 1, argument1 + 1, argument2, argument3, argument4, argument5, argument6, argument7);

draw_set_color(argument8);
draw_text_ext_transformed(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7);