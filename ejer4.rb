# Ejercicio tipo prueba
option = 0

def product_sum(array)
  sum = array.last(array.size - 1).inject (0) { |mem, var| mem + var.to_i }
  "#{e.first} #{sum}"
end

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
        puts product_sum(e)
      end
    when 'b'
      # fixed i makes posible to inject by tienda
      for i in 1..(data.first.size - 1)
        puts "tienda#{i} #{data.inject(0) { |mem, var| mem + var[i].to_i }}"
      end
    when 'c'
      total = 0
      for i in 1..(data.first.size - 1)
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
  when 2
    puts 'ingresa nombre de un producto '
    prod_wanted = gets.chomp
    File.open('ejer4.data', 'r') do |file|
      file.readlines.each do |line|
        prod = line.split(',').map { |e| e.chomp.gsub(/[NR]/, '0') }
        puts product_sum(prod) if prod.first == prod_wanted
      end
    end
  else
    puts 'Por favor, ingresa num del 1 al 6!'
  end
end
