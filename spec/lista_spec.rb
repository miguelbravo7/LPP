require 'alimento'

parametros = Hash.new()
parametros[[70.0, 25550.0, 349.0]] = [["Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0], ["Carne de cordero", 18.0, 0.0, 17.0, 20.0, 185.0]]
parametros[[45.2, 16498.0, 65.9]] = [["Huevos", 13.0, 1.1, 11.0, 42.0, 57.0], ["Leche de vaca", 3.3, 4.8, 3.2, 3.2, 8.9]]
parametros[[55.7, 20330.5, 171.1]] = [["Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0], ["Pollo", 20.6, 0.0, 5.6, 5.7, 7.1]]

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
	RSpec.describe Alimento,"-Lista#Expectativa alimentos nº#{arg}" do
                before(:all) do
                        @instancia = Alimento::Lista.new()
			p_alimentos.each do |params|
				@instancia.insertar(Alimento::Alimento.new(*params))
			end
                end

                context "Pruebas a la lista creada con la clase Alientos" do
                        it "Emisiones diarias de gases de efecto invernadero" do
				sum = 0
				@instancia.each do |data|
					sum += data.emision_gases
				end
				expect(sum).to eq(arg[0])
                        end

                        it "Emisiones anuales de gases de efecto invernadero" do
				sum = 0
                                @instancia.each do |data|
					sum += data.emision_gases
                                end
				expect(sum * 365).to eq(arg[1])
                        end

                        it "Uso de terreno en metros cuadrados" do
				sum = 0
                                @instancia.each do |data|
					sum += data.terreno_utilizado
                                end
				expect(sum).to eq(arg[2])
                        end
                end
	end
end
