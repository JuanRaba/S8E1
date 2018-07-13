data = []
File.open('ejer4.data', 'r') do |file|
  data = file.readlines.map do |line|
    line.split(', ').map { |e| e.chomp.gsub(/[NR]/, '0') }
  end
end
puts data.to_s

data.each do |e|
  sum = e.last(e.size - 1).inject (0) { |mem, var| mem + var.to_i }
  puts "#{e[0]} #{sum}"
end

    for i in 1..(data.first.size - 1)
      puts "tienda#{i} #{data.inject(0) { |mem, var| mem + var[i].to_i }}"
    end
    total = 0
    for i in 1..3 do
      total += data.inject(0) { |mem, var| mem + var[i].to_i }
    end
    puts "total=#{total}"

def product_sum(array)
  sum = array.last(array.size - 1).inject (0) { |mem, var| mem + var.to_i }
  "#{array.first} #{sum}"
end

str = 'Producto1'
prod_wanted = str

File.open('ejer4.data', 'r') do |file|
  file.readlines.each do |line|
    prod = line.split(', ').map { |e| e.chomp.gsub(/[NR]/, '0') }
    puts product_sum(prod) if prod.first == prod_wanted
  end
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
data = read_data
def product_sum(array)
  sum = array.last(array.size - 1).inject (0) { |mem, var| mem + var.to_i }
  [array.first, sum]
end
max_wanted = 5
File.open('ejer4.data', 'r') do |file|
  puts "finding prods with stock less than #{max_wanted}"
  file.readlines.each do |line|
    prod = line.split(', ').map { |e| e.chomp.gsub(/[NR]/, '0') }
    psum = product_sum(prod)
    puts psum.to_s if (psum.last.to_i <= max_wanted)
  end
end

NUM_ALMACENES = 3
