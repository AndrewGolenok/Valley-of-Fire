equation_text = "";
vtext[1] = "";
vtext[2] = "";
vtext[3] = "";
vtext[4] = "";
	
vtrue[1] = 0;
vtrue[2] = 0;
vtrue[3] = 0;
vtrue[4] = 0;

var a, b, c, sgn, num, tra;
num = irandom(2);
tra = irandom_range(1, 4);

if global.player_rank > 13
{
	sgn = choose("+","-");
}
else
{
	if global.player_rank > 10
	{
		sgn = choose("+","-","*");
	}
	else
	{
		sgn = choose("+","-","/","*");
	}
}
		
if sgn = "+"
{
	a = irandom_range(1, 285 - 20 * (global.player_rank - 1));
	b = irandom_range(1, 285 - 20 * (global.player_rank - 1));
	c = a + b;
}
if sgn = "-"
{
	a = irandom_range(1, 285 - 20 * (global.player_rank - 1));
	b = irandom_range(1, a);
	c = a - b;
}
if sgn = "/"
{
	b = irandom_range(1, 35 - global.player_rank * 2);
	a = irandom_range(1, 35 - global.player_rank * 2) * b;
	c = a / b;
}
if sgn = "*"
{
	a = irandom_range(1, 35 - global.player_rank * 2);
	b = irandom_range(1, 35 - global.player_rank * 2);
	c = a * b;
}	
if num = 0
{
	vtext[tra] = string(a);
	equation_text = "?" + sgn + string(b) + "=" + string(c);
}
if num = 1
{
	vtext[tra] = string(b);
	equation_text = string(a) + sgn + "?" + "=" + string(c);
}
if num = 2
{
	vtext[tra] = string(c);
	equation_text = string(a) + sgn + string(b) + "=" + "?";
}	
for(i = 1; i <= 4; i ++)
{
	if vtext[i] != vtext[tra]
	{
		vtrue[i] = 0;
		vtext[i] = string(real(vtext[tra]) + irandom_range(1, 15) * choose(1, -1));
		if vtext[i] = vtext[1] && i > 1
		{
			vtext[i] = string(real(vtext[1]) + irandom_range(1, 15) * choose(1, -1));
		}
		if vtext[i] = vtext[2] && i > 2
		{
			vtext[i] = string(real(vtext[2]) + irandom_range(1, 15) * choose(1, -1));
		}
		if vtext[i] = vtext[3] && i > 3
		{
			vtext[i] = string(real(vtext[3]) + irandom_range(1, 15) * choose(1, -1));
		}
	}
	else
	{
		vtrue[i] = 1;
	}
}