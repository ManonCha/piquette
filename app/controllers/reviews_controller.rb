class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = current_user.reviews
  end

  def show
    @review = Review.new
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save!
      redirect_to review_path(@review)
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
    params.recquire(:review).permit(:comment, :rating, :date)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
