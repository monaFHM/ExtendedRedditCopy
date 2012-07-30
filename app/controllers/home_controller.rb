class HomeController < ApplicationController
  def index
    @latest=Post.get_latest(5)
    #@liked=
    #@valued=
  end

  def about
  end

  def contact
  end
end
