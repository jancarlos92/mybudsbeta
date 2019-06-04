class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

     def create
       @user = User.find_by(username: user_login_params[:username])
       #User#authenticate comes from BCrypt
       if @user && @user.valid?
         # encode token comes from ApplicationController
         token = encode_token({ user_id: @user.id })
         render json: { user: UserSerializer.new(@user), jwt: token}, status: :accepted
       else
         render json: { message: 'Invalid username or password' }, status: :unauthorized
       end
     end

     def show
         jwt = request.headers['Authorization']
         id = JWT.decode(jwt, "4_the_Glory")[0]["user_id"]
         @user = User.find_by(id: id)
        #@user.avatar_on_disk.to_json
         render json: { user: UserSerializer.new(@user)}, status: :accepted
     end



     private

     def user_login_params
       # params { user: {username: 'Chandler Bing', password: 'hi' } }
       params.require(:user).permit(:username, :password_digest, :id)
     end
   end
