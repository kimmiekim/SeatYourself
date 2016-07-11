class ReviewsController < ApplicationController

  before_action :load_restaurant
  before_action :ensure_logged_in, only: [:create, :destroy]

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user

      if @review.save
        redirect_to restaurant_url(@restaurant), notice: "Review created successfully"
      else
        redirect_to restaurant_url(@restaurant), notice: "Review could not be loaded"
      end
  end

  def new
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:comment)
  end

  def load_restaurant
    @restaurant = restaurant.find(params[:restaurant_id])
  end
  
end
