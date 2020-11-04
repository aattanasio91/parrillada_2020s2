import comidas.*
class Comensal {
	var property comidas = []
	var property peso = 0
	method leAgrada(unaComida)
	
	method satisfecho() {
		return self.comidas().sum({comida => comida.peso()}) >= self.peso() * 0.01
	}
	
	method comer(unaComida) {
		self.comidas().add(unaComida)
	}
}

class Vegetariano inherits Comensal {
	
	override method leAgrada(unaComida){
		return unaComida.esAptoVegetariano() and unaComida.valoracion()>85
	}
	
	override method satisfecho(){
		return super() and not self.comidas().all({comida => comida.esAbundante()})
	}
}

class HambrePopular inherits Comensal {
	
	override method leAgrada(unaComida){
		return unaComida.esAbundante()
	}
}

class PaladarFino inherits Comensal {
	
	override method leAgrada(unaComida){
		return unaComida.peso().between(150, 300) and unaComida.valoracion() > 100 
	}
	
	override method satisfecho() {
		return self.comidas().size().even()
	}
}