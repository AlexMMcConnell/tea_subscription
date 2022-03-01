require 'rails_helper'

describe 'Subscription API' do
  before(:each) do
    @user = create(:user)
    @tea = create(:tea)
  end

  it 'can add a user to subscriptions' do
    post "api/v1/subscriptions", params: { user_id: @user.id, tea_id: @tea.id }

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(subscription[:data]).to have_key(:id)

    expect(subscription[:data][:attributes]).to have_key(:user_id)
    expect(subscription[:data][:attributes][:user_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:subscription_id)
    expect(subscription[:data][:attributes][:subscription_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:active)
    expect(subscription[:data][:attributes][:active]).to eq True

    expect(subscription[:data][:attributes]).to have_key(:frequency)
    expect(subscription[:data][:attributes][:frequency]).to be_a String
  end

  it 'can remove a user from subscriptions' do
    new_subscription = create(:subscription, user: @user, tea: @tea)

    expect(new_subscription.active).to eq True

    delete "api/v1/subscriptions", params: { user_id: @user.id, tea_id: @tea.id }

    subscription = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(subscription[:data]).to have_key(:id)

    expect(subscription[:data][:attributes]).to have_key(:user_id)
    expect(subscription[:data][:attributes][:user_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:subscription_id)
    expect(subscription[:data][:attributes][:subscription_id]).to be_a Integer

    expect(subscription[:data][:attributes]).to have_key(:active)
    expect(subscription[:data][:attributes][:active]).to eq False

    expect(subscription[:data][:attributes]).to have_key(:frequency)
    expect(subscription[:data][:attributes][:frequency]).to be_a String
  end

  it 'can return all subscriptions for given customer' do
    create_list(:subscription, 3, user: user)
    create(:subscription, user: user, active: False)

    get "api/v1/subscriptions/#{@user.id}"

    expect(response).to be_successful

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions[:data]).to have_key(:subscriptions)

    user_subscriptions = subscriptions[:data][:subscriptions]

    user_subscriptions.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription[:id]).to be_a Integer

      expect(subscription[:attributes]).to have_key(:user_id)
      expect(subscription[:attributes][:user_id]).to be_a Integer

      expect(subscription[:attributes]).to have_key(:subscription_id)
      expect(subscription[:attributes][:subscription_id]).to be_a Integer

      expect(subscription[:attributes]).to have_key(:active)
      expect(subscription[:attributes][:active]).to be_a Boolean

      expect(subscription[:attributes]).to have_key(:frequency)
      expect(subscription[:attributes][:frequency]).to be_a String
    end
  end
end
