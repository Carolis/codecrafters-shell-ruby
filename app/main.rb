class MyShell
  def initialize
    @end = false

    check_builtin = ->(method_name) do
      if @functions.key?(method_name.to_sym)
        puts "#{method_name} is a shell builtin"
      else
        puts "#{method_name}: not found"
      end
    end

    @functions = {
      type: ->(args) { check_builtin.call(args.first) },
      echo: ->(args) { puts args.join(' ') },
      exit: ->(_args) { @end = true }
    }
  end

  def run
    until @end
      print '$ '
      input = gets
      break if input.nil?

      @command, *@args = input.chomp.split(' ')
      next if @command.nil?

      func = @functions[@command.to_sym]

      if func
        func.call(@args)
      else
        puts "#{@command}: command not found"
      end
    end
  end
end

shell = MyShell.new
shell.run
