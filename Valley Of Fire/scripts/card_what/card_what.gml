var txt, txt1, txt2;
txt2 = "123456";
txt  = "";
for(i=1;i<=3;i++)
	{
	txt1 = irandom_range(1, string_length(txt2));
	txt += string_copy(txt2, txt1, 1);
	txt2 = string_delete(txt2, txt1, 1);
	}
//txt = choose("123", "124", "134", "234");
txt += txt;

for(i=1;i<=2;i++)
	{
	for(j=1;j<=3;j++)
		{
		txt1 = irandom_range(1, string_length(txt));
		card_m[i,j] = real(string_copy(txt, txt1, 1));
		txt = string_delete(txt, txt1, 1);
		}
	}
/*
var c1, c2, c3, c4;
c1 = 0;
c2 = 0;
c3 = 0;
c4 = 0;

for(i=1;i<=2;i++)
	{
	for(j=1;j<=3;j++)
		{
		if c1 != 2 && c2 != 2 && c3 != 2 && c4 != 2
			{ card_m[i,j] = choose(1, 2, 3, 4); }
		
		if c1 = 2 && c2 != 2 && c3 != 2 && c4 != 2
			{ card_m[i,j] = choose(2, 3, 4); }
		if c1 != 2 && c2 = 2 && c3 != 2 && c4 != 2
			{ card_m[i,j] = choose(1, 3, 4); }
		if c1 != 2 && c2 != 2 && c3 = 2 && c4 != 2
			{ card_m[i,j] = choose(1, 2, 4); }
		if c1 != 2 && c2 = 2 && c3 != 2 && c4 = 2
			{ card_m[i,j] = choose(1, 2, 3); }
			
		if c1 = 2 && c2 = 2 && c3 != 2 && c4 != 2
			{ card_m[i,j] = choose(3, 4); }
		if c1 = 2 && c2 != 2 && c3 = 2 && c4 != 2
			{ card_m[i,j] = choose(2, 4); }
		if c1 = 2 && c2 != 2 && c3 != 2 && c4 = 2
			{ card_m[i,j] = choose(2, 3); }
		if c1 != 2 && c2 = 2 && c3 != 2 && c4 = 2
			{ card_m[i,j] = choose(1, 3); }
		if c1 != 2 && c2 != 2 && c3 = 2 && c4 = 2
			{ card_m[i,j] = choose(1, 2); }
		if c1 != 2 && c2 = 2 && c3 = 2 && c4 != 2
			{ card_m[i,j] = choose(1, 4); }
			
		if c1 != 2 && c2 = 2 && c3 = 2 && c4 = 2
			{ card_m[i,j] = 1; }
		if c1 = 2 && c2 != 2 && c3 = 2 && c4 = 2
			{ card_m[i,j] = 2; }
		if c1 = 2 && c2 = 2 && c3 != 2 && c4 = 2
			{ card_m[i,j] = 3; }
		if c1 = 2 && c2 = 2 && c3 = 2 && c4 != 2
			{ card_m[i,j] = 4; }
		
		#region Прибавление
			if card_m[i,j] = 1
				{ c1 += 1; }
			if card_m[i,j] = 2
				{ c2 += 1; }
			if card_m[i,j] = 3
				{ c3 += 1; }
			if card_m[i,j] = 4
				{ c4 += 1; }
		#endregion
		}
	}
	
if c1 = 1 && c2 = 1 && c3 = 2 && c4 = 2
	{  }