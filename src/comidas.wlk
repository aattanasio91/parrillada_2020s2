class Comida {
	
	var property valoracion = 0
	
	method peso()
	method valoracion()
	method esAptoVegetariano()	
	method esAbundante() {
		return self.peso() > 250
	}
}

class Provoleta inherits Comida {
	
	var property tieneEspecias
	
	var property peso
	
	override method esAptoVegetariano(){
		return not self.tieneEspecias()
	}
	
	method esEspecial(){
		return self.esAbundante() or self.tieneEspecias()
	}
	
	override method valoracion(){
		return if (self.esEspecial()) 120 else 80
	}
}

class HamburguesaDeCarne inherits Comida{
	
	const property pan
	
	override method peso(){
		return 250
	}
	
	override method valoracion(){
		return 60 + pan.valoracion()
	}
	
	override method esAptoVegetariano() = false
}

object panIndustrial {
	
	method valoracion() { return 0 }
}

object panCasero {
	
	method valoracion() { return 20 }
}

object panDeMasaMadre {
	
	method valoracion() { return 45 }
}

class HamburguesaVegetariana inherits HamburguesaDeCarne {

	const property legumbre
	
	override method esAptoVegetariano() = true
	
	override method valoracion(){
		return super() + (2 * legumbre.size()).min(17) 
	}
}


class Parrillada inherits Comida {
	
	var property cortes = []
	
	
	override method valoracion(){
		return ((15 * self.calidadMaximaDeCortes()) - self.cantidadDeCortesEnParrillada()).max(0)
	}
	
	override method esAptoVegetariano() = false
	
	override method peso(){
		return self.cortes().sum({corte => corte.peso()})
	}
	
	method agregarAParrillada(unCorte){
		cortes.add(unCorte)
	}
	
	method cantidadDeCortesEnParrillada(){ return cortes.size()}
	
	method calidadMaximaDeCortes() {
		return cortes.max({corte => corte.calidad()}).calidad()
	}
	
}

class CortesDeCarne {
	var property nombre
	var property calidad
	var property peso
}
