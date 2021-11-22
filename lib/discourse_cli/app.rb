require 'yaml'
require 'json'
require 'securerandom'
require 'discourse_api'

module DiscourseCLI

  class App
    def initialize(config, site=nil)
      @config = config
      @default_site = default_site
      site = @default_site if site.nil?
      client = DiscourseCLI::Client.new(
        @config['sites'][site]['host'],
        @config['sites'][site]['api_username'],
        @config['sites'][site]['api_key']
      )
      @client = client.conn
      #@command = DiscourseCLI::Command.new(@client)
      @topic = DiscourseCLI::Topic.new(@client)
    end

    def topic
      @topic
    end

    private

    def default_site
      default = nil
      sites = @config['sites']
      sites.each do |site, value|
        if sites[site].key?('default') && sites[site]['default'] == true
          default = site
        end
      end
      default
    end

  end
end
