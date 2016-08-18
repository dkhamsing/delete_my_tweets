# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'delete_my_tweets/version'

Gem::Specification.new do |spec|
  spec.name          = DeleteMyTweets::PROJECT
  spec.version       = DeleteMyTweets::VERSION
  spec.authors       = ['Daniel Khamsing']
  spec.email         = ['dkhamsing8@gmail.com']

  spec.summary       = 'Delete my tweets'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/dkhamsing/delete_my_tweets'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = [spec.name]
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'twitter'
  spec.add_runtime_dependency 'twitter_oauth_token'
end
