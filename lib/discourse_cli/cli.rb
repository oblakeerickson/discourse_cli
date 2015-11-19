require 'thor'
require 'discourse_api'

module DiscourseCli
  class CLI < Thor
   
    desc "categories", "returns a list of categories"
    def categories
      client = DiscourseCli::Client.client
      categories = client.categories

      puts "The following " + categories.count.to_s + " categories were found:" 
      categories.each do |c|
        puts c['name']
      end
    end
  end
end
