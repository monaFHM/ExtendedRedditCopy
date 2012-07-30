describe "Post" do

  context "validation" do

    it "should require presence of user name and email" do
      User.new(:username => "", :email=> "", :password => "1234", :password_confirmation => "1234").should_not be_valid
    end


    it "should have unique user name and email" do
      User.new(:username => "albert", :email=> "albert@gmail.com", :password => "1234", :password_confirmation => "1234")
      User.new(:username => "albert", :email=> "albert@gmail.com", :password => "1234", :password_confirmation => "1234").should_not be_valid 
    end

  end

 
end