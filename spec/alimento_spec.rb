require 'alimento'

parametros = Hash.new()
parametros[["prueba", 1, 1, 1, 1, 1]] = [0.003, 0.00391304347826087, 333.3333333333333, 255.55555555555554] 
parametros[["Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0]] = [0.009300000000000001, 0.012130434782608697, 5376.344086021505, 4121.863799283154]

parametros.each do |args, resultados|
	RSpec.describe Alimento,"#herencias-#{args[0]}" do
		context "Pruebas a los modulos incluidos en la clase alimento" do
			it "Comprobacion de existencia de modulos requeridos" do
				expect(Alimento.included_modules.include? Comparable).to eq(true)	
			end
		end
	end

	RSpec.describe Alimento,"#atributos-#{args[0]}" do
		before(:all) do
			@instancia = Alimento::Alimento.new(*args) # uso del splat(*) operator
		end

		it "Tiene un numero de version" do
                  expect(Alimento::VERSION).not_to be nil
                end
	
		context "Pruebas a los atributos" do
			it "Pruebas de existencia de instancia en la clase" do 
				expect(@instancia.instance_variables.include? :@nombre).to eq(true)
       	                	expect(@instancia.instance_variables.include? :@emision_gases).to eq(true)
       	        	        expect(@instancia.instance_variables.include? :@terreno_utilizado).to eq(true)
       	 	                expect(@instancia.instance_variables.include? :@to_kcal).to eq(true)
			end
		end
	end

	RSpec.describe Alimento,"#metodos-#{args[0]}" do
        	before(:all) do
                	@instancia = Alimento::Alimento.new(*args)
        	end


        	context "Pruebas a los metodos" do
                	it "Pruebas de existencia de metodos en la clase" do
                        	expect(@instancia.methods.include? :nombre).to eq(true)
                        	expect(@instancia.methods.include? :emision_gases).to eq(true)
                        	expect(@instancia.methods.include? :terreno_utilizado).to eq(true)
                        	expect(@instancia.methods.include? :to_s).to eq(true)
                        	expect(@instancia.methods.include? :por_ing_recomendada).to eq(true)
                        	expect(@instancia.methods.include? :impacto_ambiental).to eq(true)

				expect(@instancia.methods.include? :<=>).to eq(true)
                	end
			it "Pruebas del funcionamiento correcto del metodo para el calculo de la ingesta recomendada." do
				expect(@instancia.por_ing_recomendada("hombre")).to eq(resultados[0])
                        	expect(@instancia.por_ing_recomendada("mujer")).to eq(resultados[1])
                	end
                	it "Pruebas del funcionamiento correcto del metodo de impacto ambiental diario" do
                        	expect(@instancia.impacto_ambiental("hombre")).to eq(resultados[2])
				expect(@instancia.impacto_ambiental("mujer")).to eq(resultados[3])
                	end

        	end

		context "Pruebas al manejo de excepciones" do
			it "Excepciones por parametros erroneos" do
				expect { @instancia.por_ing_recomendada("adolescente") }.to raise_error(/No existe ingesta recomendada para/)
				expect { @instancia.por_ing_recomendada(1337) }.to raise_error(/Parametro .+ no valido/)
				expect { Alimento::Alimento.new(1, 1, 1, 1, 1, 1) }.to raise_error(/Argumentos erroneos/)
			end
		end
	end
end
