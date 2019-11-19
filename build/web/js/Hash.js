/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var configuracion = {
	caracteres : 8,
	numeros: false,
	simbolos: false,
	mayusculas: false,
	minisculas: true
}


var caracteres = {

	numeros: '0 1 2 3 4 5 6 7 8 9',
	simbolos: '- _ { } [ ] + * @ $ % # ? ¡ ! /',
	mayusculas: 'A B C D E F G H I J K L M N O P Q R S T U V W X Y Z',
	minisculas: 'a b c d e f g h i j k l m n o p q r s t u v w x y z'


}






function generarpass(){

	 var caracteresFinales = '';
	 var password = '';

	 for (propiedad in configuracion) {
	 	if (configuracion[propiedad] == true) {
	 		caracteresFinales += caracteres[propiedad] + ' ';
	 	} 	 
	 }
	 //console.log(caracteresFinales);

	 //Le quita los espacios
	  caracteresFinales = caracteresFinales.trim();
	  //convierte a arreglo
	  caracteresFinales = caracteresFinales.split(' ');

	  //console.log(caracteresFinales);
	
	  for (var i = 0; i < configuracion.caracteres;  i++) {
	
	  	password += caracteresFinales[Math.floor(Math.random() * caracteresFinales.length)];


	  }
	  //console.log(password);

          return password;
}


