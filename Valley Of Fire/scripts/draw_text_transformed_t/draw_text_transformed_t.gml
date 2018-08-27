draw_set_valign(fa_center);
draw_set_halign(fa_center);

draw_set_alpha(0.5)
draw_set_color(argument7);
draw_text_transformed(argument0 - 2, argument1 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 + 2, argument1 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0, argument1 - 2 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0, argument1 + 2 + 25 * argument4, argument2, argument3, argument4, argument5);

draw_text_transformed(argument0 - 1, argument1 - 1 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 + 1, argument1 + 1 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 + 1, argument1 - 1 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 - 1, argument1 + 1 + 25 * argument4, argument2, argument3, argument4, argument5);

draw_set_color(argument6);
draw_text_transformed(argument0, argument1 + 25 * argument4, argument2, argument3, argument4, argument5);
draw_set_alpha(1);


draw_set_color(argument7);
draw_text_transformed(argument0 - 2, argument1, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 + 2, argument1, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0, argument1 - 2, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0, argument1 + 2, argument2, argument3, argument4, argument5);

draw_text_transformed(argument0 - 1, argument1 - 1, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 + 1, argument1 + 1, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 + 1, argument1 - 1, argument2, argument3, argument4, argument5);
draw_text_transformed(argument0 - 1, argument1 + 1, argument2, argument3, argument4, argument5);

draw_set_color(argument6);
draw_text_transformed(argument0, argument1, argument2, argument3, argument4, argument5);