// Die
/*
instance_change(o_player1drown,true);

direction = point_direction(other.x,other.y,x,y);
hsp = lengthdir_x(0,direction);
vsp = lengthdir_y(0,direction)-1;
if (sign(hsp) != 0) image_xscale = sign(hsp);

audio_play_sound(snd_guydie2, 1, false);
audio_play_sound(snd_splash, 1, false);
audio_play_sound(snd_crunch, 1, false);