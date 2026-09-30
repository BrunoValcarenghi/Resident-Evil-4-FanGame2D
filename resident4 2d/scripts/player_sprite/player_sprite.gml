function player_sprite(){
	
	if state = 2 dir_mouse()
	else dir_movimento()
	
	if dir[1] = 0 image_xscale = 1
	if dir[1] = 1 image_xscale = -1
	
	sprite_index = sprites[state][dir[0]]
	
}

function dir_movimento(){

	if hsp = 0{
		
		if vsp != 0 dir[1] = 0
		
		if vsp < 0 dir[0] = 4
		else if vsp > 0 dir[0] = 0
	
	}
	else{
		
		if hsp > 0 dir[1] = 0
		else dir[1] = 1
		
		if vsp > 0 dir[0] = 1
		else if vsp < 0 dir[0] = 3
		else dir[0] = 2
	
	}

}

function dir_mouse(){
	
	if (!array_contains(sprites[2], sprite_index)) image_index = 0
	if image_index >= 1.8 image_index = 2
	
	var _mouse_dir = point_direction(x, y, obj_cursor.x, obj_cursor.y)
	
	if _mouse_dir >= 020 and _mouse_dir <= 070{ 
		dir[1] = 0
		dir[0] = 3
	}
	else if _mouse_dir >= 070 and _mouse_dir <= 110{ 
		dir[1] = 0
		dir[0] = 4
	}
	else if _mouse_dir >= 110 and _mouse_dir <= 160{ 
		dir[1] = 1
		dir[0] = 3
	}
	else if _mouse_dir >= 160 and _mouse_dir <= 200{ 
		dir[1] = 1
		dir[0] = 2
	}
	else if _mouse_dir >= 200 and _mouse_dir <= 250{ 
		dir[1] = 1
		dir[0] = 1
	}
	else if _mouse_dir >= 250 and _mouse_dir <= 290{ 
		dir[1] = 0
		dir[0] = 0
	}
	else if _mouse_dir >= 290 and _mouse_dir <= 340{ 
		dir[1] = 0
		dir[0] = 1
	}
	else{
		dir[1] = 0
		dir[0] = 2
	}
	
	
}