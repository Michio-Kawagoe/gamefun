class UsersController < ApplicationController

    def mypage
      @user = current_user
      @posts = @user.posts
    end

    def show
      @user = User.find(params[:id])
      @post = @user.posts
    end

    def edit
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to mypage_path
      end
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to mypage_path, notice: 'ユーザー情報が更新されました。'
      else
        render 'edit'
      end
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
