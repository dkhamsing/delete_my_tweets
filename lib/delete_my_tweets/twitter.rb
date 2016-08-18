module DeleteMyTweets
  require 'twitter'
  require 'delete_my_tweets/version'

  class << self
    def twitter_delete(t)
      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = t[CONSUMER_KEY]
        config.consumer_secret     = t[CONSUMER_SECRET]
        config.access_token        = t[ACCESS_TOKEN]
        config.access_token_secret = t[ACCESS_TOKEN_SECRET]
      end

      options = {count: 200, include_rts: true}
      user = client.user.screen_name

      begin
        exclude = t['filter']['exclude']
      rescue
        exclude = []
      end
      puts "excluding: #{exclude}" if block_given? && exclude.count>0

      begin
        tweets = client.user_timeline(user, options)
        puts "found #{tweets.count} tweets" if block_given?
        tweets.each_with_index do |t, i|
          r = exclude.any? { |i| t.text.include? i }
          if r == false
            puts "#{i+1} 👋  deletin #{t.text}" if block_given?
            client.destroy_status t
          end
        end
      rescue Twitter::Error::TooManyRequests => error
        sleep error.rate_limit.reset_in + 1
        retry
      end
    end
  end
end
