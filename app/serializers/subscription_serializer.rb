class SubscriptionSerializer
  def self.new(subscription)
    { data:
      {
        id: subscription.id,
        attributes: {
          customer_id: subscription.customer_id,
          tea_id: subscription.tea_id,
          active: subscription.active,
          frequency: subscription.frequency
        }
      }
    }
  end

  def self.all(subscriptions)
    { data:
      subscriptions.map do |subscription|
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
    }
  end
end
