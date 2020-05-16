class JsonWebToken
  class << self
    def encode(payload, _exp = 24.hours.from_now)
      # hr = (Time.now + 1.day).to_i
      # payload[:hr] = hr
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end
  end
end
