buffer_seek(buffer_c, buffer_seek_start, 0);
buffer_write(buffer_c, buffer_text, "{\"module\": \"authorization\", \"act\": \"search\", \"param\": {\"version\": " + string(global.vers) + ", \"level\": " + string(global.level1) + ", \"rank\": " + string(global.rank1) + ", \"hero\": " + string(ran_hero) + ", \"totem\": [" + string(ran_tot1) + "," + string(ran_tot2) + "," + string(ran_tot3) + "]}}");
network_send_raw(socket_c, buffer_c, buffer_tell(buffer_c));

ping_time = 0;
ping_go   = 1;

searching = 1;