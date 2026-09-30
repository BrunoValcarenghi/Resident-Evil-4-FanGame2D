function draw_shadow(){
	
	draw_set_colour(c_black)
	draw_set_alpha(.5)
	
	var _a = 0
	var _b = 0
	
	if image_xscale = 1{
		_a = 4
		_b = 0
	}
	else{
		_a = 0
		_b = 4
	}
	
	draw_ellipse(
		x - sprite_width/4 - _a,
		y + 5, 
		x + sprite_width/4 - _b,
		y + sprite_height/2.5,
		0
	)
	
	draw_set_alpha(1)
	
}