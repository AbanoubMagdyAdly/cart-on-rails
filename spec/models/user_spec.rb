require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:carts) }
  # Validation tests
  it { should validate_presence_of(:email) }
end
