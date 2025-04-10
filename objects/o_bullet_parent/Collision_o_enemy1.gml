with (other)
{
	hp--;
	flash = 3;
	hitfrom = other.direction;
	audio_play_sound(snd_scream1, 1, false);
	audio_play_sound(snd_splat, 1, false);
}

instance_destroy();