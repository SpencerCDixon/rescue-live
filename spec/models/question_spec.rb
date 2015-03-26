require 'rails_helper'

describe Question do
  describe "validations" do
    it { should have_valid(:title).when('this is a title') }
    it { should_not have_valid(:title).when('tle') }
  end
end
