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
		desc: "A standard 9mm handgun.",
		size: [3, 2],
		spr: spr_handgun,
		orientation: 0,
		margin: 0,
		options: [o[0], o[1], o[4], o[5]],
		
		ammo: 10,
		capacity: 10,
		
	},
	
	{	
		type: "ammo",
		nome: "Handgun Ammo",
		desc: "A box of 9mm rounds.",
		size: [2, 1],
		spr: spr_ammo_pistol,
		orientation: 0,
		margin: 0,
		options: [o[0], o[3], o[4], o[5]],
		
		ammo: 50,
		capacity: 50,
		
	},
	
	{	
		type: "heal",
		nome: "First Aid Spray",
		desc: "Completely restores health.",
		size: [1, 2],
		spr: spr_spray,
		orientation: 0,
		margin: 0,
		options: [o[0], o[2], o[4], o[5]],
		
		heal: 10
		
	},
	
	{	
		type: "heal",
		nome: "Green herb",
		desc: "Herb that restores partial health.",
		size: [1, 2],
		spr: spr_herb1,
		orientation: 0,
		margin: 0,
		options: [o[0], o[2], o[3], o[4], o[5]],
		
		herb: spr_mistura1,
		
		heal: 1
		
	},
	
	{	
		type: "heal",
		nome: "Yellow herb",
		desc: "Mixing it with a Green Herb will increase your maximum health.",
		size: [1, 2],
		spr: spr_herb2,
		orientation: 0,
		margin: 0,
		options: [o[0], o[3], o[4], o[5]],
		
		herb: spr_mistura2,
		
		heal: 0
		
	},
	
	{	
		type: "heal",
		nome: "Red herb",
		desc: "Mixing it with a Green Herb will completely restore health.",
		size: [1, 2],
		spr: spr_herb3,
		orientation: 0,
		margin: 0,
		options: [o[0], o[3], o[4], o[5]],
		
		herb: spr_mistura3,
		
		heal: 3
		
	},
	
	{	
		type: "heal",
		nome: "Mixed herbs",
		desc: "A mixture of herbs. Restores health significantly.",
		size: [1, 2],
		spr: spr_mistura_frasco,
		orientation: 0,
		margin: 0,
		options: [o[0], o[4], o[5]],
		
		herb: [],
		
		heal: 0,
		
	},

]

}

create_itens()