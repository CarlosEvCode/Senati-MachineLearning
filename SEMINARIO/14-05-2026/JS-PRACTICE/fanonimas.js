// Funcion standard
function hacerAlgo(){
	return "Proceso terminado"
}

const valor = hacerAlgo() //Obtener el valor
console.log(valor) //Imprimir resultado

// Funcion anonima
const saludo = function(){
	return "Buenos dias"
}

console.log(saludo) //function()
console.log(saludo()); //valor de la funcion


//Funcion autoejecutable.. construye (anonima), inmediatamente se ejecuta
(function(){
	console.log("Autoejecutado..")
})();
