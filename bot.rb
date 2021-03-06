# -*- encoding: UTF-8 -*-
require "rubygems"
require "bundler/setup"
require "twitter"
$LOAD_PATH << File.dirname(__FILE__)
require "pass"

class NiceGuy

  include OauthInfo

  attr_accessor :from_user

  def initialize
    @con_key = keys[:con_key]
    @con_secret = keys[:con_secret]
    @acc_token = keys[:acc_token]
    @acc_token_secret = keys[:acc_token_secret]
    @from_users = []
  end

  def search_word
    tweets = Twitter.search("結婚")

    tweets.each do |tweet|
      @from_users << tweet.from_user
    end
  end
  
  def update
    Twitter.configure do |config|
      config.consumer_key = @con_key
      config.consumer_secret = @con_secret
      config.oauth_token = @acc_token
      config.oauth_token_secret = @acc_token_secret
    end

    @from_users.each do |name|
      message = open('bot.txt').readlines.shuffle.first
      Twitter.update("@#{name} : #{message}")
#      puts "#{name} : #{message}"
    end
  end
end

nice_guy = NiceGuy.new
nice_guy.search_word
nice_guy.update
