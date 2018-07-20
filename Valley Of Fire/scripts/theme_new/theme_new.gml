var theme1, theme2, allt, new_theme;
theme1 = argument0;
theme2 = argument1;
allt   = global.count_themes;

if theme2 = -1
	{
	if theme1 = 1
		{ new_theme = irandom_range(2, allt); }
		else
		{
		if theme1 + 1 <= allt
			{ new_theme = choose(irandom_range(1, theme1 - 1), irandom_range(theme1 + 1, allt)); }
			else
			{ new_theme = irandom_range(1, theme1 - 1); }
		}
	}
	else
	{
	if theme1 = 1
		{
		if theme2 = 2
			{ new_theme = irandom_range(3, allt); }
			else
			{
			if theme2 != allt
				{ new_theme = choose(irandom_range(2, theme2 - 1), irandom_range(theme2 + 1, allt)); }
				else
				{ new_theme = irandom_range(2, theme2 - 1); }
			}
		}
		else
		{
		if theme2 = 1
			{
			if theme1 = 2
				{ new_theme = irandom_range(3, allt); }
				else
				{
				if theme1 != allt
					{ new_theme = choose(irandom_range(2, theme1 - 1), irandom_range(theme1 + 1, allt)); }
					else
					{ new_theme = irandom_range(2, theme1 - 1); }
				}
			}
			else
			{
			if theme1 = allt
				{
				if theme2 + 1 < allt
					{ new_theme = choose(irandom_range(1, theme2 - 1), irandom_range(theme2 + 1, allt - 1)); }
					else
					{ new_theme = irandom_range(1, theme2 - 1); }
				}
			if theme2 = allt
				{
				if theme1 + 1 < allt
					{ new_theme = choose(irandom_range(1, theme1 - 1), irandom_range(theme1 + 1, allt - 1)); }
					else
					{ new_theme = irandom_range(1, theme1 - 1); }
				}
			if theme2 > theme1
				{
				if theme1 + 1 < theme2
					{
					if theme2 + 1 < allt
						{ new_theme = choose(irandom_range(1, theme1 - 1), irandom_range(theme1 + 1, theme2 - 1), irandom_range(theme2 + 1, allt)); }
						else
						{ new_theme = choose(irandom_range(1, theme1 - 1), irandom_range(theme1 + 1, theme2 - 1)); }
					}
					else
					{
					if theme2 + 1 < allt
						{ new_theme = choose(irandom_range(1, theme1 - 1), irandom_range(theme2 + 1, allt)); }
						else
						{ new_theme = irandom_range(1, theme1 - 1); }
					}
				}
			if theme2 < theme1
				{
				if theme2 + 1 < theme1
					{
					if theme1 + 1 < allt
						{ new_theme = choose(irandom_range(1, theme2 - 1), irandom_range(theme2 + 1, theme1 - 1), irandom_range(theme1 + 1, allt)); }
						else
						{ new_theme = choose(irandom_range(1, theme2 - 1), irandom_range(theme2 + 1, theme1 - 1)); }
					}
					else
					{
					if theme1 + 1 < allt
						{ new_theme = choose(irandom_range(1, theme2 - 1), irandom_range(theme1 + 1, allt)); }
						else
						{ new_theme = irandom_range(1, theme2 - 1); }
					}
				}
			}
		}
	}
	
return new_theme;