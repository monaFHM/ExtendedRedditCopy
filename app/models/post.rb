require 'date'

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
    posts.sort!{ |a,b| b.get_voting_value <=> a.get_voting_value }[0...quantity]
  end

  def Post.get_recent_valued(quantity)
    posts=Post.all
    posts.sort!{ |a,b| Post.hot(b.get_ups, b.get_downs, b.created_at) <=> Post.hot(a.get_ups, a.get_downs, a.created_at)}[0...quantity]
  end


  # Source : https://gist.github.com/2636355
  # http://bibwild.wordpress.com/2012/05/08/reddit-story-ranking-algorithm/

  # Actually doesn't matter WHAT you choose as the epoch, it
  # won't change the algorithm. Just don't change it after you
  # have cached computed scores. Choose something before your first
  # post to avoid annoying negative numbers. Choose something close
  # to your first post to keep the numbers smaller. This is, I think,
  # reddit's own epoch.
  $our_epoch = Time.local(2012, 12, 7, 7, 46, 43).to_time


  def Post.epoch_seconds(t)
    (t.to_i - $our_epoch.to_i).to_f
  end


  # date is a ruby Time
  def Post.hot(ups, downs, date)
      s = ups - downs
      displacement = Math.log( [s.abs, 1].max, 10 )

      sign = if s > 0
        1
      elsif s < 0
        -1
      else
        0
      end

      return (displacement * sign.to_f) + ( epoch_seconds(date) / 45000 )
  end 
  

  def get_ups()
    self.votes.where(:up_or_down => true).count
  end

  def get_downs()
    self.votes.where(:up_or_down => false).count
  end

  def get_voting_value()
    pro = get_ups
    contra = get_downs
    pro-contra
  end

end
