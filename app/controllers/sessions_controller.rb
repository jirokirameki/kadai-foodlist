class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to @restaurant
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:restaurant_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @restaurant = Restaurant.find_by(email: email)
    if @restaurant && @restaurant.authenticate(password)
      # ログイン成功
      session[:restaurant_id] = @restaurant.id
      return true
    else
      # ログイン失敗
      return false
    end
  end  
  
end