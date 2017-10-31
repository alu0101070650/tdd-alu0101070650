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

  def insertar_a(elementos)
    raise ArgumentError, "elementos no es un array" unless elementos.is_a? Array
    elementos.each {|e| insertar e}
  end
end