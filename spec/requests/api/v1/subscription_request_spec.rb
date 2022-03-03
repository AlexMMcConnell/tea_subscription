require 'rails_helper'

describe 'Subscription API' do
  it 'can add a customer to subscriptions' do
    customer = create(:customer)
    tea = create(:tea)

    post "/api/v1/subscriptions", params: { customer_id: customer.id, tea_id: tea.id }

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(subscription[:data]).to have_key(:id)

    expect(subscription[:data][:attributes]).to have_key(:customer_id)
    expect(subscription[:data][:attributes][:customer_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:tea_id)
    expect(subscription[:data][:attributes][:tea_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:active)
    expect(subscription[:data][:attributes][:active]).to eq true

    expect(subscription[:data][:attributes]).to have_key(:frequency)
    expect(subscription[:data][:attributes][:frequency]).to be_a String
  end

  it 'can unsubscribe a customer from a subscription' do
    customer = create(:customer)
    tea = create(:tea)

    new_subscription = create(:subscription, customer: customer, tea: tea)

    expect(new_subscription.active).to eq true

    patch "/api/v1/subscriptions/#{new_subscription.id}", params: { customer_id: customer.id, tea_id: tea.id }

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(subscription[:data]).to have_key(:id)

    expect(subscription[:data][:attributes]).to have_key(:customer_id)
    expect(subscription[:data][:attributes][:customer_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:tea_id)
    expect(subscription[:data][:attributes][:tea_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:active)
    expect(subscription[:data][:attributes][:active]).to eq false

    expect(subscription[:data][:attributes]).to have_key(:frequency)
    expect(subscription[:data][:attributes][:frequency]).to be_a String
  end
end
