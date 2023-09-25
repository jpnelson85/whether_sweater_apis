class User < ApplicationRecord
  before_create :generate_api_key
  
  validates :api_key, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password

  def generate_api_key
    loop do
      self.api_key = SecureRandom.base58(24)
      break unless User.exists?(api_key: api_key)
    end
  end
end
