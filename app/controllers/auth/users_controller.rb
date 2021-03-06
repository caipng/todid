class Auth::UsersController < ApplicationController
    before_action :authorize_request, except: [:create, :login]
   
    # GET /auth/me
    def show
        render json: @user, status: :ok
    end

    # POST /auth/signup
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # POST /auth/login
    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: @user.attributes.merge({ token: token, exp: time.strftime('%m-%d-%Y %H:%M') }), status: :ok
        else
            render json: { error: 'invalid login' }, status: :unauthorized
        end
    end

    private

    def user_params
        params.permit(:email, :name, :password, :password_confirmation)
    end
end
