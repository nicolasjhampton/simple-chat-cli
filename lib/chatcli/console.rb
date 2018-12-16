require 'json'

module Chatcli
  class Console
    def initialize; end

    attr_accessor :client, :status

    def login
      puts 'Enter a username'
      username = gets.chomp
      @client = Client.new username
      @client.login
      user_info = @client.info
      @status = JSON.parse(user_info)["results"]
      group_listing
    end

    def group_listing
      puts @status
      @status["users"].each_with_index do |user, index|
        puts "#{index + 1}. #{user}"
      end
    end
  end
end
