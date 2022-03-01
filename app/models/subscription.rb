class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea
  validates_presence_of :title, :frequency

  def self.title(params)
    Customer.find(params[:customer_id]).name + "'s" + Tea.find(params[:tea_id]).name + "Subscription"
  end
end
