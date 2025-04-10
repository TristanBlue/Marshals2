//See if damage is max
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
	image_speed = .5;
	audio_play_sound(snd_explode, 1, false);

}
