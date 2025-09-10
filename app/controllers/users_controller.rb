class UsersController < ApplicationController

    def show
      @user = User.all
      @post = @user.post
    end

    def edit
    end

  private
  def users_params
    params.require(:user).permit(:title, :body, :profile_image)
  end
end
