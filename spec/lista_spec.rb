require 'alimento'

parametros = Hash.new()
parametros[[["Carne de vaca", "Carne de cordero"], [70.0, 25550.0, 349.0]]] = [Alimento::Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0), Alimento::Alimento.new("Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0)]
parametros[[["Huevos", "Leche de vaca"], [45.2, 16498.0, 65.9]]] = [Alimento::Alimento.new("Huevos", 13.0, 1.1, 11.0, 42.0, 57.0), Alimento::Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)]
parametros[[["Carne de vaca", "Pollo"], [55.7, 20330.5, 171.1]]] = [Alimento::Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0), Alimento::Alimento.new("Pollo", 20.6, 0.0, 5.6, 5.7, 7.1)]

parametros_plato = Hash.new()
tmp_lista = Alimento::Lista.new()
tmp_lista.insertar([Alimento::Alimento.new("Queso", 25.0, 1.3, 33.0, 11.0, 41.0), Alimento::Alimento.new("Pollo", 20.6, 0.0,5.6, 5.7, 7.1)])
tmp_lista2 = Alimento::Lista.new()
tmp_lista2.insertar([Alimento::Alimento.new("Huevos", 13.0, 1.1, 11.0, 42.0, 57.0), Alimento::Alimento.new("Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9)])
parametros_plato[[["Bocadillo", "Merengue"]]] = [Plato::Plato.new("Bocadillo", tmp_lista), Plato::PlatoExtendido.new("Merengue", tmp_lista2)]

[parametros, parametros_plato].each do |hash|
	hash.each do |arg, p_alimentos|
		RSpec.describe Alimento,"-Lista#herencias" do
			before(:each) do
       		@instancia = Alimento::Lista.new()
       		p_alimentos.each do |params|
             			@instancia.insertar(params)
      		end
  		end

			context "Pruebas a los modulos incluidos en la clase Lista" do
      		it "Comprobacion de existencia de modulos requeridos" do
		        expect(Alimento::Lista.included_modules.include? Enumerable).to eq(true)
	        end
			end

			context "Pruebas a los metodos heredados" do
				it "Pruebas al mixin Enumerable" do
					expect(@instancia.max.nombre).to eq(arg[0][0])
					expect(@instancia.min.nombre).to eq(arg[0][1])

					expect(@instancia.select{|obj| obj.nombre == arg[0][1]}[0].nombre).to eq(arg[0][1])

					expect(@instancia.sort{|obja, objb| obja <=> objb}[0].nombre).to eq(arg[0][1])

					@instancia.collect{|obj| obj.nombre += " envasado"}
					expect(@instancia.max.nombre).to eq(arg[0][0] + " envasado")
				end
			end
		end
	end
end

RSpec.describe Alimento,"-Lista#atributos" do
	before(:all) do
		@instancia = Alimento::Lista.new()
	end

	it "Tiene un numero de version" do
		expect(Alimento::VERSION).not_to be nil
	end

	context "Pruebas a los atributos" do
		it "Pruebas de existencia de instancia en la clase" do
			expect(Alimento::Lista.class_variables.include? :@@Nodo).to eq(true)
			expect(@instancia.instance_variables.include? :@head).to eq(true)
			expect(@instancia.instance_variables.include? :@tail).to eq(true)
			expect(Alimento::Lista.Nodo.members.include? :data).to eq(true)
			expect(Alimento::Lista.Nodo.members.include? :next).to eq(true)
			expect(Alimento::Lista.Nodo.members.include? :prev).to eq(true)
		end
	end
end

RSpec.describe Alimento,"-Lista#metodos" do
	before(:each) do
		@instancia = Alimento::Lista.new()
	end


	context "Pruebas a los metodos" do
		it "Pruebas de existencia de metodos en la clase" do
			expect(@instancia.methods.include? :insertar).to eq(true)
			expect(@instancia.methods.include? :extraerPrimero).to eq(true)
			expect(@instancia.methods.include? :extraerUltimo).to eq(true)
		end

		it "Puebas al funcionamiento del metodo insertar" do
			expect(@instancia.insertar(1337)).to eq(true)
			expect(@instancia.size).to eq(1)
			expect(@instancia.insertar([1337, 1337])).to eq(true)
			expect(@instancia.size).to eq(3)
		end


		it "Puebas al funcionamiento del metodo extraerPrimero" do
			expect(@instancia.extraerPrimero()).to eq(false)
			@instancia.insertar([1337, 1337])
			expect(@instancia.size).to eq(2)
			expect(@instancia.extraerPrimero()).to eq(true)
			expect(@instancia.size).to eq(1)
		end

		it "Puebas al funcionamiento del metodo extraerUltimo" do
			expect(@instancia.extraerUltimo()).to eq(false)
			@instancia.insertar([1337, 1337])
			expect(@instancia.size).to eq(2)
			expect(@instancia.extraerUltimo()).to eq(true)
			expect(@instancia.size).to eq(1)
		end
	end

end

parametros.each do |arg, p_alimentos|
	RSpec.describe Alimento,"-Lista#Expectativa lista Alimentos" do
    before(:all) do
      @instancia = Alimento::Lista.new()
			p_alimentos.each do |params|
				@instancia.insertar(params)
			end
      end

	  context "Pruebas a la lista creada con la clase Alientos" do
      it "Emisiones diarias de gases de efecto invernadero" do
				sum = 0
				@instancia.each do |data|
					sum += data.emision_gases
				end
				expect(sum).to eq(arg[1][0])
      end

      it "Emisiones anuales de gases de efecto invernadero" do
				sum = 0
        @instancia.each do |data|
					sum += data.emision_gases
        end
				expect(sum * 365).to eq(arg[1][1])
      end

	    it "Uso de terreno en metros cuadrados" do
				sum = 0
        @instancia.each do |data|
					sum += data.terreno_utilizado
        end
				expect(sum).to eq(arg[1][2])
      end
    end
	end
end
