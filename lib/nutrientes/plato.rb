class Plato
  attr_accessor :vegetales, :frutas, :cereales, :proteinas, :aceites

  def initialize(nombre, &bloque)

    @alimentos = [HuevoLacteoHelado.new("Huevo", 14.1, 0, 19.5),
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
                  Fruta.new("Plátano", 1.2, 21.4, 0.2),
                  Fruta.new("Pera", 0.5, 12.7, 0.3)]
    @equivalencias = {"pieza pequeña" => 30, "piezas pequeñas" => 30, "taza" => 100,
                      "tazas" => 100, "cucharón" => 50, "pieza" => 60, "piezas" => 60,
                      "cucharada" => 10, "cucharadas" => 10}
    @nombre = nombre
    @alimentos_plato = {:vegetales => [], :frutas => [], :cereales => [], :proteinas => [], :aceites => []}

    if block_given?
      if bloque.arity == 1
        yield self
      else
        instance_eval(&bloque)
      end
    end

  end

  def vegetal(nombre, cantidad = {})
    alimento_parseado = parsear_alimento(nombre, cantidad)
    @alimentos_plato[:vegetales] << alimento_parseado if alimento_parseado.length > 0
  end

  def fruta(nombre, cantidad = {})
    alimento_parseado = parsear_alimento(nombre, cantidad)
    @alimentos_plato[:frutas] << alimento_parseado if alimento_parseado.length > 0
  end

  def cereal(nombre, cantidad = {})
    alimento_parseado = parsear_alimento(nombre, cantidad)
    @alimentos_plato[:cereales] << alimento_parseado if alimento_parseado.length > 0
  end

  def proteina(nombre, cantidad = {})
    alimento_parseado = parsear_alimento(nombre, cantidad)
    @alimentos_plato[:proteinas] << alimento_parseado if alimento_parseado.length > 0
  end

  def aceite(nombre, cantidad = {})
    alimento_parseado = parsear_alimento(nombre, cantidad)
    @alimentos_plato[:aceites] << alimento_parseado if alimento_parseado.length > 0
  end

  def to_s
    salida = @nombre
    salida << "\n#{'=' * @nombre.size}\n"
    salida << "Composición nutricional:\n"
    salida << formatear_texto(" ", 17)
    salida << formatear_texto("glúcidos", 12)
    salida << formatear_texto("proteínas", 12)
    salida << formatear_texto("lípidos", 12)
    salida << "valor energético\n"
    total = 0
    @alimentos_plato.each do |tipo, lista|
      lista.each do |alimento|
        salida << formatear_texto(alimento[:alimento].nombre, 17)
        salida << formatear_texto(alimento[:alimento].glucidos.to_s, 12)
        salida << formatear_texto(alimento[:alimento].proteinas.to_s, 12)
        salida << formatear_texto(alimento[:alimento].grasas.to_s, 12)
        valor_energetico = (alimento[:alimento].valor_energetico*alimento[:gramos]/10).round(2)
        total += valor_energetico
        salida << valor_energetico.to_s
        salida << "\n"
      end
    end
    salida << formatear_texto("Valor energético total", 53)
    salida << total.round(2).to_s
    salida
  end

  def formatear_texto(texto, longitud)
    espacios = longitud - texto.length
    if espacios < 0
      espacios = 0
    end
    texto + (' ' * espacios)
  end

  def parsear_alimento(nombre, cantidad)
    alimento_parseado = {}
    @alimentos.each do |alimento|
      if alimento.nombre == nombre
        if cantidad[:porcion] && !cantidad[:gramos]
          begin
            multiplicador = cantidad[:porcion].split(' ').first.to_r.to_f
            cantidad[:gramos] = multiplicador * @equivalencias[cantidad[:porcion].split(' ', 2).last]
          rescue
            cantidad[:gramos] = 10
          end
        end
        alimento_parseado = {:alimento => alimento, :gramos => cantidad[:gramos]}
      end
    end
    alimento_parseado
  end

  private :formatear_texto, :parsear_alimento

end