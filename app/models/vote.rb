class Vote < ActiveRecord::Base
  attr_accessible :post_id, :up_or_down, :user_id

  belongs_to :user
  belongs_to :post

  #COMMENT: The up_or_down field should be called up, 
  #since the boolean indicates whether the vote is an upvote.
  validates :up_or_down, :user_id, :post_id, :presence => true
end
