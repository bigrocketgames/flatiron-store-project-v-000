class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts

  def current_cart=(cart)
    @current_cart = carts.find(cart.id)
  end

  def current_cart
    @current_cart
  end

end
