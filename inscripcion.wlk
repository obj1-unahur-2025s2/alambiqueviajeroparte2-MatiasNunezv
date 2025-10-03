import elAlambiqueViajero.*

object centro {
    const inscritos = []
    const rechazados = []
    var ciudad = buenosAires

    method inscripcion(vehiculo) {
        if(self.puedeCompetir(vehiculo)) {
            inscritos.add(vehiculo)
        }
        else {
            rechazados.remove(vehiculo)
        }
    }

    method puedeCompetir(vehiculo) = ciudad.puedeLlegar(vehiculo)

    method replanificacion(unaCiudad){
        ciudad = unaCiudad
    }

    method reverificacion() {
        inscritos.map(inscritos.filter({v => v.puedeCompetir(v)}))
    }

    method iniciarCarrera() {

    }
}


