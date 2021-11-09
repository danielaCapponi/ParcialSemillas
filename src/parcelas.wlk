class Parcela {

	var property ancho
	var property largo
	var property plantas = []
	var property horasDeSol

	method superficie() = self.ancho() * self.largo()

	method cantidadMaximaPlantas() = if (self.ancho() > self.largo()) self.superficie() / 5 else ((self.superficie() / 3) + self.largo())

	method tieneComplicaciones() = plantas.any{ planta => planta.cantidadHorasSolQueTolera() < self.horasDeSol() }

	method plantar(unaPlanta) {
		if (self.cantidadMaximaPlantas() == self.plantas().size()) {
			// Al plantar se superará la cantidad máxima
			self.error("Alcanzó la cantidad máxima de plantas")
		} else if (self.horasDeSol() - unaPlanta.cantidadHorasSolQueTolera() >= 2) {
			// La cantidad de sol supera 2 horas o más la cantidad que tolera la planta
			self.error("La planta no tolera la cantidad de sol")
		} else {
			plantas.add(unaPlanta)
		}
	}

	method asociaBien(unaPlanta) = true

	method esAutosustentable() = plantas.size() > 4

	method porcentajeDePlantasBienAsociadas() = (self.cantidadDePlantasBienAsociadas() / self.plantas().size()) * 100

	method cantidadDePlantasBienAsociadas() = self.plantas().count{ planta => self.asociaBien(planta) }

}

class ParcelaEcologica inherits Parcela {

	override method asociaBien(unaPlanta) = (not self.tieneComplicaciones()) && unaPlanta.esIdeal(self)

}

class ParcelaIndustrial inherits Parcela {

	override method asociaBien(unaPlanta) = self.plantas().size() < 3 && unaPlanta.esFuerte()

}

