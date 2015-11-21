require 'thor'
require 'discourse_api'

module DiscourseCli
  class CLI < Thor
    
    desc "categories", "returns a list of categories"
    def categories
      client = DiscourseCli::Client.client
      categories = client.categories

      puts "The following #{categories.count.to_s} categories were found:" 
      puts

      categories.each do |c|
        puts "#{c['id']} #{c['name']} #{c['slug']}"
      end
    end

    desc "topics CATEGORY_SLUG", "returns a list of all the topics in the specified category"
    def topics(category_slug)
      client = DiscourseCli::Client.client
      count = 30
      page = 0
      total = 0
      results = {}
      while count == 30 do
        topics = client.category_latest_topics(category_slug: category_slug, page: page)   
        count = topics.count
        topics.each do |t|
          results[t['id']] = t
        end
        page += 1
      end
       
      puts "The following #{results.count} topics were found in the #{category_slug} category:"
      puts

      results.each do |k, v|
        puts "#{v['id']} #{v['title']}"
      end
    end
  end
end
