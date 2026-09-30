// load language and display mode
// carga idioma e modo de visualización
// carrega idioma e modo de exibição
ini_open("save.sav")

global.display = ini_read_real("game", "display", 1)

ini_close()


// set display mode
// aplica modo de visualización
// aplica modo de exibição
if global.display = 1 window_set_fullscreen(true);
else window_set_fullscreen(false);


// start global variables
// inicializar variables globales
// iniciar variaveis globais
global.volume = 1
