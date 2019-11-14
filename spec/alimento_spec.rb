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
		end
	end

        context "Pruebas a los metodos" do
                it "Pruebas de existencia de metodos en la clase" do
                        expect(@instancia.methods.include? :nombre).to eq(true)
                        expect(@instancia.methods.include? :emision_gases).to eq(true)
                        expect(@instancia.methods.include? :terreno_utilizado).to eq(true)
                end
        end

end
