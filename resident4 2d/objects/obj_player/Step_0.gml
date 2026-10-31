get_input()

player_sprite()

switch state{
	
	case 1:
		controle_status()
		move_col()
		break;
		
	case 2:
		controle_status()
		shoot()
		break;
		
	case 3:
		facada()
		break;
		
	default:
		controle_status()
		move_col()
		break;

}

if !invencible{image_alpha = 1}

if hp < 1 room_restart()

