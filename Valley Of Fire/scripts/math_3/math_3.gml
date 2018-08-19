equation_text = "";
vtext[2] = ">";
vtext[3] = "<";

vtrue[2] = 0;
vtrue[3] = 0;

var a, b, ab, c, d, cd, sgn1, sgn2;

if global.player_rank > 13
	{ sgn1 = choose("+","-"); sgn2 = choose("+","-"); }
	else
	{
	if global.player_rank > 10
		{ sgn1 = choose("+","-","*"); sgn2 = choose("+","-","*"); }
		else
		{ sgn1 = choose("+","-","/","*"); sgn2 = choose("+","-","/","*"); }
	}
		
if sgn1 = "-"
	{
	b  = irandom(150 - (global.player_rank - 1) * 10);
	a  = irandom_range(b, 150 - (global.player_rank - 1) * 10);
	ab = a - b;
	}
if sgn1 = "+"
	{
	a  = irandom(150 - (global.player_rank - 1) * 10);
	b  = irandom(150 - (global.player_rank - 1) * 10);
	ab = a + b;
	}
if sgn1 = "*"
	{
	a  = irandom(100 - (global.player_rank - 1) * 6);
	b  = irandom(100 - (global.player_rank - 1) * 6);
	ab = a * b;
	}
if sgn1 = "/"
	{
	b  = irandom_range(1, 100 - (global.player_rank - 1) * 6);
	a  = irandom_range(1, 100 - (global.player_rank - 1) * 6) * b;
	ab = a / b;
	}
			
if sgn2 = "-"
	{
	d  = irandom(150 - (global.player_rank - 1) * 10);
	c  = irandom_range(b, 150 - (global.player_rank - 1) * 10);
	cd = c - d;
	
	if ab = cd
		{ c += 1; cd = c - d; }
	}
if sgn2 = "+"
	{
	c  = irandom(150 - (global.player_rank - 1) * 10);
	d  = irandom(150 - (global.player_rank - 1) * 10);
	cd = c + d;
	
	if ab = cd
		{ c += 1; cd = c + d; }
	}
if sgn2 = "*"
	{
	c  = irandom(100 - (global.player_rank - 1) * 6);
	d  = irandom(100 - (global.player_rank - 1) * 6);
	cd = c * d;
	
	if ab = cd
		{ c += 1; cd = c * d; }
	}
if sgn2 = "/"
	{
	d  = irandom_range(1, 100 - (global.player_rank - 1) * 6);
	c  = irandom_range(1, 100 - (global.player_rank - 1) * 6) * d;
	cd = c / d;
	
	if ab = cd
		{ c += 1; cd = c / d; }
	}
		
if ab > cd
	{ vtrue[2] = 1; }
	else
	{ vtrue[3] = 1; }
			
equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);