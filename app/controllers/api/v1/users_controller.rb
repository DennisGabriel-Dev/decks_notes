class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: :ok if @users.present?
    render json: { error: 'No users found' }, status: :no_content
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok if @user.present?
    render json: { error: 'User not found' }, status: :not_found
  end
end
