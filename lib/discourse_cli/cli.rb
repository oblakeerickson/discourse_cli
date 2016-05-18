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
    
    desc "sub_categories PARENT_CATEGORY_ID", "returns a list of sub-categories in the specified category"
    def sub_categories(parent_category_id)
      client = DiscourseCli::Client.client
      results = client.categories(parent_category_id: parent_category_id)
      puts results 
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
        if !topics.include?("The requested URL or resource could not be found.")
          count = topics.count
          if count > 0
            topics.each do |t|
              results[t['id']] = t
            end
          end
        else
          count = 0 
        end
        page += 1
      end
      
      if count == 0
        puts topics
      else
        puts "The following #{results.count} topics were found in the #{category_slug} category:"
      end 
      puts

      results.each do |k, v|
        puts "#{v['id']} #{v['title']}"
      end
    end
    
    desc "create_topic TITLE RAW", "creates a new topic"
    def create_topic(title, raw) 
      client = DiscourseCli::Client.client
      topic = {
        title: title,
        raw: raw
      }
      new_topic = client.create_topic(topic)
      puts new_topic
    end

    desc "create_post TOPIC_ID RAW", "creates a new post"
    def create_post(topic_id, raw)
      client = DiscourseCli::Client.client
      post = {
        topic_id: topic_id,
        raw: raw
      }
      new_post = client.create_post(post)
      puts new_post
    end

    desc "create_group NAME", "creates a new group"
    def create_group(name)
      client = DiscourseCli::Client.client
      group = {
        name: name
      }
      client.create_group(group)
    end

    desc "posts TOPIC_ID", "returns a list of posts in the specified topic"
    def posts(topic_id)
      client = DiscourseCli::Client.client
      post_ids = []
      
      # fetch topic
      topic = client.topic(topic_id)

      # array of all post id's in topic
      stream = topic['post_stream']['stream']
      
      # get the first ~20 posts in the topic 
      posts = topic['post_stream']['posts']
      posts.each do |p|
        post_ids.push(p['id'])
        puts "#{p['id']} #{p['cooked'][3..13]}..."
      end 

      # get the rest of the posts in chunks of 20
      diff = stream - post_ids
      while diff.count > 0 do
        response = client.topic_posts(topic_id, diff.slice(0, 19))
        response_posts = response['post_stream']['posts']
        response_posts.each do |p|
          post_ids.push(p['id'])
          puts "#{p['id']} #{p['cooked'][3..13]}..."
        end
        diff = stream - post_ids
      end
      
    end

    desc "users", "returns a list of users"
    def users
      client = DiscourseCli::Client.client
      u = client.group_members('trust_level_0')
      puts u 
    end

    desc "create_category NAME COLOR TEXT_COLOR", " creates a new category"
    def create_category(name, color, text_color)
      client = DiscourseCli::Client.client
      category = {
        name: name,
        color: color,
        text_color: text_color 
      }
      new_category = client.create_category(category)
      puts new_category
    end
    
    desc "get_total_stats", "returns the totals from the dashboard stats"
    def get_total_stats
      client = DiscourseCli::Client.client
      stats = client.get_dashboard_stats_totals
      puts stats
    end
  end
end
