equation_text = "";
vtext[2] = ">";
vtext[3] = "<";

vtrue[2] = 0;
vtrue[3] = 0;

#region 15 rank
	if global.player_rank = 15
		{
		var a, b, ab, c, d, cd, sgn1, sgn2;
		sgn1 = choose("-", "+", "*", "/");
		sgn2 = choose("-", "+", "*", "/");
		
		if sgn1 = "-"
			{
			b  = irandom(15);
			a  = irandom_range(b, 15);
			ab = a - b;
			}
		if sgn1 = "+"
			{
			a  = irandom(10);
			b  = irandom(10);
			ab = a + b;
			}
		if sgn1 = "*"
			{
			a  = irandom(10);
			b  = irandom(10);
			ab = a * b;
			}
		if sgn1 = "/"
			{
			ab = irandom_range(1, 10);
			b  = irandom_range(1, 10);
			a  = ab * b;
			}
			
		if sgn2 = "-"
			{
			d  = irandom(15);
			c  = irandom_range(b, 15);
			cd = c - d;
			}
		if sgn2 = "+"
			{
			c  = irandom(10);
			d  = irandom(10);
			cd = c + d;
			}
		if sgn2 = "*"
			{
			c  = irandom(10);
			d  = irandom(10);
			cd = c * d;
			}
		if sgn2 = "/"
			{
			cd = irandom_range(1, 10);
			d  = irandom_range(1, 10);
			c  = cd * d;
			}
			
		if ab = cd
			{ ab += choose(1, -1) * irandom_range(1, 5); }
		
		if ab > cd
			{ vtrue[2] = 1; }
			else
			{ vtrue[3] = 1; }
			
		equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);
		}
#endregion
#region 10 rank
	if global.player_rank = 10
		{
		var a, b, ab, c, d, cd, sgn1, sgn2;
		sgn1 = choose("-", "+", "*", "/");
		sgn2 = choose("-", "+", "*", "/");
		
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
		if sgn1 = "*"
			{
			a  = irandom(10);
			b  = irandom(10);
			ab = a * b;
			}
		if sgn1 = "/"
			{
			ab = irandom_range(1, 10);
			b  = irandom_range(1, 10);
			a  = ab * b;
			}
			
		if sgn2 = "-"
			{
			d  = irandom(50);
			c  = irandom_range(b, 50);
			cd = c - d;
			}
		if sgn2 = "+"
			{
			c  = irandom(50);
			d  = irandom(50);
			cd = c + d;
			}
		if sgn2 = "*"
			{
			c  = irandom(10);
			d  = irandom(10);
			cd = c * d;
			}
		if sgn2 = "/"
			{
			cd = irandom_range(1, 10);
			d  = irandom_range(1, 10);
			c  = cd * d;
			}
			
		if ab = cd
			{ ab += choose(1, -1) * irandom_range(1, 5); }
		
		if ab > cd
			{ vtrue[2] = 1; }
			else
			{ vtrue[3] = 1; }
			
		equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);
		}
#endregion
#region 5 rank
	if global.player_rank = 5
		{
		var a, b, ab, c, d, cd, sgn1, sgn2;
		sgn1 = choose("-", "+", "*", "/");
		sgn2 = choose("-", "+", "*", "/");
		
		if sgn1 = "-"
			{
			b  = irandom(150);
			a  = irandom_range(b, 150);
			ab = a - b;
			}
		if sgn1 = "+"
			{
			a  = irandom(150);
			b  = irandom(150);
			ab = a + b;
			}
		if sgn1 = "*"
			{
			a  = irandom(20);
			b  = irandom(20);
			ab = a * b;
			}
		if sgn1 = "/"
			{
			ab = irandom_range(1, 20);
			b  = irandom_range(1, 20);
			a  = ab * b;
			}
			
		if sgn2 = "-"
			{
			d  = irandom(150);
			c  = irandom_range(b, 150);
			cd = c - d;
			}
		if sgn2 = "+"
			{
			c  = irandom(150);
			d  = irandom(150);
			cd = c + d;
			}
		if sgn2 = "*"
			{
			c  = irandom(20);
			d  = irandom(20);
			cd = c * d;
			}
		if sgn2 = "/"
			{
			cd = irandom_range(1, 20);
			d  = irandom_range(1, 20);
			c  = cd * d;
			}
			
		if ab = cd
			{ ab += choose(1, -1) * irandom_range(1, 5); }
		
		if ab > cd
			{ vtrue[2] = 1; }
			else
			{ vtrue[3] = 1; }
			
		equation_text = string(a) + sgn1 + string(b) + "?" + string(c) + sgn2 + string(d);
		}
#endregion