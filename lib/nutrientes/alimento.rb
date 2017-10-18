class Alimento
  attr_writer :nombre, :proteinas, :glucidos, :grasas

  def initialize(nombre)
    @nombre = nombre
    @proteinas = 0
    @glucidos = 0
    @grasas = 0
  end

end