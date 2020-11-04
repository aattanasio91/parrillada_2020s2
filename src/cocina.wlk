import comidas.*
import comensales.*

class Cocina {
	
	var property comidas = []
	
	method tieneBuenaOfertaVegetariana(){
		return (self.comidas().count({comida => not comida.esAptoVegetariano()}) - 
			self.comidas().count({comida => comida.esAptoVegetariano()})).abs() <= 2
	}
	
	method platoFuerteCarnivoro(){
		return self.comidas().filter({comida => not comida.esAptoVegetariano()}).max({comida => comida.valoracion()})
	}
	
	method comidasQueLeGustan(comensal){
		return self.comidas().filter({comida => comensal.leAgrada(comida)})
	}
	
	method elegirPlato(comensal){
		if(self.comidasQueLeGustan(comensal).size() > 1){
			const comida = self.comidas().anyOne()
			self.comidas().remove(comida)
			comensal.comer(comida)
		}
		else{
			self.error("No hay comidas que le gusten")
		}
	}
}