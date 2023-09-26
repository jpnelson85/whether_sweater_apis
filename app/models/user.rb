class User < ApplicationRecord  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :api_key, presence: true, uniqueness: true
  has_secure_password

  def generate_api_key
    loop do
      self.api_key = SecureRandom.base58(24)
      break unless User.exists?(api_key: api_key)
    end
  end
end
