# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    Friendship.create(follower_id: current_user.id, followed_id: params[:followed_id])
    redirect_to User.find(params[:followed_id])
  end

  def destroy
    friendship = Friendship.find(params[:id])
    friendship.destroy
    redirect_to request.referer
  end
end
