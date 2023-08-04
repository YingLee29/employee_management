class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # def update
  #   @user = current_user
  #   if @user.update(user_params)
  #     redirect_to @user, notice: 'User was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @user = current_user
  #   @user.destroy
  #   redirect_to root_path, notice: 'User was successfully destroyed.'
  # end

  # private

  def user_params
    params.require(:user).permit(:name, :email, :password, :information, :phone, :position )
  end
end
