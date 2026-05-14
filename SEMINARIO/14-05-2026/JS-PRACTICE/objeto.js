const aplicacion = {
	nombre: "WhatsApp",
	version: 2.26,
	espaciomb: 120,
	sistemas: ["Android", "IOS", "Windows"],
	desarrollador: "META",
	estaVigente: true,
	especificaciones: {
		cpu: ["ARM","X86"],
		ram: 2048,
		tampantalla: 5.5
	},
	toString: function(){
		return `${this.nombre} v${this.version} - Dev. ${this.desarrollador}`
	}
}

//console.log(aplicacion.nombre) //WhatsApp
//console.log(aplicacion["version"]) //2.26 (PHP)

aplicacion.requiereDatos = true
aplicacion["idiomas"] = ["Español", "Ingles", "Chino","Aleman"]

console.log(aplicacion.toString())
