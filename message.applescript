on run argv
  tell application "System Events" to tell process "Messages"
    set input to item 2 of argv as text
    click button 1 of group 1 of splitter group 1 of window 1
    delay 1
    keystroke item 1 of argv -- type the reciever
    keystroke return -- validate the previous input
    keystroke tab -- move to message input
    keystroke input -- type the message
    keystroke return -- validate the previous input
  end tell
end run