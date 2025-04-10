if instance_exists(o_player1)
{

	if o_player1.hp = 3 
	{
		image_index = 0;
	}

	if o_player1.hp = 2
	{
		image_index = 1;
	}

	if o_player1.hp = 1
	{
		image_index = 2;
	}
}
else
{
	image_index = 3;
}


