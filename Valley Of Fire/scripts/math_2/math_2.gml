equation_text = "";
vtext[1] = "";
vtext[2] = "";
vtext[3] = "";
vtext[4] = "";
	
vtrue[1] = 0;
vtrue[2] = 0;
vtrue[3] = 0;
vtrue[4] = 0;

#region 15 rank
	if global.player_rank = 15
		{
		var a, b, c, sgn, num, tra;
		num = irandom(2);
		tra = irandom_range(1, 4);
		sgn = choose("+","-","/","*");
		
		if sgn = "+"
			{
			a = irandom_range(1, 10);
			b = irandom_range(1, 10);
			c = a + b;
			}
		if sgn = "-"
			{
			a = irandom_range(1, 20);
			b = irandom_range(1, a);
			c = a - b;
			}
		if sgn = "/"
			{
			b = irandom_range(1, 5);
			a = irandom_range(1, 5) * b;
			c = a / b;
			}
		if sgn = "*"
			{
			a = irandom_range(1, 5);
			b = irandom_range(1, 5);
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
			
		for(i=1;i<=4;i++)
			{
			if vtext[i] != vtext[tra]
				{
				vtrue[i] = 0;
				vtext[i] = string(real(vtext[tra]) + irandom_range(1, 15) * choose(1, -1));
				if vtext[i] = vtext[1] && i > 1
					{ vtext[i] = string(real(vtext[1]) + irandom_range(1, 15) * choose(1, -1)); }
				if vtext[i] = vtext[2] && i > 2
					{ vtext[i] = string(real(vtext[2]) + irandom_range(1, 15) * choose(1, -1)); }
				if vtext[i] = vtext[3] && i > 3
					{ vtext[i] = string(real(vtext[3]) + irandom_range(1, 15) * choose(1, -1)); }
				}
				else
				{ vtrue[i] = 1; }
			}
		}
#endregion
#region 10 rank
	if global.player_rank = 10
		{
		var a, b, c, sgn, num, tra;
		num = irandom(2);
		tra = irandom_range(1, 4);
		sgn = choose("+","-","/","*");
		
		if sgn = "+"
			{
			a = irandom_range(1, 100);
			b = irandom_range(1, 100);
			c = a + b;
			}
		if sgn = "-"
			{
			a = irandom_range(1, 100);
			b = irandom_range(1, a);
			c = a - b;
			}
		if sgn = "/"
			{
			b = irandom_range(1, 10);
			a = irandom_range(1, 10) * b;
			c = a / b;
			}
		if sgn = "*"
			{
			a = irandom_range(1, 10);
			b = irandom_range(1, 10);
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
			
		for(i=1;i<=4;i++)
			{
			if vtext[i] != vtext[tra]
				{
				vtrue[i] = 0;
				vtext[i] = string(real(vtext[tra]) + irandom_range(1, 15) * choose(1, -1));
				if vtext[i] = vtext[1] && i > 1
					{ vtext[i] = string(real(vtext[1]) + irandom_range(1, 15) * choose(1, -1)); }
				if vtext[i] = vtext[2] && i > 2
					{ vtext[i] = string(real(vtext[2]) + irandom_range(1, 15) * choose(1, -1)); }
				if vtext[i] = vtext[3] && i > 3
					{ vtext[i] = string(real(vtext[3]) + irandom_range(1, 15) * choose(1, -1)); }
				}
				else
				{ vtrue[i] = 1; }
			}
		}
#endregion
#region 5 rank
	if global.player_rank = 5
		{
		var a, b, c, sgn, num, tra;
		num = irandom(2);
		tra = irandom_range(1, 4);
		sgn = choose("+","-","/","*");
		
		if sgn = "+"
			{
			a = irandom_range(1, 300);
			b = irandom_range(1, 300);
			c = a + b;
			}
		if sgn = "-"
			{
			a = irandom_range(1, 300);
			b = irandom_range(1, a);
			c = a - b;
			}
		if sgn = "/"
			{
			b = irandom_range(1, 30);
			a = irandom_range(1, 20) * b;
			c = a / b;
			}
		if sgn = "*"
			{
			a = irandom_range(1, 25);
			b = irandom_range(1, 25);
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
			
		for(i=1;i<=4;i++)
			{
			if vtext[i] != vtext[tra]
				{
				vtrue[i] = 0;
				vtext[i] = string(real(vtext[tra]) + irandom_range(1, 15) * choose(1, -1));
				if vtext[i] = vtext[1] && i > 1
					{ vtext[i] = string(real(vtext[1]) + irandom_range(1, 15) * choose(1, -1)); }
				if vtext[i] = vtext[2] && i > 2
					{ vtext[i] = string(real(vtext[2]) + irandom_range(1, 15) * choose(1, -1)); }
				if vtext[i] = vtext[3] && i > 3
					{ vtext[i] = string(real(vtext[3]) + irandom_range(1, 15) * choose(1, -1)); }
				}
				else
				{ vtrue[i] = 1; }
			}
		}
#endregion