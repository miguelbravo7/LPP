require 'alimento'

RSpec.describe Alimento do
	before(:all) do
		@instancia = Alimento.new()
	end

	context "Pruebas a los atributos" do
		it "Pruebas de existencia de instancia en la clase" do 
			expect(@instancia.instance_variables.include? :@nombre).to eq(true)
                        expect(@instancia.instance_variables.include? :@emision_gases).to eq(true)
                        expect(@instancia.instance_variables.include? :@terreno_utilizado).to eq(true)
                        expect(@instancia.instance_variables.include? :@to_kcal).to eq(true)
		end
	end

        context "Pruebas a los metodos" do
                it "Pruebas de existencia de metodos en la clase" do
                        expect(@instancia.methods.include? :nombre).to eq(true)
                        expect(@instancia.methods.include? :emision_gases).to eq(true)
                        expect(@instancia.methods.include? :terreno_utilizado).to eq(true)
                        expect(@instancia.methods.include? :to_s).to eq(true)
                        expect(@instancia.methods.include? :por_ing_recomendada).to eq(true)
                end
                it "Pruebas del funcionamiento correcto de los metodos en la clase" do
			expect(@instancia.por_ing_recomendada("adolescente")).to eq(0.0)
			expect(@instancia.por_ing_recomendada("hombre")).to eq(0.021)
                        expect(@instancia.por_ing_recomendada("mujer")).to eq(0.027391304347826086)
                end

        end

end
