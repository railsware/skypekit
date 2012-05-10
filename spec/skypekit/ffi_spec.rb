require 'spec_helper'

describe Skypekit::FFI do
  describe "as class" do
    subject { described_class }

    specify { should respond_to(:skypekit_skype_new) }
  end
end
