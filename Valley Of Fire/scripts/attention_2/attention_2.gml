for(i=1;i<=2;i++)
	{
	for(j=1;j<=3;j++)
		{
		card_scale[i,j] = 0.7;
		card_m[i,j]   = 0;
		card_i[i,j]   = 0;
		card_now[i,j] = 0;
		card_end[i,j] = 0;
				
		card_alp[i,j] = 1;
		card_yy[i,j]  = 0;
		}
	}
card_what();
fir_i = 0;
fir_j = 0;
sec_i = 0;
sec_j = 0;