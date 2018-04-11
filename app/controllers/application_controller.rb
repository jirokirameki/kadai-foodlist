class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private

  # ログインしているかどうか確認
  def require_restaurant_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  # ログインユーザ本人の投稿か確認
  def correct_restaurant
    @post = current_restaurant.posts.find_by(id: params[:id])
    unless @post
      redirect_to root_path
      # redirect_back(fallback_location: root_path)
    end
  end
  
  # restaurantが持つ総投稿数
  def counts(restaurant)
    @count_posts = restaurant.posts.count
  end
  
  # restaurantが持つ投稿済み投稿数
  def posted_counts(restaurant)
    @count_posted_posts = restaurant.posts.where(draft: false).count
  end
  
  # restaurantが持つ下書き数
  def draft_counts(restaurant)
    @count_draft_posts = restaurant.posts.where(draft: true).count
  end
  
end