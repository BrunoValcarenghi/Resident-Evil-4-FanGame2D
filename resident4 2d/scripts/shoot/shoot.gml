function shoot(){
	
	if key_shoot and can_shoot{
		
		audio_random(sfx_shoot)
		
		//tempo
		can_shoot = false;
		alarm[0] = shoot_time;
		
		with instance_create_layer(x, y, "shoot", obj_shoot){
		
		direction = point_direction(x, y, mouse_x, mouse_y)
		image_angle = direction
		speed = 6
		
		}
		
	}
	
}


