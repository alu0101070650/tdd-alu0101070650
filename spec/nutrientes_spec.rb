require "spec_helper"
require "nutrientes/alimento"
require "nutrientes/huevo_lacteo_helado"
require "nutrientes/derivado_carne"
require "nutrientes/pescado_marisco"
require "nutrientes/alimento_graso"
require "nutrientes/alimento_rico_carbohidratos"
require "nutrientes/verdura_hortaliza"
require "nutrientes/fruta"
require "nutrientes/bebida"
require "nutrientes/nodo"
require "nutrientes/lista"

RSpec.describe Nutrientes do
  it "tiene un numero de version" do
    expect(Nutrientes::VERSION).not_to be nil
  end
end

RSpec.describe Nodo do
  it "existe un Nodo con sus datos, su siguiente y su previo" do
    nodo = Nodo.new
    expect(nodo.respond_to?("valor=")).to be true
    expect(nodo.respond_to?("siguiente=")).to be true
    expect(nodo.respond_to?("previo=")).to be true
  end
end

RSpec.describe Lista do
  it "existe una Lista con su cabeza y cola" do
    lista = Lista.new
    expect(lista.instance_variable_defined?(:@cabeza)).to be true
    expect(lista.instance_variable_defined?(:@cola)).to be true
  end

  context "en una lista vacia" do
    before :each do
      @lista = Lista.new
    end

    describe "#insertar" do
      it "inserta un elemento en la lista" do
        expect(@lista.respond_to?("insertar")).to be true
      end
    end

    describe "#insertar_a" do
      it "inserta varios elementos en la lista" do
        expect(@lista.respond_to?("insertar_a")).to be true
      end
    end

  end

  context "en una lista con elementos" do
    before :each do
      @lista = Lista.new
      @lista.insertar_a ["Hola", "que", "tal"]
    end

    describe "#extraer_cabeza" do
      it "extrae el primer elemento de la lista" do
        expect(@lista.respond_to?("extraer_cabeza")).to be true
        expect(@lista.extraer_cabeza).to eq("Hola")
        expect(@lista.extraer_cabeza).to eq("que")
      end
    end

    describe "#extraer_cola" do
      it "extrae el último elemento de la lista" do
        expect(@lista.respond_to?("extraer_cola")).to be true
        expect(@lista.extraer_cola).to eq("tal")
        expect(@lista.extraer_cola).to eq("que")
      end
    end

  end
end

RSpec.describe HuevoLacteoHelado do
  context "para una instancia de la clase" do
    before :each do
      @alimento = HuevoLacteoHelado.new("Huevo frito")
    end

    it "su clase es HuevoLacteoHelado" do
      expect(@alimento.class).to eq(HuevoLacteoHelado)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe DerivadoCarne do
  context "para una instancia de la clase" do
    before :each do
      @alimento = DerivadoCarne.new("Cerdo")
    end

    it "su clase es DerivadoCarne" do
      expect(@alimento.class).to eq(DerivadoCarne)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe PescadoMarisco do
  context "para una instancia de la clase" do
    before :each do
      @alimento = PescadoMarisco.new("Bacalao")
    end

    it "su clase es PescadoMarisco" do
      expect(@alimento.class).to eq(PescadoMarisco)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe AlimentoGraso do
  context "para una instancia de la clase" do
    before :each do
      @alimento = AlimentoGraso.new("Chocolate")
    end

    it "su clase es AlimentoGraso" do
      expect(@alimento.class).to eq(AlimentoGraso)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe AlimentoRicoCarbohidratos do
  context "para una instancia de la clase" do
    before :each do
      @alimento = AlimentoRicoCarbohidratos.new("Arroz")
    end

    it "su clase es AlimentoRicoCarbohidratos" do
      expect(@alimento.class).to eq(AlimentoRicoCarbohidratos)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe VerduraHortaliza do
  context "para una instancia de la clase" do
    before :each do
      @alimento = VerduraHortaliza.new("Tomate")
    end

    it "su clase es VerduraHortaliza" do
      expect(@alimento.class).to eq(VerduraHortaliza)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe Fruta do
  context "para una instancia de la clase" do
    before :each do
      @alimento = Fruta.new("Manzana")
    end

    it "su clase es Fruta" do
      expect(@alimento.class).to eq(Fruta)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe Bebida do
  context "para una instancia de la clase" do
    before :each do
      @alimento = Bebida.new("Zumo naranja")
    end

    it "su clase es Bebida" do
      expect(@alimento.class).to eq(Bebida)
    end

    it "es de tipo Alimento" do
      expect(@alimento.respond_to?("valor_energetico")).to be true
      expect(@alimento.respond_to?("proteinas")).to be true
      expect(@alimento.respond_to?("glucidos")).to be true
      expect(@alimento.respond_to?("grasas")).to be true
      expect(@alimento.respond_to?("nombre")).to be true
      expect(@alimento.respond_to?("proteinas=")).to be true
      expect(@alimento.respond_to?("glucidos=")).to be true
      expect(@alimento.respond_to?("grasas=")).to be true
    end

    it "es un Alimento" do
      expect(@alimento.is_a?(Alimento)).to be true
    end
  end
end

RSpec.describe Alimento do
  before :each do
    @tolerancia = 0.1
  end

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
      it "devuelve Pollo (proteínas: 20.6, glúcidos: 0, grasas: 5.6)" do
        alimento = Alimento.new("Pollo")
        alimento.proteinas = 20.6
        alimento.glucidos = 0
        alimento.grasas = 5.6
        expect(alimento.to_s).to eq("Pollo (proteínas: 20.6, glúcidos: 0, grasas: 5.6)")
      end
    end
  end

  describe "#valor_energetico" do
    context "en el alimento Pollo" do
      it "devuelve 132.8 Kcal" do
        alimento = Alimento.new("Pollo")
        alimento.proteinas = 20.6
        alimento.glucidos = 0
        alimento.grasas = 5.6
        expect(alimento.valor_energetico).to be_within(@tolerancia).of(132.8)
      end
    end
    context "en el alimento Huevo frito" do
      it "devuelve 231.9 Kcal" do
        alimento = Alimento.new("Huevo frito")
        alimento.proteinas = 14.1
        alimento.glucidos = 0
        alimento.grasas = 19.5
        expect(alimento.valor_energetico).to be_within(@tolerancia).of(231.9)
      end
    end
    context "en el alimento Leche vaca" do
      it "devuelve 61.2 Kcal" do
        alimento = Alimento.new("Leche vaca")
        alimento.proteinas = 3.3
        alimento.glucidos = 4.8
        alimento.grasas = 3.2
        expect(alimento.valor_energetico).to be_within(@tolerancia).of(61.2)
      end
    end
    context "en el alimento Arroz" do
      it "devuelve 343.4 Kcal" do
        alimento = Alimento.new("Arroz")
        alimento.proteinas = 6.8
        alimento.glucidos = 77.7
        alimento.grasas = 0.6
        expect(alimento.valor_energetico).to be_within(@tolerancia).of(343.4)
      end
    end
    context "en el alimento Aceite de oliva" do
      it "devuelve 897.2 Kcal" do
        alimento = Alimento.new("Aceite de oliva")
        alimento.proteinas = 0
        alimento.glucidos = 0.2
        alimento.grasas = 99.6
        expect(alimento.valor_energetico).to be_within(@tolerancia).of(897.2)
      end
    end
  end
end
