# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    Comment.create(set_params)
    redirect_to request.referer
  end

  private

  def judgment_model
    judgment = { commentable_type: nil, commentable_id: nil }
    if params[:book_id]
      judgment[:commentable_type] = 'Book'
      judgment[:commentable_id] = params[:book_id]
      judgment
    elsif params[:report_id]
      judgment[:commentable_type] = 'Report'
      judgment[:commentable_id] = params[:report_id]
      judgment
    end
  end

  def set_params
    params.permit(:content).merge(user_id: current_user.id).merge(judgment_model)
  end
end
