# Clase que representa una lista doblemente enlazada
class Lista
  include Comparable
  include Enumerable

  def initialize
    @cabeza = nil
    @cola = nil
  end

  # Inserta un elemento en la lista
  # @param elemento [Object] el elemento
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

  # Inserta varios elementos en la lista
  # @param elementos [Array] el array de elementos
  def insertar_a(elementos)
    raise ArgumentError, "elementos no es un array" unless elementos.is_a? Array
    elementos.each {|e| insertar e}
  end

  # Extrae el primer elemento de la lista
  # @return [Object] el primer elemento de la lista o nil si esta vacia
  def extraer_cabeza
    if @cabeza.nil?
      nil
    else
      antigua_cabeza = @cabeza
      siguiente = @cabeza.siguiente
      if siguiente.nil?
        @cabeza = nil
        @cola = nil
      else
        siguiente.previo = nil
        @cabeza = siguiente
      end
      antigua_cabeza.valor
    end
  end

  # Extrae el ultimo elemento de la lista
  # @return [Object] el ultimo elemento de la lista o nil si esta vacia
  def extraer_cola
    if @cola.nil?
      nil
    else
      antigua_cola = @cola
      previo = @cola.previo
      if previo.nil?
        @cabeza = nil
        @cola = nil
      else
        previo.previo = nil
        @cola = previo
      end
      antigua_cola.valor
    end
  end

  # Obtiene el numero de elementos en la lista
  # @return [Numeric] el numero de elementos
  def numero_nodos
    nodo_actual = @cabeza
    numero_nodos = 0
    while nodo_actual != nil do
      nodo_actual = nodo_actual.siguiente
      numero_nodos += 1
    end
    numero_nodos
  end

  # Compara dos listas
  # @param otro [Lista] la otra lista con la que comparar
  # @return [Numeric] -1 si otro es mayor, 0 si son iguales o 1 si otro es menor
  def <=>(otro)
    numero_nodos <=> otro.numero_nodos
  end

  # Itera todos los elementos de la lista
  def each
    nodo_actual = @cabeza
    1.upto(numero_nodos) do
      yield nodo_actual.valor
      nodo_actual = nodo_actual.siguiente
    end
  end
end