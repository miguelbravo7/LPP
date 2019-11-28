require 'alimento'

parametros = Hash.new()
parametros[["prueba", 1, 1, 1, 1, 1]] = [[false, true, true, false, true, true, ["prueba", 1, 1, 1, 1, 1], ["prueba", 1, 1, 1, 1, 1]],
					 [0.005666666666666667, 0.007391304347826087, 176.47058823529412, 135.2941176470588]] 
parametros[["Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0]] = [[false, false, false, true, true, true, ["prueba", 31, 1, 1, 1, 1], ["prueba", 1, 1, 1, 1, 1]],
					  [0.03743333333333334, 0.04882608695652174, 1335.707925200356, 1024.0427426536064]]

parametros.each do |args, resultados|
	RSpec.describe Alimento,"#herencias-#{args[0]}" do
		before(:all) do
                        @instancia = Alimento::Alimento.new(*args)
                end

		context "Pruebas a los modulos incluidos en la clase alimento" do
			it "Comprobacion de existencia de modulos requeridos" do
				expect(Alimento::Alimento.included_modules.include? Comparable).to eq(true)	
			end
		end

		context "Pruebas a los metodos heredados" do
			it "Pruebas al mixin Comparable" do
				@instancia_comparar1 = Alimento::Alimento.new(*resultados[0][-1])
				@instancia_comparar2 = Alimento::Alimento.new(*resultados[0][-2])

				expect(@instancia < @instancia_comparar1).to eq(resultados[0][0])
				expect(@instancia <= @instancia_comparar1).to eq(resultados[0][1])
				expect(@instancia == @instancia_comparar1).to eq(resultados[0][2])
				expect(@instancia > @instancia_comparar1).to eq(resultados[0][3])
				expect(@instancia >= @instancia_comparar1).to eq(resultados[0][4])
				expect(@instancia.between? @instancia_comparar1, @instancia_comparar2).to eq(resultados[0][5])
				expect(@instancia.clamp(@instancia_comparar1, @instancia_comparar2)).to eq(@instancia)
				expect(@instancia_comparar1.clamp(@instancia, @instancia_comparar2)).to eq(@instancia)
				expect(@instancia_comparar2.clamp(@instancia_comparar1, @instancia)).to eq(@instancia)
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
				expect(@instancia.por_ing_recomendada("hombre")).to eq(resultados[1][0])
                        	expect(@instancia.por_ing_recomendada("mujer")).to eq(resultados[1][1])
                	end
                	it "Pruebas del funcionamiento correcto del metodo de impacto ambiental diario" do
                        	expect(@instancia.impacto_ambiental("hombre")).to eq(resultados[1][2])
				expect(@instancia.impacto_ambiental("mujer")).to eq(resultados[1][3])
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
