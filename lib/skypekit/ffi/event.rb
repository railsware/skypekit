#
# Copyright (c) 2012 Railsware (www.railsware.com)
#
module Skypekit
  module FFI
    class Event < ::FFI::ManagedStruct
      def self.release(pointer)
        FFI.skypekit_event_free(pointer)
      end

      layout \
        :type,  FFI::EventType,
        :timestamp, :time_t,
        :data, :pointer,
        :next, :pointer
      
      def type
        self[:type]
      end

      def timestamp
        self[:timestamp]
      end

      def created_at
        @created_at ||= Time.at(self[:timestamp])
      end

      def data
        @data ||= 
          case self.type
          when :account_status
            AccountStatusData.new(self[:data])
          when :chat_message
            ChatMessageData.new(self[:data])
          else
            raise NotImplementedError, "event type #{type.inspect} is not implemeted"
          end
      end

      def inspect
        "#{super} type=#{type} created_at=#{created_at}"
      end
    end
  end
end
