
//=============================================
// JUGADOR QUIETO
//=============================================
function scrJugadorQuieto(){
	
if speed = 0{
image_speed = 0;
image_index = 0;
}

if mouse_check_button_pressed(mb_none){
sprite_index = sprJugador;
}


if keyboard_check(vk_nokey){
speed = 0;	
image_speed = 0;
}	

}

//=============================================
// JUGADOR CAMINANDO
//=============================================
function scrJugadorCaminar(){

image_angle = direction;

if mouse_check_button(mb_right){
speed = 1.5;

direction = point_direction(x, y, mouse_x, mouse_y);


if speed > 0{
image_speed = 1;	
}

}


}


//=============================================
// JUGADOR CORRIENDO
//=============================================
function scrJugadorCorrer(){

if mouse_check_button(mb_right) && keyboard_check(vk_shift){
speed = speed + velocidadCorrer;
energia = energia - 2;
}
	
}


//=============================================
// JUGADOR CANSADO
//=============================================
function scrJugadorCansarse(){

energia+=1.4;


if energia <= 0{
energia = 0;
}


if energia >= 100{
energia = 100;
}


if energia = 0{
speed = 0;	
}


}


//=============================================
// JUGADOR GOLPEANDO
//=============================================
function scrJugadorGolpear(){

if mouse_check_button_pressed(mb_left){

sprite_index = sprJugadorGolpeando;

}

}

//=============================================
//USO DE ARMAS
//=============================================
function scrJugadorCambiarArmas(){
	
	
	///CAMBIADOR DE ARMAS
	if keyboard_check_pressed(ord("Q")){
	armas = armas - 1;	
	}
	
	if keyboard_check_pressed(ord("E")){
	armas = armas + 1;	
	}
	

	//Limites del cambiador de armas
	if armas < 0{
	armas = 0;	
	}
	if armas > 2{
	armas = 2;	
	}



	switch(armas){
		
	case 0:
	sprite_index = sprJugador;
	
	if mouse_check_button_pressed(mb_none){
	sprite_index = sprJugador;
	}	
	
	if mouse_check_button_pressed(mb_left){
	sprite_index = sprJugadorGolpeando;	
	}
	
	break;
	
	//---
	
	case 1:
	
	if tienePistola = true{	
	
	sprite_index = sprJugadorPistola;
	image_index = 0;
	image_speed = 0;
	
	
	if mouse_check_button_pressed(mb_none){
	sprite_index = sprJugadorPistola;
	}	
	
	//Disparar Pistola
	if mouse_check_button_pressed(mb_left) && balasPistola > 0{
	instance_create_depth(x,y,0,objBala);
	balasPistola = balasPistola - 1;
	
	
	//Ajustar limites de balas (Que no sea menos que 0)
	if balasPistola <= 0{
	balasPistola = 0;	
	
	}
	
	}
	
	}else{
	sprite_index = sprJugador;	
	}
	
	break;
	
	
	//---
	
	case 2:
	
	if tieneCuchillo = true{
	sprite_index = sprJugadorCuchilla;
	image_index = 0;
	image_speed = 0;
	
	if mouse_check_button_pressed(mb_none){
	sprite_index = sprJugadorCuchilla
	image_speed = 0;
	}	
	
	if mouse_check_button_pressed(mb_left){
	sprite_index = sprJugadorCuchilla
	image_index = 1;
	}
	
	}else{
		sprite_index = sprJugador;
	}

	break;
	
	
	}

	}
	
	function scrJugadorMorir(){
	
	if vida < 1{
	show_message("Haz muerto!");
	room_restart();
	}

}