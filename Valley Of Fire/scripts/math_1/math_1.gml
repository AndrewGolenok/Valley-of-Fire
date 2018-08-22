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
	a = irandom_range(1, 285 - 20 * (global.player_rank - 1));
	b = irandom_range(1, 285 - 20 * (global.player_rank - 1));
	c = a + b;
		
	vtrue[1] = 1;
	vtrue[2] = 0;
	vtrue[3] = 0;
	vtrue[4] = 0;
		
	equation_text = string(c) + "=" + string(a) + "?" + string(b);
	}
if sgn = "-"
	{
	a = irandom_range(1, 285 - 20 * (global.player_rank - 1));
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