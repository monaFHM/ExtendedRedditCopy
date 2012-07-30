class Vote < ActiveRecord::Base
  attr_accessible :post_id, :up_or_down, :user_id

  belongs_to :user
  belongs_to :post
end
