function move_col(){

#region //movement

// correr
if key_sprint spd = run
else spd = wlk

hsp = (key_right - key_left) * spd
vsp = (key_down - key_up) * spd


#endregion

#region //collision

if (place_meeting(x+hsp, y, obj_col)){
	
	while (!place_meeting(x+sign(hsp), y, obj_col)){
	x = x + sign(hsp)
	}
	
	hsp = 0

}

x += hsp

if (place_meeting(x, y+vsp, obj_col)){
	
	while (!place_meeting(x, y+sign(vsp), obj_col)){
	y = y + sign(vsp)
	}
	
	vsp = 0

}

y += vsp
#endregion

}