# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.active_friendships.create(followed: user)
    redirect_to User.find(params[:followed_id])
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to request.referer
  end
end
