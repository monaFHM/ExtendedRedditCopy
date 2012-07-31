require 'spec_helper'

describe Comment do
  context "validation" do
    it "should require a text, a user and a post_id " do
      user = 1
      post = 1
      text ="Blablablablablablablablablablabla"
      Comment.new(:text => "", :user_id => user, :post_id => post).should_not be_valid
      Comment.new(:text => text, :user_id => user, :post_id => '').should_not be_valid
      Comment.new(:text => text, :user_id => '', :post_id => post).should_not be_valid

    end
  end
end
