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
		type: "weapon",
		nome: "Handgun",
		size: [3, 2],
		spr: spr_handgun,
		options: [o[0], o[1], o[4], o[5]]
		
	},
	
	{	
		type: "ammo",
		nome: "9mm ammo",
		size: [2, 1],
		spr: spr_ammo_pistol,
		options: [o[0], o[3], o[4], o[5]]
		
	},
	
	{	
		type: "heal",
		nome: "Spray",
		size: [1, 2],
		spr: spr_spray,
		options: [o[0], o[2], o[4], o[5]],
		
		heal: 10
		
	},
	
	{	
		type: "heal",
		nome: "Green herb",
		size: [1, 2],
		spr: spr_herb1,
		options: [o[0], o[2], o[3], o[4], o[5]],
		
		herb: spr_mistura1,
		
		heal: 1
		
	},
	
	{	
		type: "heal",
		nome: "Yellow herb",
		size: [1, 2],
		spr: spr_herb2,
		options: [o[0], o[3], o[4], o[5]],
		
		herb: spr_mistura2,
		
		heal: 0
		
	},
	
	{	
		type: "heal",
		nome: "Red herb",
		size: [1, 2],
		spr: spr_herb3,
		options: [o[0], o[3], o[4], o[5]],
		
		herb: spr_mistura3,
		
		heal: 3
		
	},
	
	{	
		type: "heal",
		nome: "Mixed herbs",
		size: [1, 2],
		spr: spr_mistura_frasco,
		options: [o[0], o[2], o[4], o[5]],
		
		herbs: [],
		
		heal: 0,
		
	},

]

}

create_itens()