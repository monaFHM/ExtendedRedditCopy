require 'spec_helper'
include Capybara::DSL

module TestHelper

    def login
        @user = users(:franz)
        visit new_user_session_path
        fill_in 'Email', :with => @user.email
        fill_in 'Password', :with => 'test1234'
        click_button 'Sign in'
    end

    def random_string
      ('a'..'z').to_a.shuffle[0..7].join
    end

    def logout
        click_on 'Sign out'
    end

end