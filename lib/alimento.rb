class Alimento
	attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :emision_gases, :terreno_utilizado
	@to_kcal = {:glucidos => 4, :lipidos => 9, :proteinas => 4}
	def initialize()
		@nombre = "a"
		@proteinas = 1 
	        @carbohidratos = 2 
		@lipidos = 7
		@emision_gases = 3
		@terreno_utilizado = 4
	end

	def to_s()
		"#{@nombre}: Proteinas:#{@proteinas}g Carbohidratos:#{@carbohidratos}g Lipidos:#{@lipidos}g GEI:#{@emision_gases}kgCO2eq Terreno:#{@terreno_utilizado}m^2anio"
	end
end
