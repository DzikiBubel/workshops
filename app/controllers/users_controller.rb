class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = Review.that_belong_to_user(@user).limit(5).order("id desc")
  end
end