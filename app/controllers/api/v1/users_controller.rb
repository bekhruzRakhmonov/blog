class Api::V1::UsersController < ApplicationController
  def show
    @user = User.where(username: params[:username])
    render json: @user.to_json, status: 200
  end
end
