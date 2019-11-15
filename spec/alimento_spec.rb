require 'alimento'

parametros = Hash.new()
parametros[["a", 1, 2, 7, 3, 4]] = [0.021, 0.027391304347826086, 142.85714285714283, 109.52380952380955] 

parametros.each do |args, resultados|
	RSpec.describe Alimento,"#atributos" do
		before(:all) do
			@instancia = Alimento.new(*args) # uso del splat(*) operator
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

	RSpec.describe Alimento,"#metodos" do
        	before(:all) do
                	@instancia = Alimento.new(*args)
        	end


        	context "Pruebas a los metodos" do
                	it "Pruebas de existencia de metodos en la clase" do
                        	expect(@instancia.methods.include? :nombre).to eq(true)
                        	expect(@instancia.methods.include? :emision_gases).to eq(true)
                        	expect(@instancia.methods.include? :terreno_utilizado).to eq(true)
                        	expect(@instancia.methods.include? :to_s).to eq(true)
                        	expect(@instancia.methods.include? :por_ing_recomendada).to eq(true)
                        	expect(@instancia.methods.include? :impacto_ambiental).to eq(true)
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
			end
		end
	end
end
