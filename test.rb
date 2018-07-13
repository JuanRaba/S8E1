  data = []
  File.open('ejer4.data', 'r') do |file|
    data = file.readlines.map do |line|
      line.split(',').map {|e| e.chomp.gsub(/[NR]/, '0')}
    end
  end
  print data

  data.each do |e|
    puts "#{e[0]} #{e[1].to_i + e[2].to_i + e[3].to_i}"
  end

      for i in 1..3 do
        puts "tienda#{i} #{data.inject(0) { |mem, var| mem + var[i].to_i }}"
      end
      total = 0
      for i in 1..3 do
        total += data.inject(0) { |mem, var| mem + var[i].to_i }
      end
      puts "total=#{total}"