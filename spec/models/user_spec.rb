require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it {should validate_uniqueness_of(:email)}
  it {should validate_presence_of(:password)}
  it {should have_secure_password}
  it {should validate_presence_of(:api_key)}
  it {should validate_uniqueness_of(:api_key)}

  describe 'instance methods' do
    it '#generate_api_key' do
    user = User.new(email: "joe@joe.com", password: "password", password_confirmation: "password")
    user.generate_api_key

    expect(user.api_key).to be_a(String)
    expect(user.api_key.length).to eq(24)
    expect(user.api_key).to_not eq(nil)
    end
  end
end
