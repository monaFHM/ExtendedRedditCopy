require_relative '../../spec_helper'
include Capybara::DSL

describe "UserContent" do 
  fixtures :users

    describe "index" do

      before :each do 
        login
      end

      it "allows the user to post something" do
        
        old_quantity=Post.count

        visit '/userprofile/index'
        click_on 'New Blogpost'
        fill_in 'Title', :with =>random_string
        fill_in 'Link', :with => 'http://www.google.com'
        click_button 'Post'

        old_quantity.should < Post.count

      end

      it "shows all posts from user sorted by date" do
        quant = @user.posts.count

        visit '/userprofile/index'
        if quant == 0
          page.should have_content("You haven't posted anything yet")
        else
          page.has_selector("table#userposts")
        end
      end

      it "alows the user to delete his content"

      it "redirects the user if he is not logged in"

    end
end