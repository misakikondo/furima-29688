class OrdersController < ApplicationController

  def new 
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:user_id,:item_id,:zip_code,:prefecture,:city,:block,:bulimg_name,:phone,:order_id)
  end

end
