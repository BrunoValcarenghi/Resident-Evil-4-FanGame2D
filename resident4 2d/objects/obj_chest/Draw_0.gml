draw_self()
if distance_to_object(obj_player) < 30{
	
	draw_set_colour(c_white)
	draw_set_halign(1)
	
	switch global.language{

		case 1: text = "Aperte 'E'"; break;
		case 2: text = "Aperte 'E'"; break;
		default: text = "Press 'E'"; break;

	}
	
	draw_text(x, y - 20, text)

}