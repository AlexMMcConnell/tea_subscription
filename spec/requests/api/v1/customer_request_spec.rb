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
end
