class RestaurantsController < ApplicationController
  before_action :require_restaurant_logged_in, only: [:show, :draft_posts]
  
  def show
    conform_current_restaurant
    
    @posts = current_restaurant.posts.where(draft: false).order('created_at DESC')
    posted_counts(current_restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
     @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @restaurant
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end    
  end
  
  def draft_posts
    conform_current_restaurant
    
    @draft_posts = @restaurant.posts.where(draft: true).order('created_at DESC')
    draft_counts(@restaurant)
  end
  
  
  private
  
  def conform_current_restaurant
    @restaurant = Restaurant.find(params[:id])
    
    if @restaurant != current_restaurant
      redirect_to root_path
    end
  end

  # Strong Parameter
  def restaurant_params
    params.require(:restaurant).permit(
      :brand_name, 
      :company_name, 
      :email, 
      :password, 
      :password_confirmation,
      :image
      )
  end
end
