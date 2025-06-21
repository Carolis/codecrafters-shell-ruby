class MyShell
  def run
    until @end
      $stdout.write("$ ")
      @command, *@args = gets.chomp.split(" ")
      next if @command.nil?
      case @command
      when "exit"
        exit_code = @args.first.to_i || 0
        exit(exit_code)
      else
        puts "#{@command}: command not found" unless @command.empty?
      end
    end
  end
end

shell = MyShell.new
shell.run
