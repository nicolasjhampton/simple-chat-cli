require "chatcli/version"
require "net/http"

module Chatcli
  class Client
    attr_accessor :username

    ACTIONS = {
      :login => "add:user",
      :info => "info:user",
      :join => "join:group",
      :send => "send:message",
    }

    def initialize(username="")
      @base_url = 'https://nichampton.lib.id/simple-chat@dev/'
      @username = username
      @group = nil
    end

    def api(action, data=nil)
      uri = URI(@base_url)
      query = { :username => @username, :group => @group }
      query.tap do |q|
        q[:action] = ACTIONS[action]
        # q[:group] = group unless group.nil?
        q[:data] = data unless data.nil?
      end
      uri.query = URI.encode_www_form(query)
      uri
    end

    def login
      uri = api(:login)
      Net::HTTP.get(uri)
    end

    def info
      uri = api(:info)
      Net::HTTP.get(uri)
    end

    def join(group)
      @group = group
      uri = api(:join)
      Net::HTTP.get(uri)
    end

    def send(data)
      uri = api(:send, data)
      Net::HTTP.get(uri)
    end
  end
end
