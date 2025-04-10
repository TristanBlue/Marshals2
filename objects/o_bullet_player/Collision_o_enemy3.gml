with (other)
{
	hp--;
	flash = 3;
	audio_play_sound(snd_scream4, 1, false);
	audio_play_sound(snd_splat, 1, false);
	o_spray = instance_create_layer(x ,y ,"Bullets",o_bloodspray);
	o_spray.image_angle = other.image_angle;
}
instance_destroy();