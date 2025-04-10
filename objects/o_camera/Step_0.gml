if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == o_player1dead)
	{
		x = xTo;
		y = yTo;
	}
}

x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x,view_w_half + 20,room_width-view_w_half - 20);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

/// Screen Shake

x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

/// Parallax Backgrounds

camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

if (layer_exists("Trees2"))
{
	layer_x("Trees2",x/3);	
}

if (layer_exists("Trees1"))
{
	layer_x("Trees1",x/4);	
}

if (layer_exists("Trees3"))
{
	layer_x("Trees3",x/1.8);	
}

if (layer_exists("Trees4"))
{
	layer_x("Trees4",x/1.5);	
}

if (layer_exists("Stars1"))
{
	layer_x("Stars1",x);	
}

if (layer_exists("Stars2"))
{
	layer_x("Stars2",x/1.2);	
}

if (layer_exists("Cypress_Roots"))
{
	layer_x("Cypress_Roots",x*-.08);	
}

if (layer_exists("Cypress_Roots2"))
{
	layer_x("Cypress_Roots2",x*-.08);	
}

if (layer_exists("Vines"))
{
	layer_x("Vines",x*-.3);
}

leave = keyboard_check(vk_escape);
restart = keyboard_check(ord("R"))

if leave {
	game_end();
}

if restart {
	game_restart();
}