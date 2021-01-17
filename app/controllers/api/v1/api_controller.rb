module Api::V1
    class ApiController < ApplicationController
        # Métodos globais (autenticação, etc)
        before_action :authorized

        def encode_token(payload)
            #exp_time = Time.now.to_i + 24 * 3600
            #exp_payload = { data: payload, exp: exp_time }
            exp_payload = payload
            JWT.encode(exp_payload, "In0.eyJk", "HS256")
        end

        def auth_header
            # { Authorization: 'Bearer <token>' }
            request.headers["Authorization"]
        end

        def decoded_token
            if auth_header
                token = auth_header.split(" ")[1]
                # header: { 'Authorization': 'Bearer <token>' }
                begin
                    #leeway = 300
                    #JWT.decode(token, "In0.eyJk", true, {exp_leeway: leeway, algorithm: "HS256"})
                    JWT.decode(token, "In0.eyJk", true, {algorithm: "HS256"})
                rescue JWT::ExpiredSignature
                    nil
                rescue JWT::DecodeError
                    nil
                end
            end
        end

        def logged_in_user
            if decoded_token
                user_id = decoded_token[0]["user_id"]
                @user = User.find_by(id: user_id)
            end
        end

        def logged_in?
            !!logged_in_user
        end

        def authorized
            render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
        end

    end
end