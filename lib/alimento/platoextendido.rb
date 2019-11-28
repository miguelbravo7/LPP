module Alimento
	# Clase creada con el objetivo de cumplir el principio de sustitucion de Liskov
	class PlatoExtendido < Plato
		attr_reader :gases_invernadero
		
		def initialize(nombre, alimentos)
			super(nombre, alimentos)
			@gases_invernadero = 0
			alimentos.each do |data|
				 @gases_invernadero += data.emision_gases
			end
		end

		def eficiencia_energetica

		end

		def uso_terreno
			sum = 0
			@alimentos.each do |data|
				sum += data.terreno_utilizado
			end
			sum
		end
	end
end
