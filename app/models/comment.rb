class Comment < ActiveRecord::Base
  attr_accessible :text, :user_id, :post_id

  belongs_to :user
  belongs_to :post

  validates :text, :user_id, :post_id, :presence => true
end
