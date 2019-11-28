# @uathor Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Alimento
	# Clase creada con el objetivo de cumplir el principio de sustitucion de Liskov
	class PlatoExtendido < Plato
		attr_reader :gases_invernadero
		
		def initialize(nombre, alimentos)
			super(nombre, alimentos)
		end

		def eficiencia_energetica
			gases_invernadero / uso_terreno
		end

		def gases_invernadero
			sum = 0
			alimentos.each do |data|
				sum += data.emision_gases
			end
			sum
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
