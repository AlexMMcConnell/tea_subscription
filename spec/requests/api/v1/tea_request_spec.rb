require 'rails_helper'

describe 'Tea API' do
  it 'can create a new tea' do
    params = {
      name: "Green Tea",
      description: "Nice and relaxing",
      temperature: "120 C",
      brew_time: 10
    }
    post "/api/v1/teas", params: params

    tea_response = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(tea_response[:data]).to have_key(:id)

    expect(tea_response[:data]).to have_key(:attributes)

    tea_info = tea_response[:data][:attributes]

    expect(tea_info).to have_key(:name)
    expect(tea_info[:name]).to eq(params[:name])

    expect(tea_info).to have_key(:description)
    expect(tea_info[:description]).to eq(params[:description])

    expect(tea_info).to have_key(:temperature)
    expect(tea_info[:temperature]).to eq(params[:temperature])

    expect(tea_info).to have_key(:brew_time)
    expect(tea_info[:brew_time]).to eq(params[:brew_time])
  end
end
