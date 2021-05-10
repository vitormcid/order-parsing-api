class Api::OrdersController < ApplicationController
  def integrate_order
    result = Organizers::CreateOrder.call(params)

    if result.errors.present?
      render json: result.errors.to_json, status: 400
    else
      render json: result.response.to_s, status: 200
    end
  end
end