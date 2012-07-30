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
      it "returns the five most liked posts"
    end

    describe "#get_recent valued_ones" do
      it "returns the calculated highest valued posts"
    end

end