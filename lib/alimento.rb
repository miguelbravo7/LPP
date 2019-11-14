class Alimento
	attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :emision_gases, :terreno_utilizado
	attr_reader :to_kcal, :ing_rec
	def initialize()
		@nombre = "a"
		@proteinas = 1 
	        @carbohidratos = 2 
		@lipidos = 7
		@emision_gases = 3
		@terreno_utilizado = 4
		@to_kcal = {:glucidos => 4.0, :lipidos => 9.0, :proteinas => 4.0}
		@ing_rec = {"hombre" => 3000.0, "mujer" => 2300.0}
	end

	def to_s()
		"#{@nombre}: Proteinas:#{@proteinas}g Carbohidratos:#{@carbohidratos}g Lipidos:#{@lipidos}g GEI:#{@emision_gases}kgCO2eq Terreno:#{@terreno_utilizado}m^2anio"
	end

	def por_ing_recomendada(genero)
		if (@ing_rec.has_key? genero)
			(@proteinas * @to_kcal[:proteinas] 
			 + @carbohidratos * @to_kcal[:proteinas] 
			 + @lipidos * @to_kcal[:lipidos]) / (@ing_rec[genero])
		else
			0.0
		end
	end
end
