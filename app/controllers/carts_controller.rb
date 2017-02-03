class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :checkout]

  def show
  end

  def checkout
    @cart.user.remove_cart
    @cart.checkout
    redirect_to cart_path(@cart)
  end


  private

  def set_cart
    @cart = Cart.find(params[:id])
  end

end
