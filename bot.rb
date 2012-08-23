# -*- encoding: UTF-8 -*-
require 'rubygems'
require 'twitter'
require './pass'
include Oauth

class NiceGuy
  attr_accessor :from_user

  def initialize
    @con_key = Oauth::settings[:con_key]
    @con_secret = Oauth::settings[:con_secret]
    @acc_token = Oauth::settings[:acc_token]
    @acc_token_secret = Oauth::settings[:acc_token_secret]
    @from_user = []
  end

  def search_word
    Twitter.search("/結婚|婚約/",
                  lang: "ja",
                  locale: "ja",
                  rpp: 3).each do |t|
      @from_user << t.from_user
    end
  end
  
  def update
    Twitter.configure do |config|
      config.consumer_key = @con_key
      config.consumer_secret = @con_secret
      config.oauth_token = @acc_token
      config.oauth_token_secret = @acc_token_secret
    end

    @from_user.each do |name|
      message = open('bot.txt').readlines.shuffle.first
      #Twitter.update("@#{name} : #{message}")
      puts "#{name} : #{message}"
    end
  end

end

nice_guy = NiceGuy.new
nice_guy.search_word
nice_guy.update
