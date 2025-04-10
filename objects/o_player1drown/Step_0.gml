
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

	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,o_solid))
	{
		if (vsp > 0)
		{
			done = 1;
			sprite_index = s_marshal2_drown;
			alarm[0] = 60;
		}
	
		while (!place_meeting(x,y+sign(vsp),o_solid))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
}