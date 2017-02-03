class LineItemsController < ApplicationController

  def create
    if current_user.current_cart
      current_user.current_cart.add_item(params[:item_id])
    else
      current_user.create_current_cart
      current_user.current_cart.add_item(params[:item_id])
    end

    redirect_to cart_path(current_user.current_cart)
  end

end
