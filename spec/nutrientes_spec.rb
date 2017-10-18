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

  describe "#proteinas" do
    context "en el alimento Pollo" do
      it "devuelve 20.6 gramos" do
        alimento = Alimento.new("Pollo")
        alimento.proteinas = 20.6
        expect(alimento.proteinas).to eq(20.6)
      end
    end
  end

  describe "#glucidos" do
    context "en el alimento Yogurt" do
      it "devuelve 4.9 gramos" do
        alimento = Alimento.new("Yogurt")
        alimento.glucidos = 4.9
        expect(alimento.glucidos).to eq(4.9)
      end
    end
  end

  describe "#grasas" do
    context "en el alimento Pollo" do
      it "devuelve 5.6 gramos" do
        alimento = Alimento.new("Pollo")
        alimento.grasas = 5.6
        expect(alimento.grasas).to eq(5.6)
      end
    end
  end

  describe "#to_s" do
    context "en el alimento Pollo" do
      it "devuelve Pollo (proteínas: 20.6, glúcidos: 0, lípidos: 5.6)" do
        alimento = Alimento.new("Pollo")
        alimento.proteinas = 20.6
        alimento.glucidos = 0
        alimento.lipidos = 5.6
        expect(alimento.grasas).to eq("Pollo (proteínas: 20.6, glúcidos: 0, lípidos: 5.6)")
      end
    end
  end
end
