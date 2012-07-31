describe "Post" do
  fixtures :users

  context "validation" do

    it "should require presence of user name and email" do
      User.new(:username => "", :email=> "", :password => "1234", :password_confirmation => "1234").should_not be_valid
    end


    it "should have unique user name and email" do
      User.new(:username => "albert", :email=> "albert@gmail.com", :password => "1234", :password_confirmation => "1234")
      User.new(:username => "albert", :email=> "albert@gmail.com", :password => "1234", :password_confirmation => "1234").should_not be_valid 
    end

  end

  context "vote" do

      before :each do
        @user = users(:franz)
        @post = Post.create(:user_id=>@user.id, :title => "Voting Test 1", :link =>"http:www.youtube.com")          
      end

      describe '#can_vote?' do
        it "return true if user hasn't voted yet" do 
          @user.can_vote?(@post.id).should be_true
        end

        it "returns false if user has voted yet" do
          vote = Vote.create(:user_id => @user.id, :post_id => @post.id, :up_or_down => '1')
          @user.can_vote?(@post.id).should be_false
        end

      end
  end

 
end