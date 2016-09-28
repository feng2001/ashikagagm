class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
    
  
  def show 
   @user = User.find(params[:id])
   @microposts = @user.microposts.order(created_at: :desc).page(params[:page]).per(5)    
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
     
      if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to user_url(@user) , notice: 'メッセージを編集しました'
      else
      # 保存に失敗した場合は編集画面へ
      render 'edit'
      end
  end
    
  def followers
    @user =  User.find(params[:id])
    @followers = @user.follower_users
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users
  end

      
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                :password_confirmation,:prof)
  end
  def correct_user

    @user = User.find(params[:id])

    if current_user != @user
        redirect_to root_url
    end
  end
end