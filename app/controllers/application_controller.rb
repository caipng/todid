class ApplicationController < ActionController::API
    before_action :authorize_request

    def authorize_request
        # { Authorization: 'Bearer <token>' }
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
            @decoded = JsonWebToken.decode(header)
            @user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { error: e.messae }, status: :unauthorized
        rescue JWT::DecodeError => e
            # catch invalid/expired tokens
            render json: { error: e.message }, status: :unauthorized
        end
    end
end
