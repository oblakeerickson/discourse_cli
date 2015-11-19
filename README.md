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
    discourse categories      # returns a list of categories
    discourse help [COMMAND]  # Describe available commands or one specific command

To see a list of categories:

    $ discourse categories

    The following 5 categories were found:
    Staff
    Uncategorized
    Lounge
    Site Feedback
    Parent Category2

More commands coming soon!


## Contributing

Bug reports and pull requests are welcome. This project is intended to be
a safe, welcoming space for collaboration, and contributors are expected to
adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

