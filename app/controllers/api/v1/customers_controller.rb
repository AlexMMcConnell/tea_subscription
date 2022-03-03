class Api::V1::CustomersController < ApplicationController
  def create
    customer = Customer.new(
      name: customer_params[:name],
      email: customer_params[:email],
      address: customer_params[:address]
    )

    if customer.save
      render json: CustomerSerializer.new(customer), status: 200
    else
      render json: {error: "Invalid customer information."}, status: 400
    end
  end

  def show
    customer = Customer.find(customer_params[:id])
    if customer
      render json: SubscriptionSerializer.all(customer.subscriptions), status: 200
    else
      render json: {error: "Invalid customer ID"}, status: 400
    end
  end

private

  def customer_params
    params.permit(:id, :name, :email, :address)
  end
end
