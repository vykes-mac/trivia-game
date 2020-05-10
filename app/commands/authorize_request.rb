class AuthorizeApiRequest
  prepend SimpleCommand
  include Auth

  def initialize(headers = {})
    @headers = headers
  end

  def call
    user
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    errors.add(:token, 'Missing token') unless headers['Authorization'].present?
    headers['Authorization'].split(' ').last
    # if headers['Authorization'].present?
    #   return headers['Authorization'].split(' ').last
    # else
    #   errors.add(:token, 'Missing token')
    # end

    # nil
  end
end
