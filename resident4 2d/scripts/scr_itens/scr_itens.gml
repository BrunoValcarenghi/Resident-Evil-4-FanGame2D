function create_itens(){

o = [

	"Move",
	"Equip",
	"Use",
	"Combine",
	"Examine",
	"Discard",

]

global.itens = [

	0, //vazio

	//options:
	// 0-move
	// 1-equip
	// 2-use
	// 3-combine
	// 4-examine
	// 5-discard

	{
		nome: "Handgun",
		size: [3, 2],
		spr: spr_handgun,
		options: [o[0], o[1], o[4], o[5]]
		
	},
	
	{
		nome: "9mm ammo",
		size: [2, 1],
		spr: spr_pistol_ammo,
		options: [o[0], o[3], o[4], o[5]]
		
	},
	
	{
		nome: "Spray",
		size: [1, 2],
		spr: spr_spray,
		options: [o[0], o[2], o[4], o[5]]
		
	},

]

}

create_itens()