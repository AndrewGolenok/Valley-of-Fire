equation_text = "";
vtext[2] = "=";
vtext[3] = "≠";

vtrue[2] = 0;
vtrue[3] = 0;

var a, b, ab, c, d, cd, sgn1, sgn2, rr, rdd;

sgn1 = choose("+","-");
sgn2 = choose("+","-");
		
rr = irandom(1);
		
if sgn1 = "-"
	{
	b  = irandom_range(1, 145 - (global.player_rank - 1) * 10);
	a  = irandom_range(b, 145 - (global.player_rank - 1) * 10);
	ab = a - b;
	}
if sgn1 = "+"
	{
	a  = irandom_range(1, 145 - (global.player_rank - 1) * 10);
	b  = irandom_range(1, 145 - (global.player_rank - 1) * 10);
	ab = a + b;
	}
			
#region Если минус или плюс
	if sgn2 = "-" or sgn2 = "+"
		{
		if rr = 1
			{
			rdd = 1;
			rdd = irandom_range(1, a - 1);
			if sgn1 = "+"
				{
				if sgn2 = "-"
					{
					c = a + rdd;
					d = b - rdd;
					}
					else
					{
					if irandom(0) = 0
						{
						c = a - rdd;
						d = b + rdd;
						}
						else
						{
						c = a + rdd;
						d = b - rdd;
						}
					}
				}
			if sgn1 = "-"
				{
				if sgn2 = "-"
					{
					c = a + rdd;
					d = b - rdd;
					}
					else
					{
					if irandom(0) = 0
						{
						c = a - rdd;
						d = b + rdd;
						}
						else
						{
						c = a + rdd;
						d = b - rdd;
						}
					}
				}
			cd = c - d;
			}
			else
			{
			if sgn2 = "-"
				{
				d  = irandom_range(1, 150 - (global.player_rank - 1) * 10);
				c  = irandom_range(d, 150 - (global.player_rank - 1) * 10);
				cd = c - d;
				if cd = ab
					{ c += 1; cd = c - d; }
				}
				else
				{
				d  = irandom_range(1, 150 - (global.player_rank - 1) * 10);
				c  = irandom_range(1, 150 - (global.player_rank - 1) * 10);
				cd = c + d;
				if cd = ab
					{ c += 1; cd = c + d; }
				}
			}
		}
#endregion

if a < 0
	{ a = 0; ab = a + b; }
if b < 0
	{ a = 0; ab = a + b; }
if c < 0
	{ c = 0; cd = c + d; }
if d < 0
	{ d = 0; cd = c + d; }
	
if ab = cd
	{ vtrue[2] = 1; vtrue[3] = 0; }
	else
	{ vtrue[3] = 1; vtrue[2] = 0; }
			
equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);