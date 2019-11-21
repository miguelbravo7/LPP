module Alimento

	class Lista
		attr_reader :head, :tail, :size
		@@Nodo = Struct.new(:data, :prev, :next)
		
		def initialize()
			@head = nil
			@tail = nil
			@size = 0
		end

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

		end

		def extraerUltimo

		end
	end

end
