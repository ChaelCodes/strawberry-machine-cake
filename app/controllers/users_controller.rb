# frozen_string_literal: true

# Controller for User Routing.
# Only logged in admins can access these routes.
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :build_user, only: %i[new create]
  before_action :authenticate_user!
  before_action :authenticate_admin!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def restful_object
    RestfulObject.new(@user,
                      params[:user] && user_params,
                      users_url)
  end

  private

  # Use callbacks to share common setup or cons traints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Initialize a User
  def build_user
    @user = params[:user] ? User.new(user_params) : User.new
  end

  # Never trust parameters from the internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:admin)
  end

  def authenticate_admin!
    unless current_user.admin
      redirect_to root_path,
                  alert: 'You are not an admin.'
    end
  end
end
