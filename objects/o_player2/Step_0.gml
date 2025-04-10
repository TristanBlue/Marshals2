#region //Get Player Input

if (hascontrol)
{
	key_left = keyboard_check(vk_left) 
	key_right = keyboard_check(vk_right) 
	key_jump = keyboard_check_pressed(vk_space);
	key_down = keyboard_check(vk_down);
	shoot = keyboard_check(ord("Z")) || gamepad_button_check_pressed(0,gp_shoulderrb);
	leave = keyboard_check(vk_escape);
	restart = keyboard_check(ord("R"))
	//warp =  keyboard_check(ord("W"));

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

if leave {
	game_end();
}

if restart {
	game_restart();
}

if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
		sliding = false;
	}
	
	if (abs(gamepad_axis_value(0,gp_axislv)) > 0.2)
	{
		key_down = gamepad_axis_value(0,gp_axislv);
		controller = 1;
	}

	if !key_down {
		if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2)
		{
			key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
			key_right = max(gamepad_axis_value(0,gp_axislh),0);
			controller = 1;
		}
	}

	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}

if key_left
	{
		facing_backwards = true;
	}
	
	if key_right
	{
		facing_backwards = false;
	}	
	
	if key_down
	{
		crouching = true;
		if (abs(hsp)>2) 
		{
			sliding = true;
			slide_y = y;
		}
		else
		{
			hsp = 0;
		}
	}
	else
	{
		crouching = false;
		sliding = false;
	}	
	
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}


#endregion

//Calculate Movement
var move = key_right - key_left;
if sliding
	{
		hsp = hsp * .97; // Deseleration rate of slide 
	
		if (y <> slide_y) {
			sliding = false;
			hsp = 0;
		}
	}	
else
	{
		hsp = move * walksp;
	}
	
if hsp = 0
{
	sliding = false;
}	

vsp = vsp + grv;

if (place_meeting(x,y+1,o_solid)) && (key_jump)
{
	vsp = -7;	
}

//Shooting
if can_shoot == true {
	if shoot {
		yy = y-4;
		if crouching  { 
			yy = y+6;
		}
		xx = x+6;
		if facing_backwards xx = x-6;		
			var o_bullet;
			o_bullet = instance_create_layer(xx,yy,"Bullets",o_bullet_player);
			o_bullet.speed = 10 * image_xscale;
			o_bullet.direction = 1;
			if not image_xscale {
				o_bullet.image_angle = 180;
			}
			else
			{
				o_bullet.image_angle = 0;
			}

//show_debug_message("*** o_bullet.image_angle= " + string(o_bullet.image_angle));

			//effect_create_above(ef_smokeup, xx, yy, .5, c_dkgrey);

		shot_fired = true;
		alarm[0] = 50;
		can_shoot = false;
		audio_play_sound(snd_shotgun, 1, false);
		ScreenShake(2,10);
		instance_create_layer(x-16,y-48,"Bullets",o_muzzle_flash);
	}
}


//Horizontal Collision
if (place_meeting(x+hsp,y,o_solid))
{
	while (!place_meeting(x+sign(hsp),y,o_solid))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,o_solid))
{
	while (!place_meeting(x,y+sign(vsp),o_solid))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animation
if (!place_meeting(x,y+1,o_solid))
{
	sprite_index = s_marshal1_jump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hsp == 0) || sliding
	{
		if crouching  
		{
			if sliding
			{
				sprite_index = s_marshal1_slide;
			}
			else
			{
			sprite_index = s_marshal1_crouch;
			mask_index = s_marshal1_crouch;
			}
		}
		else
		{
			sprite_index = s_marshal1_aim_up;
			mask_index = s_marshal1_aim_up;
		}
	}
		else
		{
			sprite_index = s_marshal1_run;
					if image_index = 1 {
						audio_play_sound(snd_footstep, 1, false);
					}
					if image_index = 3 {
						audio_play_sound(snd_footstep, 1, false);
					}
		}
}


if (hsp != 0) image_xscale = sign(hsp);

if (hp <= 0)
{
	instance_change(o_player1dead,true);
}



