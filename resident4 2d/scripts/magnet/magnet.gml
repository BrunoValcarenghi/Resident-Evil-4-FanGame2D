function magnet(){

	if distance_to_object(obj_player) < obj_player.magnet_distance{
	
		direction = point_direction(x, y, obj_player.x, obj_player.y)
		speed = .25
	
	}
	else{speed = 0}

}