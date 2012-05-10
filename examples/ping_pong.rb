require "skypekit"
$skype = Skypekit::Skype.new(:keyfile => ENV['SK_KEY'])

$skype.start
$skype.login(ENV['SK_USER'], ENV['SK_PASS'])

def terminate
  puts "Terminating"
  $skype.stop
  exit
end

trap('INT') do
  terminate
end

loop do
  event = $skype.get_event

  unless event
    sleep 5
    next
  end

  case event.type 
  when :account_status

    if event.data.logged_in?
      puts "Congrats! We are Logged in!"
    end

    if event.data.logged_out?
      puts "Authentication failed: #{event.data.reason}"
      terminate
    end

  when :chat_message
    message = event.data

    puts "@" * 80
    p message
    puts "@" * 80

    if message.body == "ping"
      $skype.send_chat_message(message.convo_id, "pong")
    end

  end
end
