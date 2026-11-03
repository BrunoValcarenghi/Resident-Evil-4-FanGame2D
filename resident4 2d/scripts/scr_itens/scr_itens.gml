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
		spr: spr_ammo_pistol,
		options: [o[0], o[3], o[4], o[5]]
		
	},
	
	{
		nome: "Spray",
		size: [1, 2],
		spr: spr_spray,
		options: [o[0], o[2], o[4], o[5]]
		
	},
	
	{
		nome: "Green herb",
		size: [1, 2],
		spr: spr_herb1,
		options: [o[0], o[2], o[3], o[4], o[5]],
		
		herb: spr_mistura1
		
	},
	
	{
		nome: "Yellow herb",
		size: [1, 2],
		spr: spr_herb2,
		options: [o[0], o[3], o[4], o[5]],
		
		herb: spr_mistura2
		
	},
	
	{
		nome: "Red herb",
		size: [1, 2],
		spr: spr_herb3,
		options: [o[0], o[3], o[4], o[5]],
		
		herb: spr_mistura3
		
	},
	
	{
		nome: "Mixed herbs",
		size: [1, 2],
		spr: spr_mistura_frasco,
		options: [o[0], o[2], o[4], o[5]],
		
		herbs: []
		
	},

]

}

create_itens()