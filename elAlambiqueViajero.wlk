object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}

object alambiqueVeloz {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.head() == "A"
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object antigualla {
    var gangsters = 7
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 6
    method desgaste(){
        gangsters = gangsters -1
    }
    method patenteValida() = chatarra.rapido() 

}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones

}

object convertible{
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar() 
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(vehiculo){
        convertido = vehiculo
    }
    method patenteValida() = convertido.patenteValida()
 
}

object hurlingham{
   method puedeLlegar(vehiculo) =
     vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdoTipico() = "sticker de la Unahur"
}


object moto{
    method rapido() = true
    method puedeFuncionar() = not moto.rapido()
    method desgaste() { }
    method patenteValida() = false
    method velocidad() = 25
}

object antiguallaBlindada {
    var gangsters = 3
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 6
    method desgaste(){
        gangsters = gangsters -1
    }
    method patenteValida() = chatarra.rapido() 
    const nombres = ["Mario" , 'Hernan', 'Jose']
    method nombres() = nombres
    var velocidad = nombres.map({n => n.size()}).sum()
    method velocidad() = velocidad
    method subirGangster(nombre) {
        gangsters = gangsters + 1
        nombres.add([nombre])
    }
    method bajarGangster(nombre) {
        gangsters = gangsters - 1
        nombres.remove([nombre])
    }
    method estaGangster(nombre) = nombres.contains([nombre])
    method trampa() {velocidad = velocidad - 2}
}

object pierreMovil {
    var velocidad = 30
    method velocidad() = velocidad
    const ruleta = ['si', 'no']
    method perjudicarCorredor(vehiculo) {
        if(ruleta.anyOne() == 'si') {
            velocidad = velocidad - 1
            vehiculo.trampa()
        } 
        else {
            velocidad = velocidad - 5
        }
        
    }
}

object locoCar {
    const vehiculosPosibles = [pierreMovil, antiguallaBlindada, moto]
    var velocidad = 0
    method transformarseEnPrimerVehiculo(vehiculo) {
        velocidad = vehiculo.velocidad()
    }
}