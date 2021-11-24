require 'tiny_params'

module DiscourseCLI
  class Topic
    def initialize(client)
      @client = client
    end

    def create(args)
      params = TinyParams.params(args)
        .required(:title, :raw)
      @client.create_topic(params.to_h)
    end

    def list_latest
      topics = @client.latest_topics
      topics.each do |t|
        puts "#{t['id']} #{t['title']} posts: #{t['posts_count']}"
      end
    end
  end
end
