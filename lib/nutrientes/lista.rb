class Lista

  def initialize
    @cabeza = nil
    @cola = nil
  end

  def insertar(elemento)
    nodo = Nodo.new
    nodo.valor = elemento
    if @cabeza.nil?
      @cabeza = nodo
      @cola = nodo
    else
      @cola.siguiente = nodo
      nodo.previo = @cola
      @cola = nodo
    end
  end
end