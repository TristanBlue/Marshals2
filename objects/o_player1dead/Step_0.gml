
if (done == 0)
{
	vsp = vsp + grv;

	/*
	{
		vsp = -7;	
	}

	//Shooting
	/*
	if can_shoot == true {
		if shoot {
			instance_create_layer(x, y, "Player", o_bullet);
			can_shoot = false;
			alarm[0] = 10;
	}
	*/

	//Horizontal Collision
	if (place_meeting(x+hsp,y,o_solid))
	{
		while (!place_meeting(x+sign(hsp),y,o_solid))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}

	show_debug_message("hsp ={0}",hsp);
	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,o_solid))
	{
		if (vsp > 0)
		{
			done = 1;
			image_index = 1;
			alarm[0] = 30;
		}
	
		while (!place_meeting(x,y+sign(vsp),o_solid))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
}

// Swamp Collision
if y > 380 
	{	
		instance_change(o_player1drown,true);
		direction = point_direction(other.x,other.y,x,y);
		hsp = lengthdir_x(0,direction);
		vsp = lengthdir_y(0,direction)-1;
		if (sign(hsp) != 0) image_xscale = sign(hsp);
		inst = instance_create_layer(x, y, "Bullets", o_player1drown);
		inst.image_speed = 1;
		vsp = -3;
		audio_play_sound(snd_guydie2, 1, false);
		audio_play_sound(snd_splash, 1, false);
		audio_play_sound(snd_crunch, 1, false);
		game_set_speed(10,gamespeed_fps);
		//game_restart();
		
		instance_destroy();
		//exit;
	}