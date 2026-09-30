//Show player stats
//Mostrar status do player
draw_set_colour(c_white)
draw_set_halign(0)

draw_text(20, 30, string_concat("life",  hp))
draw_text(20, 70, string_concat("coin", coins))