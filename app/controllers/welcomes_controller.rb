class WelcomesController < ApplicationController
  def index
  end
def cart
end
private
def load_cart
  @cart =Product.find(session[:cart])  
end
end
