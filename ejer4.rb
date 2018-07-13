# Ejercicio tipo prueba
option = 0
NUM_ALMACENES = 3

def product_sum(array)
  sum = array.last(array.size - 1).inject { |mem, var| mem + var.to_i }
  [array.first, sum]
end

def read_data
  data = []
  File.open('ejer4.data', 'r') do |file|
    data = file.readlines.map do |line|
      line.split(', ').map { |e| e.chomp.gsub(/[NR]/, '0') }
    end
  end
  data
end

def when1
  data = read_data
  puts 'permite conocer la cantidad de productos existentes'
  exit = false
  until exit
    puts '
    a) Mostrar la existencia por productos.
    b) Mostrar la existencia total por tienda.
    c) Mostrar la existencia total en todas las tiendas.
    d) Volver al menú principal'
    option = gets.chomp
    case option
    when 'a'
      data.each do |e|
        arr = product_sum(e)
        puts "#{arr.first} #{arr.last} "
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
      exit = true
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
        prod = line.split(', ').map { |e| e.chomp.gsub(/[NR]/, '0') }
        puts product_sum(prod).to_s if prod.first == prod_wanted
      end
    end
  when 3
    data = read_data
    # fixed i makes posible to inject by tienda
    for i in 1..(data.first.size - 1)
      puts "No registrados en almacen #{i}"
      data.each do |prod|
        puts prod.first if prod[i] == '00'
      end
    end
  when 4
    puts 'ingresa valor para conocer productos con menor existencia'
    max_wanted = gets.chomp.to_i
    data = read_data
    File.open('ejer4.data', 'r') do |file|
      puts "Buscando prods con menos stock que #{max_wanted}"
      file.readlines.each do |line|
        prod = line.split(', ').map { |e| e.chomp.gsub(/[NR]/, '0') }
        psum = product_sum(prod)
        puts psum.to_s if psum.last.to_i <= max_wanted
      end
    end
  when 5
    puts 'ingrese nombre del producto a añadir'
    nombre = gets.chomp
    prod = [nombre]
    for i in 1..NUM_ALMACENES
      puts "ingresa stock en almacen #{i}"
      stock = gets.chomp
      # entrada no validada
      prod << stock
    end
    File.open('ejer4.data', 'a') do |file|
      file.puts(prod.join(', '))
      puts "se agrega #{nombre} al archivo"
    end
  else
    puts 'Por favor, ingresa num del 1 al 6!'
  end
end
