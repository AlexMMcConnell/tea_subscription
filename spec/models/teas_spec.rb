require 'rails_helper'

describe Tea do
  it { should have_many(:subscriptions) }
  it { should have_many(:customers).through(:subscriptions) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:temperature) }
  it { should validate_presence_of(:brew_time) }
end
