class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(create_user_params)
    user.generate_api_key
    if user.save
      render json: UserSerializer.serialize(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence, status: :unprocessible_entity }
    end
  end


  private

  def create_user_params
    params.permit(:email, :password, :password_confirmation)
  end
end