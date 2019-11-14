require 'alimento'

RSpec.describe Alimento, "#atributos" do
	before(:all) do
		@intancia = Alimento.new()
	end

	context "Pruebas a los atributos" do
		it "Pruebas de existencia de instancia en clase" do 
			expect(@instancia.instance_variables.include? :nombre).to eq(true)
                        expect(@instancia.instance_variables.include? :emision_gases).to eq(true)
                        expect(@instancia.instance_variables.include? :terreno_utilizado).to eq(true)
		end
	end
end
