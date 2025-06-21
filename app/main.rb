class MyShell
  attr_reader :invalid_command
  attr_accessor :command, :args, :end
  def initialize
    @command, *args = nil
    @invalid_command = true
    @end = false
  end
end

shell = MyShell.new

until shell.end
  $stdout.write("$ ")
  unless shell.invalid_command == false
    shell.command = gets.chomp.split(" ")
    if shell.command != []
      puts "#{shell.command[0]}: command not found"
    else
      shell.end = true
    end
  end
end
