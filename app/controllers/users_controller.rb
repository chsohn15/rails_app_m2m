class UsersController < ApplicationController
    def index
        @users = User.all
    end
     
    def show
        @user = User.find(params[:id])
    end
    
    def new 
        @user = User.new
    end

    def create
    @user = User.create(user_params)
        if @user.valid?
            @user.save 
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end
    def update
        user = User.update(user_params)
        redirect_to user_path(user)
    end
    def destroy 
        id = params[:id]
        User.destroy(id)
        redirect_to users_path
    end
    private
    def user_params
        params.require(:user).permit(:name,:balance, :plant_ids => [])

    end
end
