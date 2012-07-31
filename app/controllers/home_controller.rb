class HomeController < ApplicationController
  def index
    @latest=Post.get_latest(5)
    @liked=Post.get_most_liked(5)
    @valued=Post.get_recent_valued(20)
  end

  def about
  end

  def contact
  end
end
