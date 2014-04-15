require 'sinatra'

class Messager < Sinatra::Application
  get '/' do
    "Post a :phone and :message to /messages"
  end

  post '/messages' do
    system "osascript", "message.applescript", params[:phone], params[:message]
    sleep 2
    system "screencapture -l$(osascript -e 'tell app \"Messages\" to id of window 1') /tmp/test.png"
    pixel_info1=`convert /tmp/test.png -crop '1x1+296+484' txt:-`
    #pixel_info2=`convert /tmp/test.png -crop '1x1+200+110' txt:-`
    puts pixel_info1
    #puts pixel_info2
    if !(pixel_info1 =~ /#A1A2C3 /)
      system "osascript -e 'tell application \"Messages\" keystroke return'"
      raise "failed :("
    end
  end
end
