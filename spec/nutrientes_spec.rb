require "spec_helper"
require "nutrientes/alimento"

RSpec.describe Nutrientes do
  it "tiene un numero de version" do
    expect(Nutrientes::VERSION).not_to be nil
  end
end

RSpec.describe Alimento do
  it "tiene un nombre" do
    expect{Alimento.new("Pollo")}.not_to raise_error
  end

  it "existe cantidad de proteínas" do
    alimento = Alimento.new("Pollo")
    expect(alimento.instance_variable_defined?(:@proteinas)).to be true
    expect(alimento.respond_to?("proteinas=")).to be true
  end

  it "existe cantidad de glúcidos" do
    alimento = Alimento.new("Pollo")
    expect(alimento.instance_variable_defined?(:@glucidos)).to be true
    expect(alimento.respond_to?("glucidos=")).to be true
  end

  it "existe cantidad de grasas" do
    alimento = Alimento.new("Pollo")
    expect(alimento.instance_variable_defined?(:@grasas)).to be true
    expect(alimento.respond_to?("grasas=")).to be true
  end

  describe "#nombre" do
    context "en el alimento Pollo" do
      it "devuelve Pollo" do
        alimento = Alimento.new("Pollo")
        expect(alimento.nombre).to eq("Pollo")
      end
    end
  end
end
