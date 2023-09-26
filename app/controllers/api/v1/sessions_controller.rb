class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if params[:email].nil? || params[:password].nil?
      render json: { error: 'Email and password cannot be blank', status: :unprocessible_entity }
    elsif User.find_by(email: params[:email]).nil?
      render json: { error: 'Email or password are incorrrect', status: :unprocessible_entity }
    elsif user.authenticate(params[:password]) == false
      render json: { error: 'Email or password are incorrrect', status: :unprocessible_entity }
    else user && user.authenticate(params[:password])
      render json: UserSerializer.serialize(user), status: 200
    end
  end
end