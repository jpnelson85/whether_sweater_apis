class Api::V1::UsersController < ApplicationController
  def create
    
    user = User.new(create_user_params)
    if user.save
      render json: UsersSerializer.serialize(user), status: 201
    else
      render json: { error: user.errors.full_messages.to_sentence, status: :unprocessible_entity }
    end


    # if params[:password] != params[:password_confirmation]
    #   render json: { error: 'Password and password confirmation must match', status: :unprocessible_entity }
    # elsif params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
    #   render json: { error: 'Email, password, and password confirmation cannot be blank', status: :unprocessible_entity }
    # elsif User.find_by(email: params[:email])
    #   render json: { error: 'Email already exists', status: unprocessible_entity }
    # else user.save

    #   render json: UsersSerializer.serialize(user), status: 201
    # end
  end

  private

  def create_user_params
    params.permit(:email, :password, :password_confirmation)
  end
end