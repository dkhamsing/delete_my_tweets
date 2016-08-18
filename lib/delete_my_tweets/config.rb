module DeleteMyTweets
  require 'twitter_oauth_token'
  require 'yaml'

  class << self
    def config_create()
      c = TwitterOAuthToken::consumer(DELETE_APP_CONSUMER_KEY, DELETE_APP_CONSUMER_SECRET)
      request_token = TwitterOAuthToken::request_token(c)
      url = TwitterOAuthToken::authorize_url(request_token)

      puts "open this url in your browser (sign in and authorize): #{url}"

      print "enter pin: "
      pin = STDIN.gets.strip

      begin
        access_token = TwitterOAuthToken::access_token(request_token, pin)
      rescue => e
        puts "error: #{e}"
        exit
      end

      config = {
        CONSUMER_KEY => DELETE_APP_CONSUMER_KEY,
        CONSUMER_SECRET => DELETE_APP_CONSUMER_SECRET,
        ACCESS_TOKEN => access_token.token,
        ACCESS_TOKEN_SECRET => access_token.secret
      }

      File.open(CONFIG, 'w') { |f| f.write config.to_yaml }
      puts "wrote #{CONFIG} 🐤"
    end

    def config_get(file)
      f = File.read(file)
      YAML.load(f)
    end

    def config_missing?(file)
      !File.exist?(file)
    end
  end
end
