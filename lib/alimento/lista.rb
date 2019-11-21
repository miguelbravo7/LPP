module Alimento

	class Lista
	attr_reader :nodo, :head, :tail
		def initialize()
			@nodo = Struct.new(:data, :next, :prev)
			@head = nil
			@tail = nil
		end

		def insertar

		end

		def extraerPrimero

		end

		def extraerUltimo

		end
	end

end
