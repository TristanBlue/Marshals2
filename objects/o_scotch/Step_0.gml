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

vsp = vsp + grv;
