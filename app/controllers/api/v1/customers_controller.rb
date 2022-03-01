class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.new(
      name: params[:name],
      email: params[:email],
      address: params[:address]
    )

    if customer.save
      render json: CustomerSerializer.new(customer)
    else
      render json: {error: "Invalid customer information."}
    end
  end
end