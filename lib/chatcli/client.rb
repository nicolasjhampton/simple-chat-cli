require 'net/http'
require 'em-eventsource'
require 'json'

class Chatcli::Client
  attr_accessor :base_url, :stream_pid, :username, :group, :users, :groups, :members, :messages

  ACTIONS = {
    login: 'add:user',
    info: 'info:user',
    join: 'join:group',
    send: 'send:message'
  }.freeze

  def initialize(username = '')
    @base_url = 'http://localhost:8170/nichampton/simple-chat/' # 'https://nichampton.lib.id/simple-chat@dev/'
    @username = username
    @group = nil
  end

  def api(action, data = nil)
    uri = URI(@base_url)
    query = { username: @username, group: @group }
    query.tap do |q|
      q[:action] = ACTIONS[action]
      q[:data] = data unless data.nil?
    end
    uri.query = URI.encode_www_form(query)
    uri
  end

  def login
    uri = api(:login)
    res = req(uri)
    @username = res['username']
    @users = res['users']
    @members = res['members']
    @group = 'public'
  end

  def info
    uri = api(:info)
    res = req(uri)
    @group = res['group']
    @users = res['users']
    @groups = res['groups']
  end

  def join(group)
    @group = group
    uri = api(:join)
    connect()
    res = req(uri)
    @messages = res['messages']
    @group = res['group']
    @members = res['members']
  end

  def send(data)
    uri = api(:send, data)
    req(uri)
  end

  def connect
    # at_exit do
    #   puts @stream_pid
    #   Process.kill('SIGINT', @stream_pid)
    # end
    @stream_pid = fork do
      Signal.trap('SIGINT') { exit }
      EM.run do
        source = EventMachine::EventSource.new("#{@base_url}stream/?group=#{@group}") #  # https://nichampton.lib.id/simple-chat@dev/stream/
        source.message do |message|
          
        end
        source.on @group do |message|
          json_message = JSON.parse(message)
          @messages = json_message['messages']
        end
        source.start # Start listening
      end
    end
  end

  def req(uri)
    res = Net::HTTP.get(uri)
    data = JSON.parse(res)
    data['results']
  end
end
