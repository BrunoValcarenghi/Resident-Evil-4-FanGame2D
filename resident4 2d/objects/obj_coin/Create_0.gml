if instance_exists(obj_chest){
	if distance_to_object(obj_chest) < 10{
		direction = irandom_range(60, 120);		
		speed = irandom_range(4, 4.5);			
		gravity = 0.3;							
		friction = 0.05;						
		col = false
}
else col = true
}

_y = y - 15 + irandom(30)


timer = 0