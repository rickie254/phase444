class UsersController < ApplicationController

    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    #  GET /me
    # returns the first user when the first user is logged in (
    # returns the second user when the second user is logged in 
    # returns a 401 unauthorized response when no user is logged in 
    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else
            render json: {error: "Not authorized"}, status: :unauthorized
        end
    end

    private 

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end
end
