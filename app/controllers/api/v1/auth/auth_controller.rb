module Api
  module V1
    module Auth
      class AuthController < ApplicationController
        skip_before_action :authenticate_request

        def signin
          command = AuthenticateUser.call(params[:email], params[:password])
          handle_command(:auth_token, command)
        end

        def signup
          command = SignUpUser.call(params[:username], params[:email],
                                    params[:password])
          handle_command(:auth_token, command)
        end
      end
    end
  end
end
