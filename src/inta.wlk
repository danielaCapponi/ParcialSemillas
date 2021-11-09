object inta {

	var property parcelas = []

	method agregarParcela(unaParcela) {
		parcelas.add(unaParcela)
	}

	method promedioDePlantasPorParcela() = (self.parcelas().sum{ parcela => parcela.plantas().size() }) / self.parcelas().size()

	method parcelaMasAutosustentable() = self.parcelas().filter({ parcela => parcela.esAutosustentable() }).max{ parcela => parcela.porcentajeDePlantasBienAsociadas() }

}

