puts 'Crear un método que lea el archivo, lo abra y devuelva la cantidad de
líneas que posee.'

def open_file_and_linecount(filename)
  File.open(filename, 'r') { |file| file.readlines.count }
end

puts open_file_and_linecount('peliculas.txt')
