const aplicacion = {
  nombre: "WhatsApp",
  version: 2.26,
  espaciomb: 120,
  sistemas: ["Android", "iOS", "Windows"],
  desarrollador: "META",
  estaVigente: true,
  especificaciones: {
    cpu: ["ARM", "x86"],
    ram: 2048,
    tampantalla: 5.5
  }
}

//ObjectJS > JSON
const json = JSON.stringify(aplicacion);
//console.log(json)

//JSON > ObjectJS
const textoJSON = `{"nombre":"WhatsApp","version":2.26,"espaciomb":120,"sistemas":["Android","iOS","Windows"]
,"desarrollador":"META","estaVigente":true,"especificaciones":{"cpu":["ARM","x86"],"ram":2048,"tampantalla":5.5}}`

const objetoJS = JSON.parse(textoJSON)
console.log(objetoJS);
