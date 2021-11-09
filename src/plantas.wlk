class Planta {

	// Año en que fue cosechada la semilla
	var property cosecha
	// Altura en metros
	var property altura

	method esFuerte() = self.cantidadHorasSolQueTolera() > 10

	method daNuevasSemillas() = self.esFuerte()

	method metrosOcupados()

	method cantidadHorasSolQueTolera()

	method esIdeal(unaParcela)

}

class Menta inherits Planta {

	override method cantidadHorasSolQueTolera() = 6

	override method daNuevasSemillas() = super() || self.altura() > 0.4

	override method metrosOcupados() = self.altura() * 3

	override method esIdeal(unaParcela) = unaParcela.superficie() > 6

}

class Hierbabuena inherits Menta {

	override method metrosOcupados() = super() * 2

}

class Soja inherits Planta {

	override method cantidadHorasSolQueTolera() {
		return if (self.altura() < 0.5) {
			6
		} else if (self.altura().between(0.5, 1)) {
			7
		} else {
			9
		}
	}

	override method daNuevasSemillas() = super() || (self.cosecha() > 2007 && self.altura() > 1)

	override method metrosOcupados() = self.altura() / 2

	override method esIdeal(unaParcela) = unaParcela.horasDeSol() == self.cantidadHorasSolQueTolera()

}

class SojaTransgenica inherits Soja {

	override method daNuevasSemillas() = false

	override method esIdeal(unaParcela) = unaParcela.plantas().size() == 1

}

class Quinoa inherits Planta {

	var property horasDeSolQueTolera

	override method cantidadHorasSolQueTolera() = self.horasDeSolQueTolera()

	override method metrosOcupados() = 0.5

	override method daNuevasSemillas() = super() || self.cosecha() < 2005

	override method esIdeal(unaParcela) = not unaParcela.plantas().any{ planta => planta.altura() > 1.5}

}

