equation_text = "";
vtext[1] = "+";
vtext[2] = "-";
vtext[3] = "/";
vtext[4] = "*";
	
vtrue[1] = 0;
vtrue[2] = 0;
vtrue[3] = 0;
vtrue[4] = 0;

var a, b, c, sgn;

if global.player_rank > 13
	{ sgn = choose("+","-"); }
	else
	{
	if global.player_rank > 10
		{ sgn = choose("+","-","*"); }
		else
		{ sgn = choose("+","-","/","*"); }
	}
if sgn = "+"
	{
	a = irandom_range(1, 290 - 20 * (global.player_rank - 1));
	b = irandom_range(1, 290 - 20 * (global.player_rank - 1));
	c = a + b;
		
	vtrue[1] = 1;
	vtrue[2] = 0;
	vtrue[3] = 0;
	vtrue[4] = 0;
		
	equation_text = string(c) + "=" + string(a) + "?" + string(b);
	}
if sgn = "-"
	{
	a = irandom_range(1, 290 - 20 * (global.player_rank - 1));
	b = irandom_range(1, a);
	c = a - b;
		
	vtrue[1] = 0;
	vtrue[2] = 1;
	vtrue[3] = 0;
	vtrue[4] = 0;
		
	equation_text = string(c) + "=" + string(a) + "?" + string(b);
	}
if sgn = "/"
	{
	a = irandom_range(1, 35 - global.player_rank * 2);
	b = irandom_range(1, 35 - global.player_rank * 2) * a;
	c = b / a;
		
	vtrue[1] = 0;
	vtrue[2] = 0;
	vtrue[3] = 1;
	vtrue[4] = (a == 1);
		
	equation_text = string(c) + "=" + string(b) + "?" + string(a);
	}
if sgn = "*"
	{
	a = irandom_range(1, 35 - global.player_rank * 2);
	b = irandom_range(1, 35 - global.player_rank * 2);
	c = a * b;
		
	vtrue[1] = 0;
	vtrue[2] = 0;
	vtrue[3] = (b == 1);
	vtrue[4] = 1;
		
	equation_text = string(c) + "=" + string(a) + "?" + string(b);
	}

if 0
	{
	#region 15 rank
		if global.player_rank = 15
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-");
			if sgn = "+"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 10) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 5);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion
	#region 14 rank
		if global.player_rank = 15
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-","/","*");
			if sgn = "+"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 10) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 5);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion
	#region 13 rank
		if global.player_rank = 15
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-","/","*");
			if sgn = "+"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 10) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 5);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion
	#region 12 rank
		if global.player_rank = 15
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-","/","*");
			if sgn = "+"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 10) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 5);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion
	#region 11 rank
		if global.player_rank = 15
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-","/","*");
			if sgn = "+"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 10) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 5);
				b = irandom_range(1, 5);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion

	#region 10 rank
		if global.player_rank = 10
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-","/","*");
			if sgn = "+"
				{
				a = irandom_range(1, 100);
				b = irandom_range(1, 100);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 100);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 10);
				b = irandom_range(1, 10);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion
	#region 5 rank
		if global.player_rank = 5
			{
			var a, b, c, sgn;
	
			sgn = choose("+","-","/","*");
			if sgn = "+"
				{
				a = irandom_range(1, 300);
				b = irandom_range(1, 300);
				c = a + b;
		
				vtrue[1] = 1;
				vtrue[2] = 0;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "-"
				{
				a = irandom_range(1, 300);
				b = irandom_range(1, a);
				c = a - b;
		
				vtrue[1] = 0;
				vtrue[2] = 1;
				vtrue[3] = 0;
				vtrue[4] = 0;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			if sgn = "/"
				{
				a = irandom_range(1, 20);
				b = irandom_range(1, 30) * a;
				c = b / a;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = 1;
				vtrue[4] = (a == 1);
		
				equation_text = string(b) + "?" + string(a) + "=" + string(c);
				}
			if sgn = "*"
				{
				a = irandom_range(1, 30);
				b = irandom_range(1, 30);
				c = a * b;
		
				vtrue[1] = 0;
				vtrue[2] = 0;
				vtrue[3] = (b == 1);
				vtrue[4] = 1;
		
				equation_text = string(a) + "?" + string(b) + "=" + string(c);
				}
			}
	#endregion
	}