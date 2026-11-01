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
	
	_slot_cursor = global.inventory[cursor[0]][cursor[1]]
	if _slot_cursor !=0 and _slot_cursor < 100 draw_text(64, 320, global.itens[_slot_cursor].nome)

}

function seleciona_itens(){

	if keyboard_check_pressed(vk_enter) and move = noone{
	
		if select_item = noone and global.inventory[cursor[0]][cursor[1]] != 0 {
			
			select_item = global.inventory[cursor[0]][cursor[1]]
			option = 0
			
		}
		else item_options()

	}
	
	if keyboard_check_pressed(vk_escape) {
	
		if select_item != noone select_item = noone
	
	}

}

function draw_select_item(){

	if select_item != noone{
		
		var _slot = global.itens[select_item]
		
		var _xx = cursor_x + sprite_get_width(_slot.spr)
		
		draw_set_alpha(.8)
		draw_set_colour(c_black)
		draw_rectangle(_xx, cursor_y, _xx+90, cursor_y + 100, 0) 
		
		for(var i = 0; i < array_length(_slot.options); i++){
			
			if i = option draw_set_colour(c_white)
			else draw_set_colour(c_gray)
			draw_text(_xx + 10, cursor_y + 5 + 18*i, _slot.options[i])
		
		}
		
		if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")) {
			
			if option <= 0 option = array_length(_slot.options)-1
			else option --

		}
		if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")) {
			
			if option >= array_length(_slot.options)-1 option = 0
			else option ++
			
		}
	
	}
	
	draw_set_alpha(1)

}

//parei aqui
function item_options(){

	switch global.itens[select_item].options[option]{
			
		case "Move": 
				
				io_clear()
				
				move = global.inventory[cursor[0]][cursor[1]]
				
				old_x = cursor[0]
				old_y = cursor[1]
				
				//global.inventory[cursor[0]][cursor[1]] = 0
				
				var _size = global.itens[move]
	
				for(var i = old_x; i < old_x + _size.size[0]; i++){
					for(var j = old_y; j < old_y + _size.size[1]; j++){
						global.inventory[i][j] = 0
					}
				}
			
			break;
		
		case "Equip": 
			show_message("1")
			break;
		
		case "Use": 
			show_message("2")
			break;
		
		case "Combine": 
			show_message("3")
			break;
		
		case "Examine": 
			show_message("4")
			break;
		
		case "Discard": 
			show_message("5")
			break;
		
	}
	
	select_item = noone

}

//parei aqui
function draw_move_item(){

	if move != noone {
		
		draw_sprite(global.itens[move].spr, 0, cursor[0]*distance + ow -3, cursor[1]*distance + oh - 3)
	
		var _ocupado = false
		for(var i = cursor[0]; i < cursor[0] + global.itens[move].size[0]; i++){
			for(var j = cursor[1]; j < cursor[1] + global.itens[move].size[1]; j++){
				if global.inventory[i][j] != 0 _ocupado = true
			}
		}
	
		if !_ocupado {
			
			if keyboard_check_pressed(vk_enter) {
				add_inventario_item(move, [cursor[0], cursor[1]])
				move = noone
				exit;
			}
			draw_set_colour(c_green)
		
		}
		else{
		
			draw_set_colour(c_red)
		
		}
	
		draw_set_alpha(.3)
		draw_rectangle(
			cursor[0]*distance + ow, 
			cursor[1]*distance + oh, 
			cursor[0]*distance + global.itens[move].size[0]*distance + ow, 
			cursor[1]*distance + oh + global.itens[move].size[1]*distance, 
			0
		)
		draw_set_alpha(1)
		
	}
	
}

function desenha_cursor(){
	
	if move = noone{
	
		draw_set_colour(c_yellow)
		if (cursor[0] = i and cursor[1] = j)
		or is_struct(_slot) and (_slot.xx = cursor[0] and _slot.yy = cursor[1]){
			draw_set_alpha(.1)
	
			draw_rectangle(_ow-1, _oh-1, _ow+cel+1, _oh+cel+1, 0)
		
			if (cursor[0] = i and cursor[1] = j){
				cursor_x = _ow-1
				cursor_y = _oh-1
			}
		}
		
	}
	draw_set_alpha(1)
	
}

function desenha_slot_ocupado(){

	draw_set_colour(c_green)
	if _slot != 0 draw_set_alpha(.1)
	else draw_set_alpha(0)
	draw_rectangle(_ow, _oh, _ow+cel, _oh+cel, 0)
	draw_set_alpha(1)
	//draw_text(_ow, _oh, global.inventory[i][j])
	
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

function move_cursor_2(){

	if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")){
	
		if cursor[0] > 0 cursor[0]--
	
	}
	if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")){
		
		if cursor[0] + global.itens[move].size[0] < size[0]{
			if cursor[0] < size[0]-1 cursor[0]++
			else if cursor[0] = size[0]-1 cursor[0] = 0
		}
	}
	
	if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")){
	
		if cursor[1] > 0 cursor[1]--
	
	}
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")){
		
		if cursor[1] + global.itens[move].size[1] < size[1]{
			if cursor[1] < size[1]-1 cursor[1]++
			else if cursor[1] = size[1]-1 cursor[1] = 0
		}
	
	}

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
