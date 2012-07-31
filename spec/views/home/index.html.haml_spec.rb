require_relative '../../spec_helper'

describe "Home Index" do  
  fixtures :users
    describe "for both unregistered and registered Users" do

      before :each do
        visit '/home/index'
      end

      it "shows the highest ratest Links" do        
        page.should have_selector('#post-liked-table')         
      end
      
      it "shows the  latest Links" do        
        page.should have_selector('#post-latest-table')         
      end
      
      it "shows the highest valued Links" do
        page.should have_selector('#post-latest-table')
      end
    
    end
end
