class UserprofileController < ApplicationController
  before_filter :authenticate_user!
  
  def index
      @userposts = Post.order("created_at DESC")
  end

end
