function get_input(){

// movement keys
// teclas de movimiento
// teclas de movimentação
key_up = keyboard_check(ord("W"))
key_left = keyboard_check(ord("A"))
key_down =  keyboard_check(ord("S"))
key_right = keyboard_check(ord("D"))

key_aim = mouse_check_button(mb_right)
key_shoot = mouse_check_button(mb_left)

key_sprint = keyboard_check(vk_control)

key_interactive = keyboard_check_pressed(ord("E"))

}