on run argv
  tell application "Messages"
    set myid to get id of first service
    set phoneNumber to item 1 of argv
    set message to item 2 of argv
    set theBuddy to buddy phoneNumber of service id myid
    send message to theBuddy
  end tell
end run
