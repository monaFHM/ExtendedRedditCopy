require_relative '../../spec_helper'

include Capybara::DSL
include TestHelper
describe "Application View" do
  fixtures :users

  describe "unregistered" do

    it "shows a Links for Login and Register in the sidebar when nobody is logged in" do
      visit '/home/index'
      page.has_link?('Sign in')
      page.has_link?('Sign up')
    end
    it "opens Login and Register in an overlaying Tab?"
  end

  describe "registered" do

    before :each do
      login
    end
 
    it "shows a greeting with Username, and tLinks to Sign Out, Account Settings and Profile in the sidebar when somebody is logged in" do
      visit '/home/index'
      page.has_link?('Sign out')
      page.has_link?('Accont Settings')
      page.has_link?('Profile')
      page.has_selector?('h3', :text => "#{@user.username}")
    end


    it "shows a shortcut for new Post"
  end

end