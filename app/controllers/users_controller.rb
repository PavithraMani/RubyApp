class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up."
      redirect_to @user #extracts the ID of the @article and redirects to article/:id
    else
      render 'new' #new.html.erb
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end