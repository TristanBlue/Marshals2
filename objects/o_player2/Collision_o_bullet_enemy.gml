if can_hurt = true {
	audio_play_sound(snd_splat, 1, false);
	hp =- 1;
	can_hurt = false;
	alarm[1] = 60;
	image_alpha = .4;
}