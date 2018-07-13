  data = []
  File.open('ejer4.data', 'r') do |file|
    data = file.readlines.map do |line|
      line.split(',').map {|e| e.chomp.gsub(/[NR]/, '0')}
    end
  end
  print data

  data.each do |e|
    sum = 0
    e.each_with_index do |_val, i|
      sum += e[i].to_i if i != 0
    end
    puts "#{e[0]} #{sum}"
  end

      data.each_with_index do |_tienda, i|
        if i != 0
          puts "tienda#{i} #{data.inject(0) { |mem, var| mem + var[i].to_i }}"
        end
      end
      total = 0
      for i in 1..3 do
        total += data.inject(0) { |mem, var| mem + var[i].to_i }
      end
      puts "total=#{total}"