$stdout.write("$ ")

invalid_command = true
command, *args = gets.chomp.split(" ")

unless invalid_command == false
  puts "#{command}: command not found"
end
