var txt, txt1, txt2;
txt2 = "123456";
txt  = "";
for(i=1;i<=card_all;i++)
	{
	txt1 = irandom_range(1, string_length(txt2));
	txt += string_copy(txt2, txt1, 1);
	txt2 = string_delete(txt2, txt1, 1);
	}

card_find = real(string_copy(txt, irandom_range(1, string_length(txt)), 1));
txt += txt;

for(i=1;i<=2;i++)
	{
	for(j=1;j<=card_all;j++)
		{
		txt1 = irandom_range(1, string_length(txt));
		card_m[i,j] = real(string_copy(txt, txt1, 1));
		txt = string_delete(txt, txt1, 1);
		}
	}