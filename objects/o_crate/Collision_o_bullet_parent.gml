var maxDamage = sprite_get_number(s_crate) - 1;
if (damage < maxDamage)
{
	damage += 1;
	image_index = damage;
}
else
{
	sprite_index = s_crateexplode;
	image_index = 0;
	image_speed = .4;
	audio_play_sound(snd_crate, 1, false);
}