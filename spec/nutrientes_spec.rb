require "spec_helper"

RSpec.describe Nutrientes do
  before :each do
    @tolerancia = 0.1
    @alimentos = [HuevoLacteoHelado.new("Huevo frito", 14.1, 0, 19.5),
                  HuevoLacteoHelado.new("Leche vaca", 3.3, 4.8, 3.2),
                  HuevoLacteoHelado.new("Yogurt", 3.8, 4.9, 3.8),
                  DerivadoCarne.new("Cerdo", 21.5, 0, 6.3),
                  DerivadoCarne.new("Ternera", 21.1, 0, 3.1),
                  DerivadoCarne.new("Pollo", 20.6, 0, 5.6),
                  PescadoMarisco.new("Bacalao", 17.7, 0, 0.4),
                  PescadoMarisco.new("Atún", 21.5, 0, 15.5),
                  PescadoMarisco.new("Salmón", 19.9, 0, 13.6),
                  AlimentoGraso.new("Aceite de oliva", 0, 0.2, 99.6),
                  AlimentoGraso.new("Mantequilla", 0.7, 0, 83.2),
                  AlimentoGraso.new("Chocolate", 5.3, 47, 30),
                  AlimentoRicoCarbohidratos.new("Azúcar", 0, 99.8, 0),
                  AlimentoRicoCarbohidratos.new("Arroz", 6.8, 77.7, 0.6),
                  AlimentoRicoCarbohidratos.new("Lentejas", 23.5, 52.0, 1.4),
                  AlimentoRicoCarbohidratos.new("Papas", 2, 15.4, 0.1),
                  VerduraHortaliza.new("Tomate", 1, 3.5, 0.2),
                  VerduraHortaliza.new("Cebolla", 1.3, 5.8, 0.3),
                  VerduraHortaliza.new("Calabaza", 1.1, 4.8, 0.1),
                  Fruta.new("Manzana", 0.3, 12.4, 0.4),
                  Fruta.new("Plátanos", 1.2, 21.4, 0.2),
                  Fruta.new("Pera", 0.5, 12.7, 0.3)]
  end

  it "tiene un numero de version" do
    expect(Nutrientes::VERSION).not_to be nil
  end

  describe Array do

    class Array
      def sort_for
        array_ordenado=self.map(&:clone)
        n = array_ordenado.length
        loop do
          cambiado = false
          for i in 0..n-2 do
            if array_ordenado[i] > array_ordenado[i+1]
              array_ordenado[i], array_ordenado[i+1] = array_ordenado[i+1], array_ordenado[i]
              cambiado = true
            end
          end
          break unless cambiado
        end
        array_ordenado
      end

      def sort_each
        array_ordenado=self.map(&:clone)
        (0..(self.size-1)*(self.size-1)).each {(0..self.size-2).each {|i| array_ordenado[i], array_ordenado[i+1]=array_ordenado[i+1], array_ordenado[i] if 1==(array_ordenado[i]<=>array_ordenado[i+1])}}
        array_ordenado
      end
    end

    describe "#sort_for" do
      it "ordena elementos del array usando for" do
        alimentos_ordenados = @alimentos.sort_for
        expect(alimentos_ordenados == @alimentos.sort).to be true
      end
    end

    describe "#sort_each" do
      it "ordena elementos del array usando each" do
        alimentos_ordenados = @alimentos.sort_each
        expect(alimentos_ordenados == @alimentos.sort).to be true
      end
    end

    it "comparación rendimiento funciones de ordenación" do
      Benchmark.bmbm do |x|
        x.report("sort_for") {@alimentos.sort_for}
        x.report("sort_each") {@alimentos.sort_each}
        x.report("sort") {@alimentos.sort}
      end
    end

  end

  describe Nodo do
    it "existe un Nodo con sus datos, su siguiente y su previo" do
      nodo = Nodo.new
      expect(nodo.respond_to?("valor=")).to be true
      expect(nodo.respond_to?("siguiente=")).to be true
      expect(nodo.respond_to?("previo=")).to be true
    end
  end

  describe Lista do
    it "existe una Lista con su cabeza y cola" do
      lista = Lista.new
      expect(lista.instance_variable_defined?(:@cabeza)).to be true
      expect(lista.instance_variable_defined?(:@cola)).to be true
    end

    it "es enumerable" do
      lista = Lista.new
      expect(lista.respond_to?("each")).to be true
      expect(Lista < Enumerable).to be true
      lista.insertar_a(["Hola", "que", "tal"])
      a = []
      lista.each {|x| a << x}
      expect(a == ["Hola", "que", "tal"]).to be true
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

  describe HuevoLacteoHelado do
    context "para una instancia de la clase" do
      before :each do
        @alimento = HuevoLacteoHelado.new("Huevo frito", 0, 0, 0)
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
    context "para el Huevo frito" do
      describe "#valor_energetico" do
        it "devuelve 231.9 Kcal" do
          alimento = HuevoLacteoHelado.new("Huevo frito", 14.1, 0, 19.5)
          expect(alimento.valor_energetico).to be_within(@tolerancia).of(231.9)
        end
      end
    end
  end

  describe DerivadoCarne do
    context "para una instancia de la clase" do
      before :each do
        @alimento = DerivadoCarne.new("Cerdo", 0, 0, 0)
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
      context "para el Cerdo" do
        describe "#valor_energetico" do
          it "devuelve 142.7 Kcal" do
            alimento = DerivadoCarne.new("Cerdo", 21.5, 0, 6.3)
            expect(alimento.valor_energetico).to be_within(@tolerancia).of(142.7)
          end
        end
      end
    end
  end

  describe PescadoMarisco do
    context "para una instancia de la clase" do
      before :each do
        @alimento = PescadoMarisco.new("Bacalao", 0, 0, 0)
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
      context "para el Bacalao" do
        describe "#valor_energetico" do
          it "devuelve 74.4 Kcal" do
            alimento = PescadoMarisco.new("Bacalao", 17.7, 0, 0.4)
            expect(alimento.valor_energetico).to be_within(@tolerancia).of(74.3)
          end
        end
      end
    end
  end

  describe AlimentoGraso do
    context "para una instancia de la clase" do
      before :each do
        @alimento = AlimentoGraso.new("Chocolate", 0, 0, 0)
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
      context "para el Aceite de oliva" do
        describe "#valor_energetico" do
          it "devuelve 897.2 Kcal" do
            alimento = AlimentoGraso.new("Aceite de oliva", 0, 0.2, 99.6)
            expect(alimento.valor_energetico).to be_within(@tolerancia).of(897.2)
          end
        end
      end
    end
  end

  describe AlimentoRicoCarbohidratos do
    context "para una instancia de la clase" do
      before :each do
        @alimento = AlimentoRicoCarbohidratos.new("Arroz", 0, 0, 0)
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
      context "para el Arroz" do
        describe "#valor_energetico" do
          it "devuelve 343.4 Kcal" do
            alimento = AlimentoRicoCarbohidratos.new("Arroz", 6.8, 77.7, 0.6)
            expect(alimento.valor_energetico).to be_within(@tolerancia).of(343.4)
          end
        end
      end
    end
  end

  describe VerduraHortaliza do
    context "para una instancia de la clase" do
      before :each do
        @alimento = VerduraHortaliza.new("Tomate", 0, 0, 0)
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
      context "para el Tomate" do
        describe "#valor_energetico" do
          it "devuelve 19.8 Kcal" do
            alimento = VerduraHortaliza.new("Tomate", 1, 3.5, 0.2)
            expect(alimento.valor_energetico).to be_within(@tolerancia).of(19.8)
          end
        end
      end
    end
  end

  describe Fruta do
    context "para una instancia de la clase" do
      before :each do
        @alimento = Fruta.new("Manzana", 0, 0, 0)
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
      context "para la Manzana" do
        describe "#valor_energetico" do
          it "devuelve 54.4 Kcal" do
            alimento = Fruta.new("Manzana", 0.3, 12.4, 0.4)
            expect(alimento.valor_energetico).to be_within(@tolerancia).of(54.4)
          end
        end
      end
    end
  end

  describe Bebida do
    context "para una instancia de la clase" do
      before :each do
        @alimento = Bebida.new("Zumo naranja", 0, 0, 0)
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

  describe Alimento do

    it "es comparable" do
      alimento = Alimento.new("Pollo", 0, 0, 0)
      expect(alimento.respond_to?("<=>")).to be true
      expect(Alimento < Comparable).to be true
      expect(Alimento.new("Leche", 10, 2, 3) == Alimento.new("Leche", 10, 2, 3)).to be true
      expect(Alimento.new("Leche", 3, 1, 2) == Alimento.new("Atún", 3, 2, 1)).to be false
      expect(Alimento.new("Pan", 10, 20, 0) < Alimento.new("Cereales", 10, 5, 3)).to be false
      expect(Alimento.new("Pan", 0, 5, 20) > Alimento.new("Cereales", 10, 0, 0)).to be true
    end

    context "para una instancia cualquiera" do
      it "tiene un nombre" do
        expect {Alimento.new("Pollo", 0, 0, 0)}.not_to raise_error
      end

      it "existe cantidad de proteínas" do
        alimento = Alimento.new("Pollo", 0, 0, 0)
        expect(alimento.instance_variable_defined?(:@proteinas)).to be true
        expect(alimento.respond_to?("proteinas=")).to be true
      end

      it "existe cantidad de glúcidos" do
        alimento = Alimento.new("Pollo", 0, 0, 0)
        expect(alimento.instance_variable_defined?(:@glucidos)).to be true
        expect(alimento.respond_to?("glucidos=")).to be true
      end

      it "existe cantidad de grasas" do
        alimento = Alimento.new("Pollo", 0, 0, 0)
        expect(alimento.instance_variable_defined?(:@grasas)).to be true
        expect(alimento.respond_to?("grasas=")).to be true
      end
    end

    context "en el alimento Pollo" do
      describe "#nombre" do
        it "devuelve Pollo" do
          alimento = Alimento.new("Pollo", 0, 0, 0)
          expect(alimento.nombre).to eq("Pollo")
        end
      end

      describe "#proteinas" do
        it "devuelve 20.6 gramos" do
          alimento = Alimento.new("Pollo", 0, 0, 0)
          alimento.proteinas = 20.6
          expect(alimento.proteinas).to eq(20.6)
        end
      end

      describe "#glucidos" do
        it "devuelve 0.0 gramos" do
          alimento = Alimento.new("Pollo", 0, 0, 0)
          alimento.glucidos = 0.0
          expect(alimento.glucidos).to eq(0.0)
        end
      end

      describe "#grasas" do
        it "devuelve 5.6 gramos" do
          alimento = Alimento.new("Pollo", 0, 0, 0)
          alimento.grasas = 5.6
          expect(alimento.grasas).to eq(5.6)
        end
      end

      describe "#to_s" do
        it "devuelve Pollo (proteínas: 20.6, glúcidos: 0, grasas: 5.6)" do
          alimento = Alimento.new("Pollo", 20.6, 0, 5.6)
          expect(alimento.to_s).to eq("Pollo (proteínas: 20.6, glúcidos: 0, grasas: 5.6)")
        end
      end

      describe "#valor_energetico" do
        it "devuelve 132.8 Kcal" do
          alimento = Alimento.new("Pollo", 20.6, 0, 5.6)
          expect(alimento.valor_energetico).to be_within(@tolerancia).of(132.8)
        end
      end
    end


    context "en el alimento Huevo frito" do
      describe "#valor_energetico" do
        it "devuelve 231.9 Kcal" do
          alimento = Alimento.new("Huevo frito", 14.1, 0, 19.5)
          expect(alimento.valor_energetico).to be_within(@tolerancia).of(231.9)
        end
      end
    end
    context "en el alimento Leche vaca" do
      describe "#valor_energetico" do
        it "devuelve 61.2 Kcal" do
          alimento = Alimento.new("Leche vaca", 3.3, 4.8, 3.2)
          expect(alimento.valor_energetico).to be_within(@tolerancia).of(61.2)
        end
      end
    end
    context "en el alimento Arroz" do
      describe "#valor_energetico" do
        it "devuelve 343.4 Kcal" do
          alimento = Alimento.new("Arroz", 6.8, 77.7, 0.6)
          expect(alimento.valor_energetico).to be_within(@tolerancia).of(343.4)
        end
      end
    end
    context "en el alimento Aceite de oliva" do
      describe "#valor_energetico" do
        it "devuelve 897.2 Kcal" do
          alimento = Alimento.new("Aceite de oliva", 0, 0.2, 99.6)
          expect(alimento.valor_energetico).to be_within(@tolerancia).of(897.2)
        end
      end
    end

    describe "#indice_glucemico" do
      before :each do
        @tolerancia = 1
        @glucosa_individuos = [[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1],
                               [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]]
        @delta_tiempo = 5
      end

      context "en el alimento chocolate" do
        it "devuelve 13" do
          alimento = Alimento.new("Chocolate", 0, 0, 0)
          mediciones_alimento = [[6.5, 6.5, 6.7, 6.5, 6.5, 6.8, 6.7, 6.2, 6.5, 7.2, 6.9, 7.0, 6.3, 6.2, 6.1, 5.9, 5.8, 6.1, 6.7, 6.7, 6.6, 6.7, 6.9, 7.2, 7.1],
                                 [4.6, 4.6, 4.7, 4.7, 4.8, 4.7, 4.8, 4.8, 4.6, 4.4, 4.7, 4.7, 4.8, 4.7, 5.2, 5.9, 5.9, 5.7, 5.4, 5.3, 5.1, 4.8, 4.8, 4.9, 5.9]]
          alimento.mediciones_alimento=mediciones_alimento
          expect(alimento.indice_glucemico(@delta_tiempo, @glucosa_individuos)).to be_within(@tolerancia).of(13)
        end
      end

      context "en el alimento yogurt" do
        it "devuelve 41" do
          alimento = Alimento.new("Yogurt", 0, 0, 0)
          mediciones_alimento = [[6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4],
                                 [4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]]
          alimento.mediciones_alimento=mediciones_alimento
          expect(alimento.indice_glucemico(@delta_tiempo, @glucosa_individuos)).to be_within(@tolerancia).of(41)
        end
      end

      context "en el alimento compota de manzana" do
        it "devuelve 54" do
          alimento = Alimento.new("Compota de manzana", 0, 0, 0)
          mediciones_alimento = [[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9],
                                 [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]]
          alimento.mediciones_alimento=mediciones_alimento
          expect(alimento.indice_glucemico(@delta_tiempo, @glucosa_individuos)).to be_within(@tolerancia).of(54)
        end
      end
    end
  end
end
