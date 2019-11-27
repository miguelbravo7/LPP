# @title Modulo de la clase alimento.
# Modulo en el que se ha implementado la clase Alimento
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Alimento

  # Clase alimento que representa un alimento con sus propiedades nutricionales,
  # su emision de gases y el terreno que se requiere para producir el alimento 
  class Alimento
	include Comparable

  	# Atributos de instancia que representan las propiedades del alimento
  	attr_accessor :nombre, :proteinas, :carbohidratos, :lipidos, :emision_gases, :terreno_utilizado

	# Atributos de instancia que guardan los valores necesarios para hacer conversiones
	attr_reader :to_kcal, :ing_rec

	# Constructor de clase
	# @param nombre [String] nombre del alimento
	# @param proteinas [Numeric] numero de proteinas en gramos
	# @param carbohidratos [Numeric] numero de carbohidratos en gramos
	# @param lipidos [Numeric] numero de lipidos en gramos
        # @param emision_gases [Numeric] numero de gases de efecto invernadero en kgCO2
        # @param terreno_utilizado [Numeric] numero de metros cuadrados de uso al año en m2/año 
	# @raise ArgumentError si los valores introducidos no son del tipo correcto
  	def initialize(nombre, proteinas, carbohidratos, lipidos, emision_gases, terreno_utilizado)
  		@nombre = nombre
  		@proteinas = proteinas
	        @carbohidratos = carbohidratos 
		@lipidos = lipidos
		@emision_gases = emision_gases
		@terreno_utilizado = terreno_utilizado

		raise ArgumentError, "Argumentos erroneos" unless (@proteinas.is_a?(Numeric) && @carbohidratos.is_a?(Numeric) && @lipidos.is_a?(Numeric) && @emision_gases.is_a?(Numeric) && @terreno_utilizado.is_a?(Numeric) && @nombre.is_a?(String))

		@to_kcal = {:glucidos => 4.0, :lipidos => 9.0, :proteinas => 4.0}
		@ing_rec = {"hombre" => 3000.0, "mujer" => 2300.0}
	end

	# Metodo para representar la clase como cadena
	# @return [String] cadena con el alimento y sus propiedades
	def to_s()
		"#{@nombre}: Proteinas:#{@proteinas}g Carbohidratos:#{@carbohidratos}g Lipidos:#{@lipidos}g GEI:#{@emision_gases}kgCO2eq Terreno:#{@terreno_utilizado}m^2anio"
	end

	def <=>(obj)
		[(1)] <=> [(1)]
	end

	# Metodo que calcula el porcentaje que aporta el alimento sobre la ingesta recomendada
	# @params poblacion [String] poblacion en la que se calcula el porcentaje de ingesta recomendada
	# @raise ArgumentError si no se tiene definida la poblacion definida
	def por_ing_recomendada(poblacion)
		raise StandardError, ("Parametro  tipo #{poblacion.class} no valido, usar String") unless poblacion.is_a? String
		
		if (@ing_rec.has_key? poblacion)
			(@proteinas * @to_kcal[:proteinas] 
			 + @carbohidratos * @to_kcal[:proteinas] 
			 + @lipidos * @to_kcal[:lipidos]) / (@ing_rec[poblacion])
		else
			raise StandardError, ("No existe ingesta recomendada para " + poblacion)
		end
	end

	# Metodo para el calculo del impacto ambiental
	# @param (see #por_ing_recomendada)
	# @raise (see #por_ing_recomendada)
	def impacto_ambiental(poblacion)
		(1 / por_ing_recomendada(poblacion) ) * @emision_gases
	end
  end
end
