# Ejercicio tipo prueba
option = 0

def when1
  data = []
  File.open('ejer4.data', 'r') do |file|
    data = file.readlines.map do |line|
      line.split(',').map { |e| e.chomp.gsub(/[NR]/, '0') }
    end
  end

  puts 'permite conocer la cantidad de productos existentes'
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
        sum = 0
        e.each_with_index do |_val, i|
          sum += e[i].to_i if i != 0
        end
        puts "#{e[0]} #{sum}"
      end
    when 'b'
      data.each_with_index do |_tienda, i|
        if i != 0
          # fixed i makes posible to inject by tienda
          puts "tienda#{i} #{data.inject(0) { |mem, var| mem + var[i].to_i }}"
        end
      end
    when 'c'
      total = 0
      data.each_with_index do |_tienda, i|
        if i != 0
          total += data.inject(0) { |mem, var| mem + var[i].to_i }
        end
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
