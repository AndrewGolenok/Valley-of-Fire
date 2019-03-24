var text, ty, symb;
text = argument2;
ty   = 25 * argument3;
symb = string_length(text);

for(i = 1; i <= symb; i ++)
	{
	if i mod 2 = 0
		{ ty = 5; }
		else
		{ ty = -5; }
	draw_text_transformed_t(argument0 + string_width(string_copy(text, 1, i - 1)) * argument3 - string_width(text) / 2 * argument3, argument1 + ty, string_copy(text, i, 1), argument3, argument4, argument5, argument6, argument7);
	}