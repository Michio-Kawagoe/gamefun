class UsersController < ApplicationController

    def mypage
      @user = current_user
    end

    def show
      @user = User.find(params[:id])
      @post = @user.posts
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(current_user)
    end

    def destroy
      user = User.find(current_user.id)
      user.destroy
      redirect_to root_path, notice: "アカウントが削除されました"
    end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
