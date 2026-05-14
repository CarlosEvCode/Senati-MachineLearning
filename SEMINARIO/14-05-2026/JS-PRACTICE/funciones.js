let edad = 18
let nombre = "Carlos"

typeof edad

//console.log(typeof edad)
//console.log(typeof nombre)
//console.log(typeof function(){})

//Objeto
const persona = {
	identificador: 1,
	datos: "Fiorella Cardenas",
	contacto: ["95611223","95641651"],
	direccion: {
		ubicacion: "Av Grau 111",
		distrito: "Chincha Alta",
		provincia: "Chincha",
		departamento: "ICA",
	},
	habilidad: function(){ console.log("Soy programadora") },
	destreza: function(){ return "Puedo tocar la guitarra" }
}

//console.log(typeof persona)
console.log(persona.destreza())
