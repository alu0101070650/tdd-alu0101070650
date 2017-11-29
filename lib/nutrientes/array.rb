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