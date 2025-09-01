class UsersController < ApplicationController


  private
  def users_params
    params.require(:user).permit(:title, :body, :image)
  end
end
