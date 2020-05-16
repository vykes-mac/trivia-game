module Auth
  class SignUpUser
    prepend SimpleCommand
    include Auth

    def initialize(username, email, password)
      @username = username
      @email = email
      @password = password
    end

    def call
      @user = insert_user
      JsonWebToken.encode(user_id: @user.id.oid) if @user
    end

    private

    attr_accessor :username, :email, :password

    def insert_user
      if User.find_by(email: email)
        return errors.add :user_found, 'this email already exist'
      end

      if User.find_by(username: username)
        return errors.add :user_found, 'this username already exist'
      end

      user = User.new(username: username, email: email,
                      password: password)
      user.insert
    end
  end
end
