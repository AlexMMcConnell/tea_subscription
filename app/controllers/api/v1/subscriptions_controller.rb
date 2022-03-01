class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(
      customer_id: params[:customer_id],
      tea_id: params[:tea_id],
      title: Subscription.title(params),
      active: true,
      frequency: "monthly")

    if subscription.save
      render json: SubscriptionSerializer.new(subscription)
    else
      render json: {error: "Invalid customer or tea ID"}
    end
  end

  def show
    customer = Customer.find(params[:id])
    if customer
      render json: SubscriptionSerializer.all(customer.subscriptions)
    else
      render json: {error: "Invalid customer ID"}
    end
  end

  def update
    subscription = Subscription.find_by(customer_id: params[:customer_id], tea_id: params[:tea_id])
    if subscription && subscription.active == true
      subscription.active = false
      render json: SubscriptionSerializer.new(subscription)
    elsif subscription && subscription.active == false
      render json: {error: "Customer already unsubscribed"}
    else
      render json: {error: "Invalid customer or tea ID"}
    end
  end
end
