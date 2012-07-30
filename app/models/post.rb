class Post < ActiveRecord::Base
  attr_accessible :link, :title, :user_id
  belongs_to :user
  has_many :votes
  has_many :comments
  validates :title, :link, :presence => true

  def Post.get_latest(quantity)
    Post.order("created_at DESC").limit(quantity)
  end

  def Post.get_most_liked(quantity)
    posts=Post.all
    posts.sort!{ |a,b| a.get_voting_value <=> b.get_voting_value }[0...quantity]
  end

  def Post.get_recent_valued(quantity)
  end


  def get_voting_value()
    pro = self.votes.where(:up_or_down => true).count
    contra = self.votes.where(:up_or_down => false).count

    pro-contra
  end

end
