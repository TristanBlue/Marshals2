/// @description See if dog needs to bark
var camera_x = camera_get_view_x(view_camera[0]);
var camera_xx = camera_x + camera_get_view_width(view_camera[0]);
if (x < camera_xx) and !rattle{
		 audio_play_sound(snd_rattle,1,false);
		 rattle = true;
}
if (x > camera_xx) {
		 rattle = false;
}
