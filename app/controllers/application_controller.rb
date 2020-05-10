class ApplicationController < ActionController::API
  before_action :authenticate_request
  attr_reader :current_user

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
  #   include JWTSessions::RailsAuthorization
  #   rescue_from JWTSessions::Errors::Unauthorized, with: :unauthorized

  #   private

  #   def current_user
  #     @current_user ||= User.find(payload['user_id'])
  #   end

  #   def unauthorized
  #     render json: { error: 'not authorized' }, status: :unauthorized
  #   end
end
