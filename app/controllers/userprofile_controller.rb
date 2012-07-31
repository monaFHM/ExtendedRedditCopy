class UserprofileController < ApplicationController
  before_filter :authenticate_user!
  
  def index
      @userposts = current_user.posts.order("created_at DESC")
  end

end
