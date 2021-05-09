class Api::OrdersController < ApplicationController
  def create    
    result = Operations::Orders::CreateOrderOperation.call(params: params)

    if result.success?
    	
    else
     
    end
  end

  private

  def order_params(params)
  	# to do
  end
end