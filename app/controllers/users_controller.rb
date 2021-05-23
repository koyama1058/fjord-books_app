# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @following = current_user.following.find_by(id: @user.id)
    @friendship = Friendship.find_or_initialize_by(follower_id: current_user,followed_id: @user)
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.following.order(:id).page(params[:page])
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.order(:id).page(params[:page])
  end
end
