class SubscriptionSerializer
  def self.new(subscription, status)
    { data:
      {
        id: subscription.id,
        attributes: {
          customer_id: subscription.customer_id,
          tea_id: subscription.tea_id,
          title: subscription.title,
          active: subscription.active,
          frequency: subscription.frequency
        }
      },
      success: "Subscription #{status} successfully."
    }
  end

  def self.all(subscriptions)
    { data:
      {
        id: subscriptions.first.customer_id,
        type: "customer",
        subscriptions: subscriptions.map do |subscription|
          {
            id: subscription.id,
            attributes: {
              customer_id: subscription.customer_id,
              tea_id: subscription.tea_id,
              active: subscription.active,
              frequency: subscription.frequency
            }
          }
        end
      },
      success: "All current and previous subscriptions successfully loaded"
    }
  end
end
