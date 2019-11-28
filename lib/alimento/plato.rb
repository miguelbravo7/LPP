# Implementacion de la clase Alimento 
# # @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Alimento
	# Clase Plato que representa un un grupo de alimentos con sus propiedades nutricionales
	class Plato
		# Atributos de instancia que representan las propiedades del alimento
		attr_reader :nombre, :cjto_gramos
		attr_accessor :alimentos

		def initialize()
			@nombre = ""
			@alimentos = ""
			@cjto_gramos = 1
		end

		def porc_proteinas

		end

		def porc_lipidos

		end

		def porc_hidratos_carbono

		end

		def valor_calorico_total

		end
	end
end	
