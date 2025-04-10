// Die
hp -= 1;
if (hp <= 0)
{
instance_change(o_player1dead,true);

direction = point_direction(other.x,other.y,x,y);
hsp = lengthdir_x(6,direction);
vsp = lengthdir_y(4,direction)-2;
if (sign(hsp) != 0) image_xscale = sign(hsp);

audio_play_sound(snd_guydie2, 1, false);
}