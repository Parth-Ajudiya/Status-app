class UsersController < ApplicationController
    def new
      @user = User.new
      @statuses = @user.statuses.build
    end

    def index
      @statuses = Status.all
    end

    def edit
      @user = User.find(params[:id])
      @statuses = @user.statuses
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        UserMailer.with(user: @user).new_user_email.deliver_later
        redirect_to user_path(@user)
      else
        render action: :new
      end
    end

    def update
      @user = User.find(params[:id])
      @statuses = @user.statuses
      if @user.update(params.require(:user).permit(:name, statuses_attributes: [:select_date, :tasks, :prlinks, :hours, :_destroy]))
          flash[:notice] = "Article update successfully"
          redirect_to @user
     else
          render 'edit'
     end
    end

    def show
      @user = User.find(params[:id])
      @statuses = @user.statuses
    end

    def destroy
      
      @statuses =Status.find(params[:id])
      @statuses.destroy
      redirect_to users_path
  end
    
    private
    
    def user_params
      params.require(:user).permit(:name, statuses_attributes: [:select_date, :tasks, :prlinks, :hours, :_destroy])
    end
end
