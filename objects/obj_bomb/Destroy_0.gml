for (var i = 0; i < 5; i++)
{
    var b = instance_create_layer(x, y, "Instances", obj_bullet);
    b.direction = random(360);
}
effect_create_above(ef_firework, x, y,0.5, c_orange);

audio_play_sound(explosion_rock, 10 , false, 0.2, 0, random_range(0.8,1));