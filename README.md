# discourse_cli 

A command-line power tool for Discourse.

## Installation

    $ gem install discourse_cli

## Configuration

Before you can use discourse_cli from the command-line a configuration file
needs to be created in your home directory

    $ touch ~/.discourse_cli

Edit `~/.discourse_cli` with your favorite editor with the following contents,
but with settings for your own discourse instance:

    discourse:
      host: http://localhost:3000
      api_key: 2e07ed2f1570c9dee581a4f4442d0a3f17ce951c6eb2807389217ced82422272
      api_username: discourse 
     

## Usage

Type `discourse` to see a list of available commands:

    $ discourse

    Commands:
    discourse categories            # returns a list of categories
    discourse help [COMMAND]        # Describe available commands or one specific command
    discourse posts TOPIC_ID        # returns a list of posts in the specified topic
    discourse sub_categories PARENT_CATEGORY_ID       # returns a list of sub-categories in the specified category
    discourse topics CATEGORY_SLUG  # returns a list of all the topics in the specified category

To see a list of categories:

    $ discourse categories
    
    The following 6 categories were found:
    
    4 Staff staff
    1 Uncategorized uncategorized
    2 Lounge lounge
    3 Site Feedback site-feedback
    5 Parent Category2 parent-category
    7 test_category test-category


To see a list of topics in a category:

    $ discourse topics test-category | head
    
    The following 203 topics were found in the test-category category:
    
    220 Ruvxqzlajycmikwbfspndgheto
    219 Vgsdeloyuzbmpixqrtwjhfckna
    218 Fujohcvsnqptbaerwdzxgmlyki
    217 Yreaikwflptouscvjbxdqmghzn
    216 Jmytihfaervoklpsudngczbxwq
    215 Ylnkbcmujrqvdosfitpxzeaghw
    214 Rzageqphtbcnsfmxudlwiokjvy
    213 Afngbetiqovyxjpwklsczhdrmu

To see a list of posts in a topic:

    $ discourse posts 232 | head

    244 ofvwgejxuld...
    245 nukegjtadmr...
    246 hcqobgwupdy...
    247 segjvdfhzxy...
    248 uxmjkpngolw...
    249 bufahjmozwx...
    250 gkuhraztsmx...
    251 izqdervkoyc...
    252 sroquzpyfml...
    253 hzkywjqsuit...

More commands coming soon!


## Contributing

Bug reports and pull requests are welcome. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

