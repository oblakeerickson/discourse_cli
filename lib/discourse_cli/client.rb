require 'discourse_api'

module DiscourseCLI
  class Client
    attr_accessor :host, :api_username, :api_key

    # change this to a hash, so 1 arg
    def initialize(host, api_username, api_key)
      @host = host
      @api_username = api_username
      @api_key = api_key
      @conn = DiscourseApi::Client.new(@host)
      @conn.api_key = @api_key
      @conn.api_username = @api_username
    end

    def conn
      @conn
    end
  end
end
