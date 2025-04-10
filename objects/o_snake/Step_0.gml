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
				
				if (place_meeting(xx,y,o_solid))	{
					collide = true;
					break;
				}
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
if (place_meeting(x+(hsp*4),y,o_solid))
{


	while (!place_meeting(x+(hsp),y,o_solid))
	{
		x = x + hsp;
	}

	hsp = -hsp;

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

//Animation
if (!place_meeting(x,y+1,o_solid))
{
	grounded = false;
	sprite_index = s_snakejump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = s_snake;
	}
	else
	{
		sprite_index = s_snakemove;
	}
}

		




