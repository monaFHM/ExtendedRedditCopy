class Vote < ActiveRecord::Base
  attr_accessible :post_id, :up_or_down, :user_id

  belongs_to :user
  belongs_to :post

  #COMMENT: The up_or_down field should be called up, 
  #since the boolean indicates whether the vote is an upvote.
  validates_inclusion_of :up_or_down, :in => [true, false]
  validates :user_id, :post_id, :presence => true
end
