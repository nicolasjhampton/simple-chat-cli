require 'json'

module Chatcli
  class Console
    def initialize; end

    attr_reader :client, :users, :groups, current_group

    def login
      puts 'Enter a username'
      username = gets.chomp
      @client = Client.new username
      @client.login
      user_info = @client.info
      user_info = JSON.parse(user_info)
      @users = user_info["results"]["users"]
      @current_group = user_info["results"]["currentGroup"]
      @groups = user_info["results"]["groups"]
      user_listing
    end

    def join
      puts 'Groups:'
      @client.join
    end

    def user_listing
      puts "Users:"
      @status["users"].each_with_index do |user, index|
        puts "#{index + 1}. #{user}"
      end
    end

    def group_listing
      puts "Groups:"
      @status["users"].each_with_index do |user, index|
        puts "#{index + 1}. #{user}"
      end
    end
  end
end
