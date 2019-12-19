# Implementacion de la clase PlatoExtendido
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>

module Menu
	class Menu
                # Atributos de instancia que representan las propiedades del menu
		attr_accessor :precios, :platos

		# Constructor de clase
		def initialize()
			@precios = Array.new()
			@platos = Array.new()
		end

		def anadir_plato(plato, precio)
			@platos << plato
			@precios << precio
		end

	end
end
