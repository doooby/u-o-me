class UsersController < ApplicationController
  before_action :require_user_session
  before_action :require_super_user
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all

    if param = params[:search].presence
      search_term = "%#{param}%"
      @users = @users.where 'name LIKE ? OR email LIKE ?', search_term, search_term
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to user_url(@user), notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update user_params
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!

    respond_to do |format|
      redirect_to users_url, notice: "User was successfully destroyed."
    end
  end

private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(
      :email, :name
    )
  end

end
