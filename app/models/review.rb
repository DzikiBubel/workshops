class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
  
  validates :content, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true
  
  def self.that_belong_to_user(user)
    where("user_id = :user_id", user_id: user.id)
  end
end
