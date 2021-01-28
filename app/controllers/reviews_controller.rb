class ReviewsController < ApplicationController
  before_action :find_review, only: [ :show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end 

  def new 
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end 

  def show
  end 

  def create 
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end 
  end

  def edit
  end 

  def update
    @review.save(review_params)
    redirect_to restaurant_path(@review.restaurant)
  end 

  def destroy 
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end 

  private

  def find_review
    @review = Review.find(params[:id])
  end 

  def review_params 
    params.require(:review).permit(:content, :rating)
  end 
end
