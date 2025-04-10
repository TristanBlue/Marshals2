var _x = -16;

if (o_player1.facing_backwards)
{
	_x = _x * -1;
}

if (o_player1.sprite_index = s_marshal2_crouch) or (o_player1.sprite_index = s_marshal2_slide)
{
	sprite_index = s_muzzle_flash_crouching;
	x = o_player1.x + _x;
	y = o_player1.y - 48;
}
else
{
	sprite_index = s_muzzle_flash_standing;
	x = o_player1.x + _x;
	y = o_player1.y - 48;
}


