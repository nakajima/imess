require 'sinatra'

class Messager < Sinatra::Application
  get '/' do
    "Post a :phone and :message to /messages"
  end

  post '/messages' do
    puts "receiving a message...."
    p params
    system "osascript", "message.applescript", params[:phone], params[:message]
    sleep 1
    system "screencapture -l$(osascript -e 'tell app \"Messages\" to id of window 1') /tmp/test.png"
    pixel_info1=`convert /tmp/test.png -crop '1x1+296+484' txt:-`
    puts pixel_info1
    if !(pixel_info1 =~ /#A1A2C3 /)
      system "osascript -e 'tell application \"System Events\" to tell process \"Messages\" to keystroke return'"
      raise "failed to send imessage"
    end
  end
end
