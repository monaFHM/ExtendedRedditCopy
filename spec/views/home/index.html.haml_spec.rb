require_relative '../../spec_helper'

describe "Home Index" do  
  fixtures :users
    describe "for both unregistered and registered Users" do

      before :each do
      end

      it "shows the 5 highest ratest Links"
      
      it "shows the 5 latest Links" do

          visit '/home/index'
          if Post.count > 5
            #5 content rows + 1 header row
            page.should have_selector('table tr', :count => 6)
          else
          page.should_not have_selector('table tr')
         end      
      end
      
      it "shows the 20 highest valued Links"
    
    end
end
