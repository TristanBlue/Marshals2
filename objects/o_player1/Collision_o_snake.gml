// Die
hp -= 1;
if (hp <= 0)
{
player_death();
audio_play_sound(snd_crunch, 1, false);
audio_play_sound(snd_splat, 1, false);
}

