event_inherited();

//Animation
if (!place_meeting(x,y+1,o_solid))
{
	grounded = false;
	sprite_index = s_enemy2jump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = s_enemy2;
	}
	else
	{
		sprite_index = s_enemy2run;
	}
}

// Shooting
if can_shoot == true and !shot_fired {
	var o_bullet;
	o_bullet = instance_create_layer(x, y, "Player", o_bullet_enemy);
	o_bullet.speed = 4 * image_xscale;
	audio_play_sound(snd_rifle3, 1, false);
	if not image_xscale {
		o_bullet.image_angle = 180;
	}
	else
	{
		o_bullet.image_angle = 0;
	}
	shot_fired = true;
	alarm[0] = 100;
}
