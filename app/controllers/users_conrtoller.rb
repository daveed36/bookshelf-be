class UsersController < ApplicationController
    before_action :authorize_request, except: :create
  
    def create
      @user = User.new({
        firstname: params[:firstname],
        lastname: params[:lastname],
        username: params[:username],
        password: params[:password]
      })
  
      if @user.valid?
        @user.save
      Collection.create({ name: "Reading Now", user_id: @user.id })
      Collection.create({ name: "To Read", user_id: @user.id })
      Collection.create({ name: "Favorites", user_id: @user.id })
        render json: UserSerializer.new(@user)
      else
        render json: { error: @user.errors.full_messages }
      end
    end
  
    def show
      @user = User.find(params[:id])
  
      render json: UserSerializer.new(@user)
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :firstname, :lastname)
    end
  end