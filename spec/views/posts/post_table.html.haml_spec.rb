require_relative '../../spec_helper'

describe "post_table.html.haml" do 
  fixtures :users

  before :each do 
    visit '/home/index'
  end

  it "shows a list of Posts with the possibility to view comments" do
    page.has_selector?('post-indextable')
    page.has_selector?('btn icon_comment')
    page.has_selector?('[class*=comments_div]')
  end

  it "shows a statement for an empty List of posts"  

  context "registered User" do
    
    before :each do
      login
    end

    it "shows edit and delete button for user owned post" do
      page.has_link?('Edit')
      page.has_link?('Delete')
    end

    it "shows up and downvote button for user" do    
      page.has_selector?('post-voting-tools')
    end

    it "gives the possibility to add a comment" do
      page.has_selector?('post-comment-form')
    end
  end
  
end