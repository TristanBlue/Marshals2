hp = 3;
hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
can_shoot = true;
flash = 0;
controller = 0;
hascontrol = true;
hitfrom = 0;
facing_backwards = false;
crouching = false;
can_hurt = true;
sliding = false;
slide_y = 0;
gun_upgrade = false;
audio_play_sound(snd_swamp, 1, true);
audio_play_sound(snd_lake_tide, 1, true);

instance_create_layer(0,0,"GUI",o_player1_health);

