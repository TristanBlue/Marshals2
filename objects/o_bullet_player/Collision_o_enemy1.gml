with (other)
{
	hp--;
	flash = 3;
	audio_play_sound(snd_scream1, 1, false);
	audio_play_sound(snd_splat, 1, false);
	o_spray = instance_create_layer(x ,y ,"Bullets",o_bloodspray);
	o_spray.image_angle = other.image_angle;
}
instance_destroy();

//blood_part = part_type_create();
//part_particles_create(ParticleSystem2, x, y, blood_part, 20);