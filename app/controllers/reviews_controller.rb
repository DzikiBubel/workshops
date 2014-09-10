class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]
  before_action :owner_user, only: [:edit, :update, :destroy]

  expose(:review)
  expose(:product)

  def edit
  end

  def create
    self.review = Review.new(review_params)
    review.user = current_user

    if review.save
      product.reviews << review
      redirect_to category_product_url(product.category, product), notice: 'Review was successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
    def owner_user
      unless current_user == review.user || current_user.admin?
        flash[:error] = "You are not allowed to edit this review."
        redirect_to category_product_url(category, product)
      end
    end
end
