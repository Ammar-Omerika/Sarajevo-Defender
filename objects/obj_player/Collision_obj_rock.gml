effect_create_above(ef_firework, x, y, 2, c_orange);

audio_play_sound(explosion_rock, 10 , false, 0.2, 0, random_range(0.9,1.1));
instance_destroy();

obj_game.alarm[0] = 120;
audio_stop_all();
audio_play_sound(explosion_rock, 10 , false, 0.2, 0, random_range(0.9,1.1));
audio_play_sound(game_over, 10 , false, 1, 0,random_range(0.8,1.1));