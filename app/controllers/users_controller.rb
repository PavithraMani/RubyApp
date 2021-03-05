class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
  end

  def create
    if @user.save
      flash[:notice] = "Welcome #{@user.username}! You have successfully signed up."
      redirect_to articles_path
    else
      render 'new' #new.html.erb
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account was updated successfully."
      redirect_to articles_path
    else
      render 'edit' #update.html.erb
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
