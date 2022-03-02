require 'rails_helper'

describe Subscription do
  it { should belong_to(:customer) }
  it { should belong_to(:tea) }

  describe 'self.title' do
    it 'should return a string' do
      customer = create(:customer)
      tea = create(:tea)
      params = {customer_id: customer.id, tea_id: tea.id}

      expect(Subscription.title(params)).to be_a String
      expect(Subscription.title(params)).to include customer.name
      expect(Subscription.title(params)).to include tea.name
    end
  end
end
