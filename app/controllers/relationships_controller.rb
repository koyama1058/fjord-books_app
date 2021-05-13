# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    relationship = Relationship.create(follower_id: current_user.id, followed_id: params[:followed_id])
    redirect_to User.find(params[:followed_id])
  end

  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy
    redirect_to request.referer
  end
end
