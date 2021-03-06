class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :username, :email, :presence => true
  validates :username, :email, :uniqueness => true

  has_many :posts
  has_many :votes
  #COMMENT: Shouldn't the user also have has_many :comments


  #COMMENT: Another way to ensure that there are no dobule votes
  #is to use "validates uniqueness of" in the vote model.
  def can_vote?(post_id)
    qty = Vote.where(:post_id => post_id, :user_id => self.id).count
    return false if qty > 0
    true
  end
end
