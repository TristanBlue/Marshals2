vsp = vsp + grv;

//Don't walk off ledges
if (grounded) && (anti_ledges) && (!place_meeting(x+hsp,y+1,o_wall))
{
	hsp = -hsp;	

}
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
if (place_meeting(x+hsp,y,o_wall))
{
	while (!place_meeting(x+sign(hsp),y,o_wall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}

x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,o_wall))
{
	while (!place_meeting(x,y+sign(vsp),o_wall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}

y = y + vsp;

//Animation
if (!place_meeting(x,y+1,o_wall))
{
	grounded = false;
	sprite_index = s_enemy1jump;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	grounded = true;
	image_speed = 1;
	if (hsp == 0)
	{
		sprite_index = s_enemy1;
	}
	else
	{
		sprite_index = s_enemy1run;
	}
}

if (hsp != 0) image_xscale = sign(hsp);