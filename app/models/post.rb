class Post < ActiveRecord::Base
  attr_accessible :link, :title, :user_id
  belongs_to :user
  validates :title, :link, :presence => true

  def Post.get_latest(quantity)
    Post.order("created_at DESC").limit(quantity)
  end

  def Post.get_most_liked(quantity)
    
  end

  def Post.get_recent_valued(quantity)
  end

end
