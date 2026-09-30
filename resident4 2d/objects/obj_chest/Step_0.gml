get_input()

if key_interactive
and open = false
and distance_to_object(obj_player) < 30{
	
	audio_random(sfx_dialogo)

	open = true
	image_speed = 1

	qnt = 3 + irandom(6)

	for(i = 0; i < qnt; i++){

		instance_create_layer(x, y, "itens", obj_coin)

	}	
	
}