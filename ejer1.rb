puts 'Crear un método que reciba dos strings, este método creará un archivo
index.html y pondrá como párrafo cada uno de los strings recibidos.'

def metodo(str1, str2)
  File.open('index1.1.html', 'w') do |file|
    file.puts("<p>#{str1}</p>")
    file.puts("<p>#{str2}</p>")
  end
end

metodo('hola', 'paco')

puts 'Crear un método similar al anterior, que además pueda recibir un arreglo.
Si el arreglo no está vacío, agregar debajo de los párrafos una lista ordenada
con cada uno de los elementos.'

def metodo_similar(str1, str2, arreglo)
  File.open('index1.2.html', 'w') do |file|
    file.puts("<p>#{str1}</p>")
    file.puts("<p>#{str2}</p>")
    unless arreglo.empty?
      file.puts('<ol>')
      arreglo.each { |e| file.puts("<li>#{e}</li>") }
      file.puts('</ol>')
    end
  end
end

metodo_similar('hola', 'paco', [2, 3, 1])

puts 'Crear un tercer método que además pueda recibir un color.
Agregar color de fondo a los párrafos.'

def metodo_tercer(str1, str2, arreglo, color)
  File.open('index1.3.html', 'w') do |file|
    file.puts("<p style=\"color:#{color}\">#{str1}</p>")
    file.puts("<p style=\"color:#{color}\">#{str2}</p>")
    unless arreglo.empty?
      file.puts('<ol>')
      arreglo.each { |e| file.puts("<li>#{e}</li>") }
      file.puts('</ol>')
    end
  end
end

puts 'El retorno de los métodos debe devolver nil.'
puts metodo_tercer('hola', 'paco', [2, 3, 1], 'red').nil?
