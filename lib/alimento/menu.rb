# Implementacion de la clase PlatoExtendido
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>

module Menu
	class Menu
    # Atributos de instancia que representan las propiedades del menu
		attr_accessor :precios, :platos

		# Constructor de clase
		def initialize(&block)
			@precios = Array.new()
			@platos = Array.new()
			if block_given?
				if block.arity == 1
  				yield self
				else
 					instance_eval(&block)
				end
 			end
		end

		# Metodo para añadir un plato al menu
    # @param nombre [Plato::Plato] plato a añadir
    # @param nombre [Numeric] precio del plato
		def anadir_plato(plato, precio)
			@platos << plato
			@precios << precio
		end

	end
end
