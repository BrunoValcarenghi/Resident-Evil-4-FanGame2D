if place_meeting(x, y, obj_player) 
and obj_player.invencible = false {
	damage()
}

if hp < 1{instance_destroy()}

switch state{

	case enemy_state.walk:{
		
		image_index = 0
		if alarm[0] < 1 alarm[0] = irandom_range(100,160)
		if distance_to_object(obj_player) < 50{
			
			state = enemy_state.chase
			
		}
		spd = .5
		break;
	
	}
	
	case enemy_state.chase:{
		
		image_index = 1
		dir1= obj_player.x
		dir2= obj_player.y
		if distance_to_object(obj_player) > 200{
			
			state = enemy_state.walk
			
		}
		spd = 1.3
		break;
	}
}

mp_potential_step(dir1, dir2, spd, false);