require 'rails_helper'

describe 'Customer API' do
  it 'can create a new customer' do
    params = {
      name: "Joe Smith",
      email: "joeysmitherson@gmail.com",
      address: "1234 E Sudan St, Denver, Colorado, 80200"
    }
    post "/api/v1/customers", params: params

    customer_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(customer_response[:data]).to have_key(:id)

    expect(customer_response[:data]).to have_key(:attributes)

    expect(customer_response[:data][:attributes]).to have_key(:name)
    expect(customer_response[:data][:attributes][:name]).to eq(params[:name])

    expect(customer_response[:data][:attributes]).to have_key(:email)
    expect(customer_response[:data][:attributes][:email]).to eq(params[:email])

    expect(customer_response[:data][:attributes]).to have_key(:address)
    expect(customer_response[:data][:attributes][:address]).to eq(params[:address])

  end

  it 'can return all subscriptions for given customer' do
    customer = create(:customer)

    create_list(:subscription, 3, customer: customer)
    create(:subscription, customer: customer, active: false)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer_response = JSON.parse(response.body, symbolize_names: true)

    expect(customer_response[:data]).to be_a Array

    customer_subscriptions = customer_response[:data]

    customer_subscriptions.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_a Integer

      expect(subscription[:attributes]).to have_key(:customer_id)
      expect(subscription[:attributes][:customer_id]).to be_a Integer

      expect(subscription[:attributes]).to have_key(:tea_id)
      expect(subscription[:attributes][:tea_id]).to be_a Integer

      expect(subscription[:attributes]).to have_key(:active)
      expect(subscription[:attributes][:active]).to be_in([true, false])

      expect(subscription[:attributes]).to have_key(:frequency)
      expect(subscription[:attributes][:frequency]).to be_a String
    end
  end
end
