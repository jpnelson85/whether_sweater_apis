def Api::V1::UsersSerializer
  include JSONAPI::Serializer
  attributes :email, :api_key
end