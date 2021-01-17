class Api::V1::UsersController < Api::V1::ApiController
    before_action :authorized, only: [:auto_login]

    def create
        @user = User.new(user_params)
        if @user.save
            token = encode_token({user_id: @user.id})
            render json: {user_id: @user.id, user_email: @user.email, token: token}, status: :created
            #render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user_id: @user.id, user_email: @user.email, token: token}
        else
            render json: {error: "Invalid username or password"}
        end
    end

    def auto_login
        render json: {user_id: @user.id, user_email: @user.email}
    end

    private
        def user_params
            params.permit(:email, :password, :password_confirmation)
        end

end
