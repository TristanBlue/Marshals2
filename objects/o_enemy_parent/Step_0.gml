// ensure player is still in the game
if !instance_exists(o_player1) exit;

switch (state)
{
	case e_state.idle:
	{
		hsp = 0;
		vsp = (min(7,vsp+0.05));
		d = distance_to_object(o_player1);
		can_shoot = false;

	// in range of player
		if d < range {
			// see if there is a solid between object and player
			
			var px = round(o_player1.x);
			var i = sign(o_player1.x - x);
			var collide = false;
			var n = 0;
			for (var xx = x ; xx!=px; xx += i)
		    {
				n += 1;
				if n>d+1 {
					break;
				}	
				
			//	if (place_meeting(xx,y,o_solid))	{
			//		collide = true;
			//		break;
			//	}
		    }			
			if !collide state = e_state.chase;
		}
	}
	break;
	case e_state.chase:
	{
		dir = sign(o_player1.x - x);
		hsp = dir ;
		vsp = (min(7,vsp+0.05));
		can_shoot = true;
		if (distance_to_object(o_player1) > range) state = e_state.idle;
	}
	break;
}



// invoke gravity
vsp = vsp + grv;

// turn around at ledge
if (grounded) && (anti_ledges) && (!place_meeting(x+hsp,y+1,o_solid))
{
	hsp = -hsp;	
}
/*
{
	vsp = -7;	
}
*/

//Horizontal Collision
if (place_meeting(x+(hsp*15),y,o_solid))
{

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

x = x + hsp;
y = y + vsp;


if (hsp != 0) image_xscale = sign(hsp);

//// Shooting
//if can_shoot == true and !shot_fired {
//	var o_bullet;
//	o_bullet = instance_create_layer(x, y, "Player", o_bullet_enemy);
//	o_bullet.speed = 4 * image_xscale;
//	audio_play_sound(snd_rifle, 1, false);
//	if not image_xscale {
//		o_bullet.image_angle = 180;
//	}
//	else
//	{
//		o_bullet.image_angle = 0;
//	}
//	shot_fired = true;
//	alarm[0] = 100;
//}
