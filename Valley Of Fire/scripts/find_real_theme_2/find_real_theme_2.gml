var aa;

if theme_real_theme[0] != -1 && theme_real_theme[1] != -1 && theme_real_theme[2] = -1
	{
	if (theme_real_theme[0] > 1 && theme_real_theme[0] < 11) && (theme_real_theme[1] > 1 && theme_real_theme[1] < 11)
		{ 
		if theme_real_theme[0] < theme_real_theme[1]
			{ aa = choose(irandom_range(1, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, 11)); }
			else
			{ aa = choose(irandom_range(1, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, 11)); }
		}
	
	if (theme_real_theme[0] = 1 && theme_real_theme[1] > 1 && theme_real_theme[1] < 11)
		{ aa = choose(irandom_range(2, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, 11)); }
	if (theme_real_theme[0] = 11 && theme_real_theme[1] > 1 && theme_real_theme[1] < 11)
		{ aa = choose(irandom_range(1, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, 10)); }
		
	if (theme_real_theme[1] = 1 && theme_real_theme[0] > 1 && theme_real_theme[0] < 11)
		{ aa = choose(irandom_range(2, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, 11)); }
	if (theme_real_theme[1] = 11 && theme_real_theme[0] > 1 && theme_real_theme[0] < 11)
		{ aa = choose(irandom_range(1, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, 10)); }
	}
	
if theme_real_theme[0] != -1 && theme_real_theme[2] != -1 && theme_real_theme[1] = -1
	{
	if (theme_real_theme[0] > 1 && theme_real_theme[0] < 11) && (theme_real_theme[2] > 1 && theme_real_theme[2] < 11)
		{ 
		if theme_real_theme[0] < theme_real_theme[2]
			{ aa = choose(irandom_range(1, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, 11)); }
			else
			{ aa = choose(irandom_range(1, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, 11)); }
		}
	
	if (theme_real_theme[0] = 1 && theme_real_theme[2] > 1 && theme_real_theme[2] < 11)
		{ aa = choose(irandom_range(2, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, 11)); }
	if (theme_real_theme[0] = 11 && theme_real_theme[2] > 1 && theme_real_theme[2] < 11)
		{ aa = choose(irandom_range(1, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, 10)); }
		
	if (theme_real_theme[2] = 1 && theme_real_theme[0] > 1 && theme_real_theme[0] < 11)
		{ aa = choose(irandom_range(2, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, 11)); }
	if (theme_real_theme[2] = 11 && theme_real_theme[0] > 1 && theme_real_theme[0] < 11)
		{ aa = choose(irandom_range(1, theme_real_theme[0] - 1), irandom_range(theme_real_theme[0] + 1, 10)); }
	}
	
if theme_real_theme[1] != -1 && theme_real_theme[2] != -1 && theme_real_theme[0] = -1
	{
	if (theme_real_theme[1] > 1 && theme_real_theme[1] < 11) && (theme_real_theme[2] > 1 && theme_real_theme[2] < 11)
		{ 
		if theme_real_theme[1] < theme_real_theme[2]
			{ aa = choose(irandom_range(1, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, 11)); }
			else
			{ aa = choose(irandom_range(1, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, 11)); }
		}
	
	if (theme_real_theme[1] = 1 && theme_real_theme[2] > 1 && theme_real_theme[2] < 11)
		{ aa = choose(irandom_range(2, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, 11)); }
	if (theme_real_theme[1] = 11 && theme_real_theme[2] > 1 && theme_real_theme[2] < 11)
		{ aa = choose(irandom_range(1, theme_real_theme[2] - 1), irandom_range(theme_real_theme[2] + 1, 10)); }
		
	if (theme_real_theme[2] = 1 && theme_real_theme[1] > 1 && theme_real_theme[1] < 11)
		{ aa = choose(irandom_range(2, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, 11)); }
	if (theme_real_theme[2] = 11 && theme_real_theme[1] > 1 && theme_real_theme[1] < 11)
		{ aa = choose(irandom_range(1, theme_real_theme[1] - 1), irandom_range(theme_real_theme[1] + 1, 10)); }
	}
	
return aa;