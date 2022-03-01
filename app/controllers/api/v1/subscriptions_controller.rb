class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(
      customer_id: params[:customer_id],
      tea_id: params[:tea_id],
      title: Subscription.title(params),
      active: true,
      frequency: "monthly")

    if subscription.save
      render json: SubscriptionSerializer.new(subscription), success: "User successfully subscribed", status: 200
    else
      render json: {error: "Invalid customer or tea ID"}, status: 400
    end
  end

  def show
    customer = Customer.find(params[:id])
    if customer
      render json: SubscriptionSerializer.all(customer.subscriptions), success: "All current and previous subscriptions successfully loaded", status: 200
    else
      render json: {error: "Invalid customer ID"}, status: 400
    end
  end

  def update
    subscription = Subscription.find_by(customer_id: params[:customer_id], tea_id: params[:tea_id])
    if subscription && subscription.active == true
      subscription.active = false
      subscription.save
      render json: SubscriptionSerializer.new(subscription), success: "User successfully unsubscribed", status: 200
    elsif subscription && subscription.active == false
      render json: {error: "Customer already unsubscribed"}, status: 400
    else
      render json: {error: "Invalid customer or tea ID"}, status: 400
    end
  end
end
