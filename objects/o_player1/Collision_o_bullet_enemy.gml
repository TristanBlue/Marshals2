// Die
hp -= 1;
audio_play_sound(snd_guydie2, 0, false);
flash = 3;
if (hp <= 0) player_death();