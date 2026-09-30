get_input()

if key_aim state = 2
else if hsp != 0 or vsp != 0 state = 1
else state = 0

player_sprite()

switch state{
	
	case 1:
		move_col()
		break;
		
	case 2:
		shoot()
		break;
		
	default:
		move_col()
		break;

}

if !invencible{image_alpha = 1}

if hp < 1 room_restart()

