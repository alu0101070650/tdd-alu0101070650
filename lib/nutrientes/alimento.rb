class Alimento
  include Comparable
  attr_accessor :nombre, :proteinas, :glucidos, :grasas

  def initialize(nombre)
    @nombre = nombre
    @proteinas = 0
    @glucidos = 0
    @grasas = 0
  end

  def to_s
    "#{@nombre} (proteínas: #{@proteinas}, glúcidos: #{@glucidos}, grasas: #{@grasas})"
  end

  def valor_energetico
    (@proteinas * 4) + (@glucidos * 4) + (@grasas * 9)
  end

  def <=>(otro)
    @nombre <=> otro.nombre
  end

end