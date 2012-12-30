class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def index
    @count = increment_counter
    @products  = Product.all
    @time = Time.now
    @shown_message = "You've been here #{@count} times" if increment_counter > 2
  end
end
