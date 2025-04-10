cam = view_camera[0];
follow = o_player1;
view_w_half = camera_get_view_width(cam) * 0.2;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 15;
shake_magnitude = 6;
shake_remain = 6;
buff = 32;