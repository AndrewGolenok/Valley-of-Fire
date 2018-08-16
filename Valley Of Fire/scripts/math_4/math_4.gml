equation_text = "";
vtext[2] = "=";
vtext[3] = "≠";

vtrue[2] = 0;
vtrue[3] = 0;

var a, b, ab, c, d, cd, sgn1, sgn2, rr, rdd;

sgn1 = choose("+","-");
sgn2 = choose("+","-");
//if global.player_rank > 10
//	{ sgn1 = choose("+","-"); sgn2 = choose("+","-"); }
//	else
//	{
//	if global.player_rank > 5
//		{ sgn1 = choose("+","-","*"); sgn2 = choose("+","-","*"); }
//		else
//		{ sgn1 = choose("+","-","/","*"); sgn2 = choose("+","-","/","*"); }
//	}
		
rr = irandom(1);
		
if sgn1 = "-"
	{
	b  = irandom_range(1, 150 - (global.player_rank - 1) * 10);
	a  = irandom_range(b, 150 - (global.player_rank - 1) * 10);
	ab = a - b;
	}
if sgn1 = "+"
	{
	a  = irandom_range(1, 150 - (global.player_rank - 1) * 10);
	b  = irandom_range(1, 150 - (global.player_rank - 1) * 10);
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
	{ vtrue[2] = 1; }
	else
	{ vtrue[3] = 1; }
			
equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);

#region 15 rank
	if global.player_rank = 15
		{
		var a, b, ab, c, d, cd, sgn1, sgn2, rr;
		sgn1 = choose("-", "+");
		sgn2 = choose("-", "+");
		
		rr = irandom(1);
		
		if sgn1 = "-"
			{
			b  = irandom(15);
			a  = irandom_range(b, 20);
			ab = a - b;
			}
		if sgn1 = "+"
			{
			a  = irandom(15);
			b  = irandom(15);
			ab = a + b;
			}
			
		if sgn2 = "-"
			{
			if rr = 1
				{
				d  = ab + irandom(15);
				c  = d - ab;
				cd = d - c;
				}
				else
				{
				d  = irandom(15);
				c  = irandom_range(b, 20);
				cd = c - d;
				}
			}
		if sgn2 = "+"
			{
			if rr = 1
				{
				c  = irandom_range(1, ab);
				d  = ab - c;
				cd = c + d;
				}
				else
				{
				c  = irandom(15);
				d  = irandom(15);
				cd = c + d;
				}
			}
		
		if ab = cd
			{ vtrue[2] = 1; }
			else
			{ vtrue[3] = 1; }
			
		equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);
		}
#endregion
#region 10 rank
	if global.player_rank = 10
		{
		var a, b, ab, c, d, cd, sgn1, sgn2, rr;
		sgn1 = choose("-", "+");
		sgn2 = choose("-", "+");
		
		rr = irandom(1);
		
		if sgn1 = "-"
			{
			b  = irandom(50);
			a  = irandom_range(b, 50);
			ab = a - b;
			}
		if sgn1 = "+"
			{
			a  = irandom(50);
			b  = irandom(50);
			ab = a + b;
			}
			
		if sgn2 = "-"
			{
			if rr = 1
				{
				d  = ab + irandom(50);
				if d > 90 { d = 90 }
				c  = d - ab;
				cd = d - c;
				}
				else
				{
				d  = irandom(50);
				c  = irandom_range(b, 50);
				cd = c - d;
				}
			}
		if sgn2 = "+"
			{
			if rr = 1
				{
				c  = irandom_range(1, ab);
				d  = ab - c;
				cd = c + d;
				}
				else
				{
				c  = irandom(50);
				d  = irandom(50);
				cd = c + d;
				}
			}
		
		if ab = cd
			{ vtrue[2] = 1; }
			else
			{ vtrue[3] = 1; }
			
		equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);
		}
#endregion
#region 5 rank
	if global.player_rank = 5
		{
		var a, b, ab, c, d, cd, sgn1, sgn2, rr;
		sgn1 = choose("-", "+");
		sgn2 = choose("-", "+");
		
		rr = irandom(1);
		
		if sgn1 = "-"
			{
			b  = irandom(150);
			a  = irandom_range(b, 200);
			ab = a - b;
			}
		if sgn1 = "+"
			{
			a  = irandom(150);
			b  = irandom(150);
			ab = a + b;
			}
			
		if sgn2 = "-"
			{
			if rr = 1
				{
				d  = ab + irandom(100);
				if d > 300 { d = 300 }
				c  = d - ab;
				cd = d - c;
				}
				else
				{
				d  = irandom(150);
				c  = irandom_range(b, 150);
				cd = c - d;
				}
			}
		if sgn2 = "+"
			{
			if rr = 1
				{
				c  = irandom_range(1, ab);
				d  = ab - c;
				cd = c + d;
				}
				else
				{
				c  = irandom(150);
				d  = irandom(150);
				cd = c + d;
				}
			}
		
		if ab = cd
			{ vtrue[2] = 1; }
			else
			{ vtrue[3] = 1; }
			
		equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);
		}
#endregion