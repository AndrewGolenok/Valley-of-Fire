// draw_question(qsprite, qimage, qx, qy, qwidth, qheight, qscale, qcolor, qalpha)
var qsprite, qimage, qx, qy, qwidth, qheight, qscale, qcolor, qalpha;
qsprite = argument0;
qimage  = argument1;
qx      = argument2;
qy      = argument3;

qwidth  = argument4;
qheight = argument5;

qscale  = abs(argument6);
qcolor  = argument7;
qalpha  = argument8;

draw_sprite_ext(qsprite, qimage, qx - qwidth / 2, qy - qheight / 2, qscale, qscale, 0, qcolor, qalpha);
draw_sprite_ext(qsprite, qimage, qx + qwidth / 2, qy - qheight / 2, -qscale, qscale, 0, qcolor, qalpha);

draw_sprite_ext(qsprite, qimage, qx - qwidth / 2, qy + qheight / 2, qscale, -qscale, 0, qcolor, qalpha);
draw_sprite_ext(qsprite, qimage, qx + qwidth / 2, qy + qheight / 2, -qscale, -qscale, 0, qcolor, qalpha);

draw_set_alpha(qalpha);

draw_set_color(qcolor);
draw_rectangle(qx - qwidth / 2 - 29, qy - qheight / 2, qx + qwidth / 2 + 28, qy + qheight / 2 - 1, 0);

draw_rectangle(qx - qwidth / 2, qy - qheight / 2 - 29, qx + qwidth / 2 - 1, qy - qheight / 2 - 1, 0);
draw_rectangle(qx - qwidth / 2, qy + qheight / 2, qx + qwidth / 2 - 1, qy + qheight / 2 + 28, 0);
draw_set_color(c_white);

draw_set_alpha(1);