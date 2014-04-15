require 'sinatra'

class Messager < Sinatra::Application
  get '/' do
    "Post a :phone and :message to /messages"
  end

  post '/messages' do
    begin
      system "osascript", "message.applescript", params[:phone], params[:message]
    rescue => e
      p e
    end
  end
end
