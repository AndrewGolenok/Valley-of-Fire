theme_round[global.rounds] = irandom_range(1, global.count_themes - 1);

var task_number, now_number;
task_number = "123";
if theme_round[global.rounds] = 2 or theme_round[global.rounds] = 6
	{ task_number = "1234"; }
now_number = irandom_range(1, string_length(task_number));

round_task[global.rounds,global.task] = real(string_copy(task_number, now_number, 1));

if theme_round[global.rounds] = 6
	{ script_execute(asset_get_index("math_" + string(round_task[global.rounds,global.task]))); }
if theme_round[global.rounds] = 2
	{ script_execute(asset_get_index("bottles_" + string(round_task[global.rounds,global.task]))); }
if theme_round[global.rounds] = 3
	{ script_execute(asset_get_index("move_" + string(round_task[global.rounds,global.task]))); }
if theme_round[global.rounds] = 4
	{ script_execute(asset_get_index("attention_" + string(round_task[global.rounds,global.task]))); }
if theme_round[global.rounds] = 1
	{ script_execute(asset_get_index("cards_" + string(round_task[global.rounds,global.task]))); }
if theme_round[global.rounds] = 5
	{ script_execute(asset_get_index("shooting_" + string(round_task[global.rounds,global.task]))); }