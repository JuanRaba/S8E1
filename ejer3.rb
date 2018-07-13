puts 'Crear un método que reciba el archivo peliculas.txt, lo abra y cuente la
cantidad total de palabras. El método debe devolver este valor.'

def open_file_and_wordscount(filename)
  File.open(filename, 'r') { |file| file.read.split(' ').count }
end

puts open_file_and_wordscount('peliculas.txt')

puts 'Crear un método similar para que además reciba -como argumento- un str.
En este caso el método debe contar únicamente las apariciones de ese string en
el archivo.'

def open_file_and_wordcount(filename, str)
  File.open(filename, 'r') { |file| file.read.split(' ').count(str) }
end
str = 'de'
puts "\'#{str}\' aparece #{open_file_and_wordcount('peliculas.txt', str)} veces"
