class UsersSerializer
  def self.serialize(user)
    {
      data: {
        type: 'users',
        id: user.id.to_s,
        attributes: {
            email: user.email,
            api_key: user.api_key
            }
        }
    }
  end
end