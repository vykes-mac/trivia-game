module Auth
  class AuthorizeRequest
    include Auth
    prepend SimpleCommand

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
      puts 'hello'
      unless headers['Authorization'].present?
        errors.add(:token, 'Missing token')
      end
      return if headers['Authorization'].nil?

      headers['Authorization'].split(' ').last
    end
  end
end
