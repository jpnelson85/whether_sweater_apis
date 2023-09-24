class User < ApplicationRecord
  before_create :generate_api_key
  has_secure_password
  
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest

  def generate_api_key
    loop do
      self.api_key = SecureRandom.base58(24)
      break unless User.exists?(api_key: api_key)
    end
  end
end
