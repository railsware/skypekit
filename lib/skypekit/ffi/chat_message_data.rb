#
# Copyright (c) 2012 Railsware (www.railsware.com)
#
module Skypekit
  module FFI
    class ChatMessageData < ::FFI::Struct
      layout \
        :convo_id, :string,
        :convo_guid, :string,
        :author, :string,
        :author_displayname, :string,
        :body_xml, :string,
        :timestamp, :uint,
        :payload, :pointer
        
      def convo_id
        self[:convo_id]
      end

      def convo_guid
        self[:convo_guid]
      end

      def author
        self[:author]
      end

      def author_displayname
        self[:author_displayname]
      end

      def sent_at
        Time.at(self[:timestamp])
      end

      def body
        self[:body_xml]
      end


      def inspect
        "#{super} convo_id=#{convo_id} convo_guid=#{convo_guid} author=#{author} author_displayname=#{author_displayname} sent_at=#{sent_at} body=#{body}"
      end
    end
  end
end
