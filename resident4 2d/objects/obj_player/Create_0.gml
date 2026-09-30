global.pausa = false;
trava = false;

//attributes
//atributos
hp = 5;
can_shoot = true;
shoot_time = 20;
invencible = false;
invencible_time = 60;
coins = 0;
magnet_distance = 10;

//spd
wlk = 1;
run = 1.7;
spd = wlk
hsp = 0
vsp = 0

//directions:
//primeiro digito
// 0 = down
// 1 = down-side
// 2 = side
// 3 = top-side
// 4 = top
//segundo digito
// 0 = image_xscale = 1
// 1 = image_xscale = -1
dir = [0, 0]

//satates
// 0 = idle
// 1 = walk
// 2 = aim
state = 0

sprites = [
		
	//idle
	[
		spr_player_pistol_idle_d, 
		spr_player_pistol_idle_sd, 
		spr_player_pistol_idle_s, 
		spr_player_pistol_idle_st, 
		spr_player_pistol_idle_t
	],
	//walk
	[
		spr_player_pistol_walk_d, 
		spr_player_pistol_walk_sd, 
		spr_player_pistol_walk_s, 
		spr_player_pistol_walk_st, 
		spr_player_pistol_walk_t
	],
	//aim
	[
		spr_player_pistol_aim_d, 
		spr_player_pistol_aim_sd, 
		spr_player_pistol_aim_s, 
		spr_player_pistol_aim_st, 
		spr_player_pistol_aim_t
	],
]
