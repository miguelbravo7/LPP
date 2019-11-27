# Modulo en el que se ha implementado la clase Lista
# @author Miguel Bravo Arvelo <alu0101031538@ull.edu.es>
module Alimento

	 # Clase lista que representa una lista doblemente enlazada
	class Lista
		# Atributos de instancia
		attr_reader :head, :tail, :size

		# Atributo de clase utilizado para instanciar los nodos que tiene la lista
		@@Nodo = Struct.new(:data, :prev, :next)
		
		# Constructor de clase
		def initialize()
			@head = nil
			@tail = nil
			@size = 0
		end

		# Metodo para representar la clase como cadena
		# @return [String] devuelve los valores como cadena que alberga la lista	
		def to_s
       			current_node = @head
        		while current_node != nil
            			current_node.to_s
            			current_node = current_node[:next]
        		end

			nil
    		end

		# Getter del atributo de clase Nodo
		# @return [Struct] atributo nodo de la clase
		def self.Nodo
			@@Nodo
		end
		
		# Iterador de clase para cada valor desde la cabeza
		# @yield [Object] valor almacenado en el nodo actual
		def each
			cur_node = @head
			while cur_node
        			yield cur_node[:data]
				cur_node = cur_node[:next]
			end

    		end

		# Inserta un valor al principio de la lista
		# @param [Array<Object>, Object] valor o lista de valores a introducir
		def insertar(value)
			if value.respond_to? :each
				value.each { |x| 
					insertarValor(x)
				}
			else
				insertarValor(value)
			end

			true
		end

		# Metodo del que depende el metodo insertar
		# @see #insertar
		# @return [true, false] en funcion de que se halla hecho la operacion o no
		def insertarValor(value)
			if !@tail.nil?
                                @nodo = @@Nodo.new(value, @tail, nil)
                                @tail[:next] = @nodo
                                @tail = @nodo
			else
				@tail = @head = @@Nodo.new(value, @tail, nil)
			end
			
			@size += 1

			true
		end

		# Extare el primer nodo de la lista
		# @return [true, false] en funcion de que se halla hecho la operacion o no
		def extraerPrimero
			if @size < 2
				if @head.nil?
					false
				else
					@head = nil
					@tail = nil
					@size = 0
					true
				end
			else
				@head = @head[:next]
				@head[:prev] = nil
				@size -= 1
				true
			end

		end

		# Extrae el ultimo nodo de la lista
		# @return (see #extraerPrimero)
		def extraerUltimo
                        if @size < 2
                                if @tail.nil?
                                        false
                                else
                                        @head = nil
                                        @tail = nil
                                        @size = 0
                                        true
                                end
                        else
                                @tail = @tail[:prev]
                                @tail[:next] = nil
                                @size -= 1
                                true
                        end

		end
	end

end
