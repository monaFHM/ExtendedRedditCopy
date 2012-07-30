class HomeController < ApplicationController
  def index
    @latest=Post.get_latest(5)
    @liked=Post.get_most_liked(5)
    #@valued=
  end

  def about
  end

  def contact
  end
end
