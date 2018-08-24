var push_txt1, push_txt2;
push_txt1 = "Tite";
push_txt2 = "Message";
push_local_notification(date_inc_minute(date_current_datetime(), 2), push_txt1, push_txt2, "daily_reward 1");

/*
push_local_notification(date_inc_day(date_current_datetime(), 1), push_txt1, push_txt2, "daily_reward 1");
push_local_notification(date_inc_day(date_current_datetime(), 3), push_txt1, push_txt2, "daily_reward 3");
push_local_notification(date_inc_day(date_current_datetime(), 5), push_txt1, push_txt2, "daily_reward 5");
push_local_notification(date_inc_day(date_current_datetime(), 7), push_txt1, push_txt2, "daily_reward 7"); // Пуши