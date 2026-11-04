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
	
	add_inventario_item(global.itens[1], [0,0])
	add_inventario_item(global.itens[2], [3,0])
	add_inventario_item(global.itens[3], [3,1])
	
	//para testes
	//add_inventario_item(global.itens[1], [4,2])
	//add_inventario_item(global.itens[2], [4,1])
	//add_inventario_item(global.itens[2], [7,0])
	//add_inventario_item(global.itens[2], [8,3])
	//add_inventario_item(global.itens[2], [0,5])
	//add_inventario_item(global.itens[3], [9,4])
	//add_inventario_item(global.itens[3], [9,0])
	
	//testes ervas
	add_inventario_item(global.itens[4], [4,2])
	add_inventario_item(global.itens[5], [6,2])
	add_inventario_item(global.itens[6], [8,2])

}

function draw_grid(){
	
	for( i = 0; i < size[0]; i++){
		for( j = 0; j < size[1]; j++){
				
			 _ow = ow + distance*i
			 _oh = oh + distance*j
			
			 _slot = global.inventory[i][j]
			
			if is_struct(_slot) {
				draw_sprite(_slot.spr, 0, _ow, _oh)
			}
			
			
			
			desenha_cursor()
			//desenha_slot_ocupado()
		
		}
	}
	
	_slot_cursor = global.inventory[cursor[0]][cursor[1]]
	if is_struct(_slot_cursor) draw_text(64, 320, _slot_cursor.nome)

}

function seleciona_itens(){

	if keyboard_check_pressed(vk_enter) 
	and move = noone
	and combine = noone
	and is_struct(global.inventory[cursor[0]][cursor[1]]){
	
		if select_item = noone and is_struct(global.inventory[cursor[0]][cursor[1]]){
			
			select_item = global.inventory[cursor[0]][cursor[1]]
			option = 0
			
		}
		else item_options()

	}
	
	if keyboard_check_pressed(vk_escape) {
		if select_item != noone {
			select_item = noone
		}
	
	}

}

function draw_select_item(){

	if select_item != noone{
		
		var _slot = select_item
		
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

function remove_item(_item){
	
	for(var i = old_x; i < old_x + _item.size[0]; i++){
		for(var j = old_y; j < old_y + _item.size[1]; j++){
			global.inventory[i][j] = 0
		}
	}

}

//falta coisa aqui
function item_options(){

	switch select_item.options[option]{
			
		case "Move": 
				
				io_clear()
				
				move = global.inventory[cursor[0]][cursor[1]]
				
				old_x = cursor[0]
				old_y = cursor[1]
				
				//global.inventory[cursor[0]][cursor[1]] = 0
	
				remove_item(move)
			
			break;
		
		case "Equip": 
			show_message("1")
			break;
		
		case "Use": 
			show_message("2")
			break;
		
		case "Combine": 
			
			io_clear()
			
			combine  = global.inventory[cursor[0]][cursor[1]]
			
			old_x = cursor[0]
			old_y = cursor[1]
			
			remove_item(combine)
			
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

function move_item(){

	if move != noone {
		
		draw_set_alpha(.3)
		draw_rectangle(
			cursor[0]*distance + ow - 1,
			cursor[1]*distance + oh - 1, 
			cursor[0]*distance + ow + move.size[0]*distance - 2, 
			cursor[1]*distance + oh + move.size[1]*distance - 2, 
			0
		)
		draw_set_alpha(1)
		draw_sprite(move.spr, 0, cursor[0]*distance + ow -3, cursor[1]*distance + oh - 15)
	
		var _ocupado = false
		for(var i = cursor[0]; i < cursor[0] + move.size[0]; i++){
			for(var j = cursor[1]; j < cursor[1] + move.size[1]; j++){
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
		
		if keyboard_check_pressed(vk_escape) {
			add_inventario_item(move, [old_x, old_y])
			move = noone
			cursor[0] = old_x
			cursor[1] = old_y
			exit
		}
		
	}
	
}

//por enquanto so combina ervas
function combine_item(){

	if combine != noone {
		
		draw_set_alpha(.3)
		draw_rectangle(
			cursor[0]*distance + ow - 1,
			cursor[1]*distance + oh - 1, 
			cursor[0]*distance + ow + combine.size[0]*distance - 2, 
			cursor[1]*distance + oh + combine.size[1]*distance - 2, 
			0
		)
		draw_set_alpha(1)
		draw_sprite(combine.spr, 0, cursor[0]*distance + ow -3, cursor[1]*distance + oh - 15)
	
		var _ocupado = false
		for(var i = cursor[0]; i < cursor[0] + combine.size[0]; i++){
			for(var j = cursor[1]; j < cursor[1] + combine.size[1]; j++){
				if global.inventory[i][j] != 0 _ocupado = true
			}
		}
		
		if variable_struct_exists(combine, "herb"){
		
			if _ocupado 
			and !is_array(global.inventory[cursor[0], cursor[1]]) 
			and variable_struct_exists(global.inventory[cursor[0], cursor[1]], "herb"){
			
				if keyboard_check_pressed(vk_enter) {
					
					var m1 = combine
					var m2 = global.inventory[cursor[0], cursor[1]]
					
					add_inventario_item(global.itens[7], [cursor[0], cursor[1]])
					
					global.inventory[cursor[0], cursor[1]].herb = [m1.herb, m2.herb]
					
					combine = noone
					exit;
				}
				draw_set_colour(c_green)
		
			}
			else{
		
				draw_set_colour(c_red)
		
			}
			
		}
		
		if keyboard_check_pressed(vk_escape) {
			add_inventario_item(combine, [old_x, old_y])
			combine = noone
			cursor[0] = old_x
			cursor[1] = old_y
			exit
		}
		
	}
	
}

function desenha_cursor(){
	
	if move = noone and combine = noone{
	
		draw_set_colour(c_yellow)
		if (cursor[0] = i and cursor[1] = j)
		or is_array(_slot) and (_slot[0] = cursor[0] and _slot[1] = cursor[1]){
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

	var _size = _item.size
	
	for(var i = _slot[0]; i < _slot[0]+_size[0]; i++){
		for(var j = _slot[1]; j < _slot[1]+_size[1]; j++){
			global.inventory[i][j] = [_slot[0], _slot[1]]
		}
	}

	global.inventory[_slot[0]][_slot[1]] = _item

}

function move_cursor_2(){
	
	var _slot = move
	if combine != noone _slot = combine
	
	if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")){
	
		if cursor[0] > 0 cursor[0]--
	
	}
	if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")){
		
		if cursor[0] + _slot.size[0] < size[0]{
			if cursor[0] < size[0]-1 cursor[0]++
			else if cursor[0] = size[0]-1 cursor[0] = 0
		}
	}
	
	if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")){
	
		if cursor[1] > 0 cursor[1]--
	
	}
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")){
		
		if cursor[1] + _slot.size[1] < size[1]{
			if cursor[1] < size[1]-1 cursor[1]++
			else if cursor[1] = size[1]-1 cursor[1] = 0
		}
	
	}

}

function move_cursor(){

	var _ow = cursor[0]
	var _oh = cursor[1]

	if keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A")){
	
		if cursor[0] > 0 {
			cursor[0]--
			if is_array(global.inventory[cursor[0]][cursor[1]]) {
				var _yy = global.inventory[cursor[0]][cursor[1]][1]
				cursor[0] = global.inventory[cursor[0]][cursor[1]][0]
				cursor[1] = _yy
			}
		}
		else if cursor[0] = 0{
			
			cursor[0] = size[0]-1
			if (is_array(global.inventory[cursor[0]][cursor[1]])){
				var _yy = global.inventory[cursor[0]][cursor[1]][1]
				cursor[0] = global.inventory[cursor[0]][cursor[1]][0]
				cursor[1] = _yy
			}
			
		}
	
	}
	if keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D")){
	
		if cursor[0] < size[0]-1 {
			
			if (is_array(global.inventory[cursor[0]+1][cursor[1]]))
			and global.inventory[cursor[0]+1][cursor[1]][0] = cursor[0]{
				
				cursor[0]++
				while(is_array(global.inventory[cursor[0]][cursor[1]])) 
				and global.inventory[cursor[0]][cursor[1]][0] = _ow
				and global.inventory[cursor[0]][cursor[1]][1] = _oh{
					
					cursor[0]++
					if cursor[0] = size[0] cursor[0] = 0
					
				}
			}
			else cursor[0]++
			if (is_array(global.inventory[cursor[0]][cursor[1]])){
				cursor[1] = global.inventory[cursor[0]][cursor[1]][1]
			}
			
		}
		else if cursor[0] = size[0]-1 {
			cursor[0] = 0
			if (is_array(global.inventory[cursor[0]][cursor[1]])){
				cursor[1] = global.inventory[cursor[0]][cursor[1]][1]
			}
		}
	
	}
	
	if keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")){
	
		if cursor[1] > 0 {
			cursor[1]--
			if is_array(global.inventory[cursor[0]][cursor[1]]) {
				var _yy = global.inventory[cursor[0]][cursor[1]][1]
				cursor[0] = global.inventory[cursor[0]][cursor[1]][0]
				cursor[1] = _yy
			}
		}
		else if cursor[1] = 0 {
			
			cursor[1] = size[1]-1
			if is_array(global.inventory[cursor[0]][cursor[1]]) {
				var _yy = global.inventory[cursor[0]][cursor[1]][1]
				cursor[0] = global.inventory[cursor[0]][cursor[1]][0]
				cursor[1] = _yy
			}
		}
	}
	if keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")){
	
		if cursor[1] < size[1]-1 {
			
			if (is_array(global.inventory[cursor[0]][cursor[1]+1]))
			and global.inventory[cursor[0]][cursor[1]+1][1] = cursor[1]{
				
				cursor[1]++
				while is_array(global.inventory[cursor[0]][cursor[1]])
				and global.inventory[cursor[0]][cursor[1]][0] = _ow
				and global.inventory[cursor[0]][cursor[1]][1] = _oh{
					
					cursor[1]++
					if cursor[1] = size[1] cursor[1] = 0
					
				}
			}
			else cursor[1]++
			if (is_array(global.inventory[cursor[0]][cursor[1]])){
				cursor[0] = global.inventory[cursor[0]][cursor[1]][0]
			}
			
		}
		else if cursor[1] = size[1]-1 {
			cursor[1] = 0
			if (is_array(global.inventory[cursor[0]][cursor[1]])){
				cursor[0] = global.inventory[cursor[0]][cursor[1]][0]
			}
		}
	
	}

}
