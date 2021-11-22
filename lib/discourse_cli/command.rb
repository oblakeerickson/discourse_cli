module DiscourseCLI

  class Command
    def initialize(client)
      @client = client
    end

    def client
      @client
    end
  end
end
