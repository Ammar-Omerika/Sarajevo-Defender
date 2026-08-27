

instance_destroy(other);
effect_create_above(ef_explosion, x, y, 1,c_dkgray);
;
//audio_play_sound(explosion_rock, 10 , false, random_range(0.07,0.15), 0, random_range(0.9,1.1));

direction = random (360);

if sprite_index = spr_asteroid1
{
	sprite_index = spr_asteroid5;
}
else if sprite_index = spr_asteroid5
{
	sprite_index = spr_asteroid6;
}
else if sprite_index = spr_asteroid6
{
	sprite_index = spr_asteroid2;
}
else if sprite_index = spr_asteroid2
{
	sprite_index = spr_asteroid4;
}

else if sprite_index = spr_asteroid4
{
	obj_score.game_score += 20;
	sprite_index = spr_asteroid3;
	image_xscale = 2; // 2x wider
	image_yscale = 2; // 2x taller
	instance_copy(true);
}
else if instance_number(obj_rock)<12
{
	obj_score.game_score += 5;
	sprite_index = spr_asteroid1;
	image_xscale = 1; // 2x wider
	image_yscale = 1;
	x = -100;
}
else{
	obj_score.game_score += 5;
	instance_destroy();
}