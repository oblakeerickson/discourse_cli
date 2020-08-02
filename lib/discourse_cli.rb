module DiscourseCLI
  class App
    def self.main
      command = ARGV[0]

      if command == nil || command == ""
        puts "Please provide a command."
        puts "discourse_cli <command>"
        puts ""
        puts "Here is a list of commands you can run:"
        puts "  latest"
        puts "  create-user"
      end

      case command
      when "asdf"
        puts "hello"
      when "latest"
        puts "latest"
      end
    end
  end
end
