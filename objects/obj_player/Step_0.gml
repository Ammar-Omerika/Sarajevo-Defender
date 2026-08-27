if (keyboard_check(vk_up) || keyboard_check(ord("W")))
{
	motion_add(image_angle, 0.1);
	
}

if (keyboard_check(vk_left) || keyboard_check(ord("A")))
{
	image_angle += 4;
}

if (keyboard_check(vk_right) || keyboard_check(ord("D")))
{
	image_angle -= 4;
}

move_wrap(true, true, 0);






if keyboard_check_pressed(vk_space)
{
	if (powerup == 1)
	{
		//Multishot
		var _bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle + random_range(7,12);
		_bullet.speed = random_range(8.5,11.5);
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle - random_range(7,12);
		_bullet.speed = random_range(8.5,11.5);
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle + random_range(-5,5);
		_bullet.speed = random_range(8.5,11.5);
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle + random_range(-10,10);
		_bullet.speed = random_range(8.5,11.5);
		
		audio_play_sound(laser_shoot, 10 , false, 0.5,0);
	}
	else if (powerup == 2)
	{
		//Flank
		var _bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle + 175;
		_bullet.sprite_index = spr_bullet_purple;
		_bullet.speed = 7;
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle - 175;
		_bullet.sprite_index = spr_bullet_purple;
		_bullet.speed = 7;
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle - 165;
		_bullet.sprite_index = spr_bullet_purple;
		_bullet.speed = 7;
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle + 165;
		_bullet.sprite_index = spr_bullet_purple;
		_bullet.speed = 7;
		_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle;
		motion_add(image_angle, 0.5);
		
		audio_play_sound(laser_shoot, 10 , false, 0.5,0);
	}
	else if (powerup == 3){
		//Rapid
		is_firing = true;
	}
	else if (powerup == 4){
		//Homing
		var _bullet = instance_create_layer(x,y,"Instances",obj_homing_bullet_1);
		_bullet.direction = image_angle;
		_bullet = instance_create_layer(x,y,"Instances",obj_homing_bullet_2);
		_bullet.direction = image_angle;
		//_bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		//_bullet.direction = image_angle;
		
		audio_play_sound(laser_shoot, 10 , false, 0.5,0);
	}
	else if (powerup == 5)
	{
		//Laser
		var _bullet = instance_create_layer(x,y,"Instances",obj_laser);
		motion_add(image_angle, -3);
		audio_play_sound(laser_gun, 10 , false, 0.5,0);
	}
	else if (powerup == 6)
	{
		//Bomber
		instance_create_layer(x,y,"Instances",obj_bomb);
		audio_play_sound(match_strike, 10 , false, 2,0);
	}
	else if (powerup == 7)
	{
		//Flamethrower
		is_firing = true;
		audio_play_sound(dragon_fire,10,true);
	}
	else
	{
		//Other
		var _bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle;
		audio_play_sound(laser_shoot, 10 , false, 0.5,0);
	}
	
}

if ((powerup == 3 || powerup == 7) && keyboard_check_released(vk_space))
{
	is_firing=false;
	if(powerup == 7)
	{
		audio_stop_sound(dragon_fire);
	}
}

if (powerup == 3 && is_firing == true){
	if (current_time - last_shot_time >= fire_interval)
	{
		var _bullet = instance_create_layer(x,y,"Instances",obj_bullet);
		_bullet.direction = image_angle + irandom_range(-3,3);
		audio_play_sound(laser_shoot, 10 , false, 0.5,0,random_range(0.8,1.2));		
		motion_add(image_angle, -0.2);
		
		last_shot_time = current_time;
	}
}

if (powerup == 7 && is_firing == true){
	if (current_time - last_shot_time >= fire_interval)
	{
		instance_create_layer(x,y,"Instances",obj_flame_gray);
		instance_create_layer(x,y,"Instances",obj_flame_orange);
		instance_create_layer(x,y,"Instances",obj_flame_yellow);
		
			
		
		
		last_shot_time = current_time;
	}
}

