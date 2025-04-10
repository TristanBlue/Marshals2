/// Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
		if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0,gp_face1)) 
	{
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		//ScreenShake(4,30);
		menu_control = false;
		audio_play_sound(snd_shotgun, 1, false);
		audio_play_sound(snd_revolt, 1, true);
		audio_stop_sound(snd_banjoopen);
	}
}

if (menu_x > gui_width+150) && (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT); break;
		case 0: game_end(); break;
	}
}
		