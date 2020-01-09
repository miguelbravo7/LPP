# Implementacion de la clase Plato
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Plato
	INDICE_BAJO = 1
  INDICE_MEDIO = 2
  INDICE_ALTO = 3

  ENERGIA_BAJO = 670
  ENERGIA_MEDIO = 830

  GASES_BAJO = 800
  GASES_MEDIO = 1200

	# Clase Plato que representa un un grupo de alimentos con sus propiedades nutricionales
	class Plato
		include Comparable
		# Atributos de instancia que representan las propiedades del plato
		attr_reader :cjto_gramos
		attr_accessor :nombre, :alimentos

		# Constructor de clase
		# @param nombre [String] nombre del plato
		# @param alimentos [Alimento::List] lista de alimentos del plato
		# @raise ArgumentError si los valores introducidos no son del tipo correcto
		def initialize(nombre, alimentos, &block)
			raise ArgumentError unless nombre.is_a?(String) && alimentos.is_a?(Alimento::Lista)
			@nombre = nombre
			@alimentos = alimentos
			@cjto_gramos = 0
			alimentos.each do |data|
				@cjto_gramos += data.proteinas + data.lipidos + data.carbohidratos
			end
			if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval(&block)
        end
      end
		end

		# Metodo para representar la clase como cadena
		# @return [String] cadena con el nombre del plato y sus alimentos
		def to_s
			output = @nombre + "\n"
			output += @alimentos.to_s
			output
		end

		def <=>(obj)
			[@cjto_gramos, @alimentos] <=> [obj.cjto_gramos, obj.alimentos]
		end

		def alimento(nombre, opciones = {})
			@alimentos.insertar(new Alimento::Alimento(nombre, opciones[:proteinas], opciones[:carbohidratos], opciones[:lipidos], opciones[:emision_gases], opciones[:terreno_utilizado]))
		end

    # Metodo que calcula el sumatorio de energia del plato
    # @return [Numeric] energia obtenida del total de alimentos
    def energia()
			sum = 0
      @alimentos.each do |data|
      	sum += data.kcal_sum()
      end
			sum
    end

		# Metodo que calcula el sumatorio de emision de gases del plato
    # @return [Numeric] emision de gases obtenida del total de alimentos
    def emision_gases()
      sum = 0
      @alimentos.each do |data|
        sum += data.emision_gases
      end
      sum
    end

    # Metodo que calcula la huella nutricional del plato
    # @return [Numeric] huella nutricional obtenida del total de alimentos
    def huella_nutricional()
      impacto_energia() + impacto_emision_gases()
    end

		# Metodo que calcula impacto de la energia del plato
    # @return [Numeric] impacto obtenido del total de alimentos
    def impacto_energia()
			sum = energia()
        if sum < ENERGIA_BAJO
                INDICE_BAJO
        elsif sum < ENERGIA_MEDIO
                INDICE_MEDIO
        else
                INDICE_ALTO
        end
      end

		# Metodo que calcula impacto de la emision de gases del plato
    # @return [Numeric] impacto obtenido del total de alimentos
    def impacto_emision_gases()
      sum = emision_gases()
      if sum < GASES_BAJO
              INDICE_BAJO
      elsif sum < GASES_MEDIO
              INDICE_MEDIO
      else
              INDICE_ALTO
      end

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
