module Alimento

	class Lista
		# Atributos de instancia
		attr_reader :head, :tail, :size
		# Atributos de clase
		@@Nodo = Struct.new(:data, :prev, :next)
		
		def initialize()
			@head = nil
			@tail = nil
			@size = 0
		end

		def to_s
       			current_node = @head
        		while current_node != nil
            			current_node.to_s
            			current_node = current_node[:next]
        		end

			nil
    		end

		# Getter del atributo de clase Nodo
		def self.Nodo
			@@Nodo
		end

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
