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

  def initialize(nombre)
    @nombre = nombre
    @proteinas = 0
    @glucidos = 0
    @grasas = 0
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

  # Compara dos alimentos
  # @param otro [Alimento] el otro alimento con el que comparar
  # @return [Numeric] -1 si otro es mayor, 0 si son iguales o 1 si otro es menor
  def <=>(otro)
    @nombre <=> otro.nombre
  end

end