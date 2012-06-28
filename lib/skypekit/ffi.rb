#
# Copyright (c) 2012 Railsware (www.railsware.com)
#
module Skypekit
  module FFI
    extend ::FFI::Library

    #
    # @see https://github.com/railsware/libskypekit/blob/master/include/skypekit.h
    #

    #ffi_lib File.expand_path("../../../../libskypekit/lib/libskypekit.so", __FILE__)
    ffi_lib "skypekit"

    ErrorType = enum(
      :already_running, 1,
      :already_initialized,
      :not_initialized,
      :not_running,
      :keyfile_access,
      :skypename_required,
      :password_required,
      :account_not_found,
      :conversation_not_found,
      :login_failure,
      :send_message_failure
    )

    EventType = enum(
      :account_status, 1,
      :chat_message
    )

    AccountStatusType = enum(
     :logged_out, 1,
     :logged_out_and_pwd_saved,  # the account is logged out, but password is not needed for re-login
     :connecting_to_p2p,         # connecting to P2P network
     :connecting_to_server,      # connecting to login server
     :logging_in,                # waiting for response from server
     :initializing,              # response OK. initialising account-specific lib structures
     :logged_in,                 # alright, we're good to go!
     :logging_out                # Logout() has been called but not processed yet
    )

    AccountLogoutReasonType = enum(
      :logout_called, 1,           # manual logout (or unknown reason from previous session)
      :https_proxy_auth_failed,    # sync errors at login/registration
      :socks_proxy_auth_failed,    # sync errors at login/registration
      :p2p_connect_failed,         # sync errors at login/registration
      :server_connect_failed,      # sync errors at login/registration
      :server_overloaded,          # sync errors at login/registration
      :db_in_use,                  # sync errors at login/registration
      :invalid_skypename,          # sync errors at registration
      :invalid_email,              # sync errors at registration
      :unacceptable_password,      # sync errors at registration
      :skypename_taken,            # sync errors at registration
      :rejected_as_underage,       # sync errors at registration
      :no_such_identity,           # sync errors at login
      :incorrect_password,         # sync errors at login
      :too_many_login_attempts,    # sync errors at login
      :password_has_changed,       # async errors (can happen anytime while logged in)
      :periodic_uic_update_failed, # async errors (can happen anytime while logged in)
      :db_disk_full,               # async errors (can happen anytime while logged in)
      :db_io_error,                # async errors (can happen anytime while logged in)
      :db_corrupt,                 # async errors (can happen anytime while logged in)
      :db_failure,                 # deprecated (superceded by more detailed DB_* errors)
      :invalid_app_id,             # platform sdk
      :app_id_failure,             # platform sdk
      :unsupported_version         # forced upgrade/discontinuation
    )

    attach_function :skypekit_skype_new, [], :pointer

    attach_function :skypekit_skype_free, [:pointer], :void

    attach_function :skypekit_skype_init, [:pointer, :string, :string, :int, :string], ErrorType

    attach_function :skypekit_skype_start, [:pointer], ErrorType

    attach_function :skypekit_skype_login, [:pointer, :string, :string], ErrorType

    attach_function :skypekit_count_events, [:pointer], ErrorType

    attach_function :skypekit_get_event, [:pointer], :pointer

    attach_function :skypekit_event_free, [:pointer], :void

    attach_function :skypekit_chat_send_message, [:pointer, :string, :string, :int], ErrorType

    attach_function :skypekit_skype_stop, [:pointer], ErrorType
  end
end
