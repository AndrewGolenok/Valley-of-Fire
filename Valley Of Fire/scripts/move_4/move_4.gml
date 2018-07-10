hand_scale = 0;
hand_true  = 0;
hand_angle = 0;

#region 15 rank
	if global.player_rank = 15
		{ hand_true = choose(0, 90, 180, 270, 360); }
#endregion
#region 10 rank
	if global.player_rank = 10
		{ hand_true = choose(0, 90, 180, 270, 360, 45, 135, 30, 225, 315, 60, 150, 300, 330); }
#endregion
#region 5 rank
	if global.player_rank = 5
		{ hand_true = irandom(359); }
#endregion