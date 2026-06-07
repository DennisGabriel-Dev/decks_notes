class ApplicationController < ActionController::API
  attr_reader :current_user
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      unless header
        render json: { error: 'Missing token' }, status: :unauthorized and return
      end
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded["user_id"]) if @decoded["user_id"].present?
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
