require 'json'

module Chatcli
  class Console
    def initialize; end

    attr_accessor :client, :users, :groups, :current_group, :members

    def login
      clear_screen
      puts 'Enter a username'
      username = gets.chomp
      @client = Client.new username
      @client.login
      # data = @client.info
      # @users = data['users']
      # @current_group = data['group']
      # @groups = data['groups']
      print_listing(@client.users, 'Users')
      gets
    end

    def join
      clear_screen
      puts 'Enter a group to join'
      group = gets.chomp
      data = @client.join group
      # @current_group = data['group']
      # @members = data['members']
      # @messages = data['messages']
      print_listing(@client.members, @client.group)
      gets
    end

    def chat
      while true
        print_messages
        puts '<<<--------------------->>>'
        message = gets.chomp
        @client.send message
      end
    end

    def print_messages
      clear_screen
      puts ":::#{current_group} group chat:::"
      puts ''
      @client.messages.each do |username, message|
        puts ":::#{username}::: #{message}"
      end
      puts ''
    end

    def print_listing(obj, title = '')
      puts "#{title}:"
      obj.each_with_index do |user, index|
        puts "#{index + 1}. #{user}"
      end
    end

    def clear_screen
      print "\e[2J\e[f"
      puts ''
    end
  end
end
