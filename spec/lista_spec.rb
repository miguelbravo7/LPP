require 'alimento'

parametros = Hash.new()
parametros[[]] = [0, 255]

parametros.each do |args, resultados|
        RSpec.describe Lista,"#atributos-#{args[0]}" do
                before(:all) do
                        @instancia = Alimento::Lista.new(*args) # uso del splat(*) operator
                end

                it "Tiene un numero de version" do
                  expect(Alimento::VERSION).not_to be nil
                end

                context "Pruebas a los atributos" do
                        it "Pruebas de existencia de instancia en la clase" do
                                expect(@instancia.instance_variables.include? :@nodo).to eq(true)
                                expect(@instancia.instance_variables.include? :@head).to eq(true)
                                expect(@instancia.instance_variables.include? :@tail).to eq(true)
                                expect(@instancia.nodo.include? :@data).to eq(true)
                                expect(@instancia.nodo.include? :@next).to eq(true)
                                expect(@instancia.nodo.include? :@prev).to eq(true)
                        end
                end
        end

        RSpec.describe Lista,"#metodos-#{args[0]}" do
                before(:all) do
                        @instancia = Alimento::Alimento.new(*args)
                end


                context "Pruebas a los metodos" do
                        it "Pruebas de existencia de metodos en la clase" do
                                expect(@instancia.methods.include? :insertar).to eq(true)
                                expect(@instancia.methods.include? :extraerPrimero).to eq(true)
                                expect(@instancia.methods.include? :extraerUltimo).to eq(true)
                        end

                end

                context "Pruebas al manejo de excepciones" do
                        it "Excepciones por parametros erroneos" do

                        end
                end
        end
end
