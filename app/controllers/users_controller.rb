class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    @user = User.all.page(params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザーの登録に失敗しました'
      render :new
    end
  end

  def update
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :passoword_confirmation)
  end
  
end