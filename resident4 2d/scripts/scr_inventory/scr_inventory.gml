global.inventory = []

function zerar_inventario(){

	for(var i = 0; i < size[0]; i++){
		for(var j = 0; j < size[1]; j++){
			global.inventory[i][j] = 0
		}
	}

	//show_message(global.inventory)

}

function inicial_inventario(){
	
	add_inventario_item(1, [0,0])
	add_inventario_item(2, [3,0])
	add_inventario_item(3, [3,1])
	
	//para testes
	add_inventario_item(1, [4,2])
	add_inventario_item(2, [4,1])
	add_inventario_item(2, [7,0])
	add_inventario_item(2, [8,3])
	add_inventario_item(2, [0,5])
	add_inventario_item(3, [9,4])
	add_inventario_item(3, [9,0])

}

function draw_grid(){
	
	for( i = 0; i < size[0]; i++){
		for( j = 0; j < size[1]; j++){
				
			 _ow = ow + distance*i
			 _oh = oh + distance*j
			
			 _slot = global.inventory[i][j]
			
			if _slot !=0 and _slot < 100 draw_sprite(global.itens[_slot].spr, 0, _ow, _oh)
			
			desenha_cursor()
			//desenha_slot_ocupado()
		
		}
	}

}

function desenha_cursor(){
	
	draw_set_colour(c_red)
	if (cursor[0] = i and cursor[1] = j)
	or is_struct(_slot) and (_slot.xx = cursor[0] and _slot.yy = cursor[1])
	draw_set_alpha(.1)
	
	else draw_set_alpha(0)
	
	draw_rectangle(_ow-1, _oh-1, _ow+cel+1, _oh+cel+1, 0)
	
	draw_set_alpha(1)

}

function desenha_slot_ocupado(){

	draw_set_colour(c_green)
	if _slot != 0 draw_set_alpha(.1)
	else draw_set_alpha(0)
	draw_rectangle(_ow, _oh, _ow+cel, _oh+cel, 0)
	draw_set_alpha(1)
	
}

function add_inventario_item(_item, _slot){

	var _size = global.itens[_item].size
	
	for(var i = _slot[0]; i < _slot[0]+_size[0]; i++){
		for(var j = _slot[1]; j < _slot[1]+_size[1]; j++){
			global.inventory[i][j] = {xx: _slot[0], yy: _slot[1]}
		}
	}

	global.inventory[_slot[0]][_slot[1]] = _item

}

function move_cursor(){

	if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")){
	
		if cursor[0] > 0 {
			cursor[0]--
			if is_struct(global.inventory[cursor[0]][cursor[1]]) {
				var _yy = global.inventory[cursor[0]][cursor[1]].yy
				cursor[0] = global.inventory[cursor[0]][cursor[1]].xx
				cursor[1] = _yy
			}
		}
		else if cursor[0] = 0{
			
			cursor[0] = size[0]-1
			if (is_struct(global.inventory[cursor[0]][cursor[1]])){
				var _yy = global.inventory[cursor[0]][cursor[1]].yy
				cursor[0] = global.inventory[cursor[0]][cursor[1]].xx
				cursor[1] = _yy
			}
			
		}
	
	}
	if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")){
	
		if cursor[0] < size[0]-1 {
			
			if (is_struct(global.inventory[cursor[0]+1][cursor[1]]))
			and global.inventory[cursor[0]+1][cursor[1]].xx = cursor[0]{
				
				cursor[0]++
				while(is_struct(global.inventory[cursor[0]][cursor[1]])) {
					
					cursor[0]++
					if cursor[0] = size[0] cursor[0] = 0
					
				}
			}
			else cursor[0]++
			if (is_struct(global.inventory[cursor[0]][cursor[1]])){
				cursor[1] = global.inventory[cursor[0]][cursor[1]].yy
			}
			
		}
		else if cursor[0] = size[0]-1 {
			cursor[0] = 0
			if (is_struct(global.inventory[cursor[0]][cursor[1]])){
				cursor[1] = global.inventory[cursor[0]][cursor[1]].yy
			}
		}
	
	}
	
	if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")){
	
		if cursor[1] > 0 {
			cursor[1]--
			if is_struct(global.inventory[cursor[0]][cursor[1]]) {
				var _yy = global.inventory[cursor[0]][cursor[1]].yy
				cursor[0] = global.inventory[cursor[0]][cursor[1]].xx
				cursor[1] = _yy
			}
		}
		else if cursor[1] = 0 {
			
			cursor[1] = size[1]-1
			if is_struct(global.inventory[cursor[0]][cursor[1]]) {
				var _yy = global.inventory[cursor[0]][cursor[1]].yy
				cursor[0] = global.inventory[cursor[0]][cursor[1]].xx
				cursor[1] = _yy
			}
		}
	}
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")){
	
		if cursor[1] < size[1]-1 {
			
			if (is_struct(global.inventory[cursor[0]][cursor[1]+1]))
			and global.inventory[cursor[0]][cursor[1]+1].yy = cursor[1]{
				
				cursor[1]++
				while(is_struct(global.inventory[cursor[0]][cursor[1]])) {
					
					cursor[1]++
					if cursor[1] = size[1] cursor[1] = 0
					
				}
			}
			else cursor[1]++
			if (is_struct(global.inventory[cursor[0]][cursor[1]])){
				cursor[0] = global.inventory[cursor[0]][cursor[1]].xx
			}
			
		}
		else if cursor[1] = size[1]-1 {
			cursor[1] = 0
			if (is_struct(global.inventory[cursor[0]][cursor[1]])){
				cursor[0] = global.inventory[cursor[0]][cursor[1]].xx
			}
		}
	
	}

}
