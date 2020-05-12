class ApplicationController < ActionController::API
  include Auth
  include Questions
  include Scores
  before_action :authenticate_request
  attr_reader :current_user

  def authenticate_request
    @current_user = AuthorizeRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
