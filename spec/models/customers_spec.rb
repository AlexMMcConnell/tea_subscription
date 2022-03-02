require 'rails_helper'

describe Customer do
  it { should have_many(:subscriptions) }
  it { should have_many(:teas).through(:subscriptions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
end
