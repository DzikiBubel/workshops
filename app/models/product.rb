class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy
  
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+(\.[0-9]{1,2})?\z/ }
  
  def average_rating
    sum = 0.0
    reviews.each { |r| sum += r.rating }
    sum = sum / reviews.count
  end
  
  def self.that_belong_to_category(category)
    where("category_id = :category_id", category_id: category.id)
  end
end
