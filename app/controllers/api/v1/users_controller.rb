class Api::V1::UsersController < ApplicationController

  before_action :set_user, only: [:show, :destroy]
  skip_before_action :authorized, only: [:index, :create, :update]

  # GET /users
  def index
    @users = User.all.with_attached_avatar

    render json: { users: UserSerializer.new(@users) }
  end

  # GET /users/1
  def show
    render json: { users: UserSerializer.new(@user) }
  end

  # POST /users
  def create

      @newUser1 = params.require(:user).permit(:username, :email, :dob, :location, :personality_type, :avatar, :password, :bio, :id)

      @newUser = User.new(@newUser1)


        if @newUser.valid?


          @user = User.create(username: @newUser.username, email: @newUser.email, dob: @newUser.dob.time, password: @newUser.password_digest)

          @user.create_gallery!(photos: [])

          @token = encode_token(user_id: @user.id)

          render json: { user: UserSerializer.new(@user), jwt: @token}, status: :created
        else
          render json: { error: @newUser.errors }, status: :not_acceptable
        end
  end

  # PATCH/PUT /users/1
  def update

      @user = User.find(params[:id])

      # @verifier = ActiveSupport::MessageVerifier.new('4_the_Glory', digest: 'HS256')
          if @user.valid? && params['avatar'].nil?

                @newUser_params = user_params.delete_if {|k,v| v.nil?}

                @user.update(@newUser_params)

                render json: { users: UserSerializer.new(@user)}

          else if @user.valid? && !params['avatar'].nil?

                @user.avatar.attach(params['avatar'])

                @newUser_params = user_params.delete_if {|k,v| v.nil?}

                @user.update(@newUser_params)

                render json: { users: UserSerializer.new(@user)}
          else
                render json: @user.errors, status: :unprocessable_entity
          end
      end
  end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(user_params[:id])
    end



    # Only allow a trusted parameter "white list" through.
    def user_params
        params.require(:user).require(:user).permit(:username, :email, :dob, :location, :personality_type, :avatar, :password, :bio, :id)
    end
