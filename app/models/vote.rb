class Vote < ActiveRecord::Base
  attr_accessible :post_id, :up_or_down, :user_id

  belongs_to :user
  belongs_to :post

  validates :up_or_down, :user_id, :post_id, :presence => true
end
