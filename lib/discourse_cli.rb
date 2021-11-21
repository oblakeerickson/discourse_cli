require 'yaml'
require 'json'
require 'securerandom'
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

  # There shouldn't be in puts statements here, they should be in an output class
  class App
    def initialize(config)
      site = 'desktop'
      @config = config
      client = DiscourseCLI::Client.new(
        @config[site]['host'],
        @config[site]['api_username'],
        @config[site]['api_key']
      )
      @client = client.conn
    end

    def list_topics
      topics = @client.latest_topics
      topics.each do |t|
        puts "#{t['id']} #{t['title']} posts: #{t['posts_count']}"
      end
    end

    def self.main
      site = 'desktop'
      client = DiscourseApi::Client.new(@config[site]['host'])
      client.api_key = @config[site]['api_key']
      client.api_username = @config[site]['api_username']
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
        topics = client.latest_topics
        topics.each do |t|
          puts "#{t['id']} #{t['title']} posts: #{t['posts_count']}"
        end
      when "create-post"
        tempfile = SecureRandom.hex
        topic_id = ARGV[1]
if topic_id.nil? || topic_id == ""
          puts "Please provide a topic_id when editing a topic"
        end

        system('vim', "#{Dir.home}/.#{tempfile}.md")

        contents = File.open("#{Dir.home}/.#{tempfile}.md", 'rb').read

        new_post = {
          topic_id: topic_id,
          raw: contents
        }

        client.create_post(new_post)
        File.delete "#{Dir.home}/.#{tempfile}.md"
      when "read-topic"
        tempfile = SecureRandom.hex
        topic_id = ARGV[1]
        topic = client.topic(topic_id)

        # Grab the last post in a topic
        stream = topic['post_stream']['stream']
        stream.each do |post_id|
          response = client.get_post(post_id)
          post = response['raw']
          puts post
          puts ""
          puts "-----------------------------------------------------"
          puts ""
        end
        #post_id = stream.first
        #response = client.get_post(post_id)
        #post = response['raw']

        #File.write("#{tempfile}.md", post)

        #system('vim', "#{tempfile}.md")

        #contents = File.open("#{tempfile}.md", 'rb').read
        ##client.edit_post(post_id, contents)
        #File.delete "#{rand}.md"
      end
    end
  end
end
