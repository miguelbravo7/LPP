# Implementacion de la clase PlatoExtendido
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Alimento
	# Clase PlatoExtendido creada siguiendo el principio de sustitucion de Liskov
	class PlatoExtendido < Plato
		# Atributos que representan la clase PlatoExtendido
		attr_reader :gases_invernadero
		
		# Constructor de clase
		# @param nombre [String] nombre del plato
		# @param alimentos [Alimento::List] lista de alimentos del plato
		def initialize(nombre, alimentos)
			super(nombre, alimentos)
		end

		# Metodo para calcular la eficiencia energetica
		# @return [Numeric] proporcion gases invernaderos / uso de terreno
		def eficiencia_energetica
			gases_invernadero / uso_terreno
		end

		# Metodo para calcular la cantidad de gases de efecto invernadero total
		# @return [Numeric] sumatorio de gases de efecto invernadero
		def gases_invernadero
			sum = 0
			alimentos.each do |data|
				sum += data.emision_gases
			end
			sum
		end

		# Metodo para calcular la cantidad de terreno utilizado para producir el plato
		# @return [Numeric] sumatorio de los terrenos utilizados por cada alimento
		def uso_terreno
			sum = 0
			@alimentos.each do |data|
				sum += data.terreno_utilizado
			end
			sum
		end
	end
end
