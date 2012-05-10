#
# Copyright (c) 2012 Railsware (www.railsware.com)
#
module Skypekit
  class Skype
    def self.release(pointer)
      Skypekit::FFI.skypekit_skype_free(pointer)
    end

    def initialize(options = {})
      @keyfile = options[:keyfile] || "skypekit.pem"
      @host    = options[:host] || "127.0.0.1"
      @port    = options[:port] || 8963
      @logfile = options[:logfile] || nil

      @pointer = ::FFI::AutoPointer.new(Skypekit::FFI.skypekit_skype_new, self.class.method(:release))
    end

    def start
      File.exists?(@keyfile) or raise ArgumentError, "Can't find certificate file #{@keyfile.inspect}"
      Skypekit::FFI.skypekit_skype_init(pointer, @keyfile, @host, @port, @logfile)
      Skypekit::FFI.skypekit_skype_start(pointer)
    end

    def login(username, password)
      Skypekit::FFI.skypekit_skype_login(pointer, username, password)
    end

    def get_event
      event_pointer = Skypekit::FFI.skypekit_get_event(pointer)
      Skypekit::FFI::Event.new(event_pointer) unless event_pointer.address.zero?
    end

    def stop
      Skypekit::FFI.skypekit_skype_stop(pointer)
    end

    def send_chat_message(chat_id, message)
      Skypekit::FFI.skypekit_chat_send_message(pointer, chat_id, message, 0)
    end

    private

    attr_reader :pointer

  end
end
