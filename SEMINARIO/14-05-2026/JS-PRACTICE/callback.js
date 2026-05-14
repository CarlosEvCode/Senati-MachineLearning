//Una funcion de tipo CALLBACK (devolucion de llamada) es una funcion pasada como parametro a otra funcion
const firmaDigital = function(){
	console.log("Firmando documento...")
	console.log("Firmando correctamente")
}

const emitirComprobante= function(procesoFirma){
	console.log("Procesando datos")
	procesoFirma()
	console.log("Fin de la transaccion")
}

emitirComprobante(firmaDigital)
