class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = current_user.reviews
    @reviews = @reviews.sort_by(&:rating).reverse
  end

  def show
    @review = Review.new
  end

  def new
    @bottle = Bottle.find(params[:bottle_id])
    @review = Review.new
  end

  def create
    @bottle = Bottle.find(params[:bottle_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.bottle = @bottle

    if @review.save!
      redirect_to reviews_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to review_path(@review)
  end

  def destroy
    @review.destroy
    redirect_to my_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :user_bottle, :tasting_date)
  end

  def set_review
    @review = current_user.reviews.find(params[:id])
  end
end
