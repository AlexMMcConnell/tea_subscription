class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(
      customer_id: subscription_params[:customer_id],
      tea_id: subscription_params[:tea_id],
      title: Subscription.title(subscription_params),
      active: true,
      frequency: "monthly")

    if subscription.save
      render json: SubscriptionSerializer.new(subscription, "created"), success: "User successfully subscribed", status: 200
    else
      render json: {error: "Invalid customer or tea ID"}, status: 400
    end
  end

  def update
    subscription = Subscription.find_by(customer_id: subscription_params[:customer_id], tea_id: subscription_params[:tea_id])
    if subscription && subscription.active == true
      subscription.active = false
      subscription.save
      render json: SubscriptionSerializer.new(subscription, "updated"), status: 200
    elsif subscription && subscription.active == false
      render json: {error: "Customer already unsubscribed"}, status: 400
    else
      render json: {error: "Invalid customer or tea ID"}, status: 400
    end
  end

private

  def subscription_params
    params.permit(:customer_id, :tea_id)
  end
end
