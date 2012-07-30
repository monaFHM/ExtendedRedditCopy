require 'spec_helper'

include Capybara::DSL
include TestHelper
describe UserprofileController do
  fixtures :users


  describe "GET 'index'" do

    it "should redirect if not signed in" do
      get 'index'
      response.should be_redirect
    end

  end

end
