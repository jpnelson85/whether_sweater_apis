class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(create_user_params)
    if params[:password] != params[:password_confirmation]
      render json: { error: 'Password and password confirmation must match' }, status: :bad_request
    elsif params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      render json: { error: 'Email, password, and password confirmation cannot be blank' }, status: :bad_request
    elsif User.find_by(email: params[:email])
      render json: { error: 'Email already exists' }, status: :bad_request
    else user.save
      render json: UsersSerializer.new(user), status: :created
    end
  end

  private

  def create_user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end