var maxDamage = sprite_get_number(s_pint) - 1;
//if (damage < maxDamage)
//{
//	damage = 1;
//	image_index = damage;
//}
//else
//{
	sprite_index = s_pint_explode;
	image_index = 0;
	image_speed = 2;
	audio_play_sound(snd_shatter, 1, false);
//}
