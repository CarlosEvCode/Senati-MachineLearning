//ARROW = flecha
const getCarrera = () => {
	return "Ingenieria de Software"
}

//RETURN IMPLICITO
const getSede = () => console.log("UCP chincha");
const calcularPago = () => 1500
//console.log(getCarrera())

getSede()
console.log(calcularPago())

// UN SOLO PARAMETRO (se puede omitir parentisis)
const getImpuesto = precio => precio * 0.18
console.log(getImpuesto(1500))

//MAS DE UN PARAMETRO (requiere parentesis)
const sumatoria = (a,b,c) => a + b + c
console.log(sumatoria(15,20,5))
