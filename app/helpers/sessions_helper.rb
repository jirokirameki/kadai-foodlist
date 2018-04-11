module SessionsHelper
  def current_restaurant
    @current_restaurant ||= Restaurant.find_by(id: session[:restaurant_id])
  end

  def logged_in?
    !!current_restaurant
  end
  
end