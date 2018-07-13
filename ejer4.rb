# Ejercicio tipo prueba
option = 0

def when1
  data = []
  File.open('ejer4.data', 'r') do |file|
    data = file.readlines.map do |line|
      line.split(',').map {|e| e.chomp.gsub(/[NR]/, '0')}
    end
  end
  
  puts "permite conocer la cantidad de productos existentes"
  puts 'a) Mostrar la existencia por productos.
b) Mostrar la existencia total por tienda.
c) Mostrar la existencia total en todas las tiendas.
d) Volver al menú principal'
  exit = false
  until exit
    option = gets.chomp
    exit = true
    case option
    when 'a'
      data.each do |e|
        puts "#{e[0]} #{e[1].to_i + e[2].to_i + e[3].to_i}"
      end
    when 'b'
      for i in 1..3 do
        puts "tienda#{i} #{data.inject(0) { |mem, var| mem + var[i].to_i }}"
      end
    when 'c'
      total = 0
      for i in 1..3 do
        total += data.inject(0) { |mem, var| mem + var[i].to_i }
      end
      puts "total=#{total}"
    when 'd'
      puts 'returning to main menu'
    else
      puts 'please abcd?'
      exit = false
    end
  end
end

while option != 6
  puts 'ingresa num del 1 al 6'
  option = gets.chomp.to_i

  case option
  when 1
    when1
  else
    puts 'Por favor, ingresa num del 1 al 6!'
  end
end
