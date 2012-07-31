describe "Post" do

  context "validation" do
    it "should require a title and a link" do
      Post.new(:title => "", :link => "").should_not be_valid
    end
  end

  describe "#get_latest" do
    it "returns the latest x posts" do
      x=5
      latest_posts=Post.get_latest(x)
      if Post.count > x 
        latest_posts.length.should == x
      else
        latest_posts.length.should == Post.count
      end

      if latest_posts.first
        Post.where("created_at >= ?", latest_posts.first.created_at).count.should == 0
      end

    end
  end

    describe "#get_most_liked_five" do
      it "returns the x most liked posts" do 
        x=5
        most_liked_posts = Post.get_most_liked(5)
        if Post.count > 5
          most_liked_posts.should ==x
        else
          most_liked_posts.length.should == Post.count
        end

        #is propably bullshit because it repeats the original code
        if most_liked_posts.first
          best = Post.all.sort!{|a,b| n.get_voting_value <=> a.get_voting_value}
          best.get_voting_value should == most_liked_posts.first.get_voting_value
        end
      end
    end

    describe "#get_recent valued_ones" do
      it "returns the calculated highest valued posts"
    end

    describe '#hot algorithmus' do
      it "returns a higher value for something new and top rated than for something old and low rated" do
        topnew=Post.hot(10,1,Time.new(2012,7,11,15,25,0))
        flopold=Post.hot(0,2,Time.new(2012,3,11,15,25,0))
        topnew.should > flopold
      end
      it "returns a higher value for something new and top rated than for something old and equally rated" do
        topnew=Post.hot(10,1,Time.new(2012,7,11,15,25,0))
        flopold=Post.hot(10,1,Time.new(2012,3,11,15,25,0))
        topnew.should > flopold
      end
      it "returns a higher value for something slighty older but better rated" do
        flopnew=Post.hot(4,1,Time.new(2012,7,11,15,25,0))
        topold=Post.hot(15,1,Time.new(2012,7,11,13,25,0))
        flopnew.abs.should > topold.abs
      end
    end

end