require 'spec_helper'

describe Vote do
  context "validation" do
    it "should require a text, a user and a post_id " do
      user = 1
      post = 1
      up_down = 0
      Vote.new(:up_or_down => "", :user_id => user, :post_id => post).should_not be_valid
      Vote.new(:up_or_down => up_down, :user_id => '', :post_id => post).should_not be_valid
      Vote.new(:up_or_down => up_down, :user_id => user, :post_id => '').should_not be_valid

    end
  end
end
