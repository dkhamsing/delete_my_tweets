module DeleteMyTweets
  require 'delete_my_tweets/config'
  require 'delete_my_tweets/version'
  require 'delete_my_tweets/twitter'

  class << self
    OPT_CONFIG = '--config'

    def cli
      puts "#{PROJECT} #{VERSION}"

      if ARGV.include? OPT_CONFIG
        config_create
        exit
      end

      if config_missing? CONFIG
        puts "config missing, type: #{PROJECT} #{OPT_CONFIG}"
        exit
      end

      c = config_get(CONFIG)

      twitter_delete(c) do |o|
        puts o
      end
      puts 'all done 🐤'
    end
  end
end
