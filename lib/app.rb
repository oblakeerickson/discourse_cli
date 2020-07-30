module DiscourseCLI
  class App
    def self.main
      command = ARGV[0]

      if command == nil || command == ""
        puts "discourse_cli"
      end

      case command
      when "asdf"
        puts "hello"
      end
    end
  end
end
