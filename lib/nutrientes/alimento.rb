# Clase que representa un Alimento
class Alimento
  include Comparable

  # @return [String] el nombre del alimento
  attr_accessor :nombre

  # @return [Numeric] la cantidad de proteinas del alimento
  attr_accessor :proteinas

  # @return [Numeric] la cantidad de glucidos del alimento
  attr_accessor :glucidos

  # @return [Numeric] la cantidad de grasas del alimento
  attr_accessor :grasas

  # @return [Array] las mediciones de glucosa en uno o más individuos cuando consumen el alimento
  attr_accessor :mediciones_alimento

  def initialize(nombre, proteinas, glucidos, grasas)
    @nombre = nombre
    @proteinas = proteinas
    @glucidos = glucidos
    @grasas = grasas
    @mediciones_alimento = []
  end

  # Formatea el alimento
  # @return [String] el alimento formateado
  def to_s
    "#{@nombre} (proteínas: #{@proteinas}, glúcidos: #{@glucidos}, grasas: #{@grasas})"
  end

  # Calcula el valor energetico del alimento
  # @return [Numeric] el valor energetico del alimento
  def valor_energetico
    (@proteinas * 4) + (@glucidos * 4) + (@grasas * 9)
  end

  # Calcula el indice glucemico del alimento
  # @param delta_tiempo [Numeric] el tiempo transcurrido entre cada medición
  # @param mediciones_glucosa [Array] las mediciones de glucosa en uno o más individuos cuando consumen glucosa
  # @return [Numeric] el indice glucemico del alimento
  def indice_glucemico(delta_tiempo, mediciones_glucosa)
    (0..@mediciones_alimento.size - 1).map {|persona| (1..24).map {|i| (((@mediciones_alimento[persona][i] - @mediciones_alimento[persona][0]) + (@mediciones_alimento[persona][i-1] - @mediciones_alimento[persona][0]))/2)*delta_tiempo}.reduce(:+) / (1..24).map {|i| (((mediciones_glucosa[persona][i] - mediciones_glucosa[persona][0]) + (mediciones_glucosa[persona][i-1] - mediciones_glucosa[persona][0]))/2)*delta_tiempo}.reduce(:+) * 100}.reduce(:+) / @mediciones_alimento.size
  end

  # Compara dos alimentos
  # @param otro [Alimento] el otro alimento con el que comparar
  # @return [Numeric] -1 si otro es mayor, 0 si son iguales o 1 si otro es menor
  def <=>(otro)
    valor_energetico <=> otro.valor_energetico
  end

end