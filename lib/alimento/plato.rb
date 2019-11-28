# Implementacion de la clase Alimento 
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Alimento
	# Clase Plato que representa un un grupo de alimentos con sus propiedades nutricionales
	class Plato
		# Atributos de instancia que representan las propiedades del plato
		attr_reader :nombre, :cjto_gramos
		attr_accessor :alimentos

		# Constructor de clase
		# @param nombre [String] nombre del plato
		# @param alimentos [Alimento::List] lista de alimentos del plato
		# @raise ArgumentError si los valores introducidos no son del tipo correcto
		def initialize(nombre, alimentos)
			raise ArgumentError unless nombre.is_a?(String) && alimentos.is_a?(Lista)
			@nombre = nombre
			@alimentos = alimentos
			@cjto_gramos = 0
			alimentos.each do |data|
				@cjto_gramos += data.proteinas + data.lipidos + data.carbohidratos
			end
		end

		# Metodo para representar la clase como cadena
		# @return [String] cadena con el nombre del plato y sus alimentos
		def to_s
			output = @nombre + "\n"
			output += @alimentos.to_s
			output
		end

		# Metodo que calcula el porcentaje de proteinas del plato
		# @return [Numeric] porcentaje obtenido del total de alimentos
		def porc_proteinas
			sum = 0
			@alimentos.each do |data|
				sum += data.proteinas
			end
			(sum / @cjto_gramos) * 100
		end

		# Metodo que calcula el porcentaje de lipidos del plato
		# @return (see #porc_proteinas)
		def porc_lipidos
			sum = 0
			 @alimentos.each do |data|
				sum += data.lipidos
			 end
			 (sum / @cjto_gramos) * 100
		end

		# Metodo que calcula el porcentaje de carbohidratos del plato
		# @return (see #porc_proteinas)
		def porc_hidratos_carbono
			sum = 0
			@alimentos.each do |data|
				sum += data.carbohidratos
			end
			(sum / @cjto_gramos) * 100 
		end

		# Metodo que calcula el valor calorico total del plato
		# @return [Numeric] suma total de la conversion de gramos a kcal de cada alimento
		def valor_calorico_total
			sum = 0
			@alimentos.each do |data|
				sum += data.kcal_sum
			end
			sum
		end
	end
end	
