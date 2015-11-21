require 'discourse_api'
require 'yaml'

module DiscourseCli
  class Client
    def self.client
      secrets_file = ENV['HOME'] + '/.discourse_cli'
      secrets = YAML.load_file secrets_file 
      client = DiscourseApi::Client.new(secrets['discourse']['host'])
      client.api_key = secrets['discourse']['api_key'] 
      client.api_username = secrets['discourse']['api_username'] 
      client
    end
  end
end
