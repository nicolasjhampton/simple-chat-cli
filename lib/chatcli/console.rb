module Chatcli
  class Console
    def initialize; end

    attr_reader :client

    def login
      puts 'Enter a username'
      username = gets.chomp
      @client = Client.new username
      login_info = @client.login
      user_info = @client.info
      puts login_info
      puts user_info
    end
  end
end
