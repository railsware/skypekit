#
# Copyright (c) 2012 Railsware (www.railsware.com)
#
module Skypekit
  module FFI
    class AccountStatusData < ::FFI::Struct
      layout \
        :status, FFI::AccountStatusType,
        :reason, FFI::AccountLogoutReasonType,
        :skypename, :string,
        :payload, :pointer

      def status
        self[:status]
      end

      def skypename
        self[:skypename]
      end

      def reason
        self[:reason]
      end

      def logged_in?
        status == :logged_in
      end

      def logged_out?
        status == :logged_out && reason != 0
      end

      def inspect
        "#{super} status=#{status} skypename=#{skypename} reason=#{reason}"
      end
    end
  end
end
