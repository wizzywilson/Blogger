class CommentsController < ApplicationController
  def create
    @comment = Micropost.find_by(id:params[:id]).comments.build(content:params[:content], user_id: current_user.id)
    @comment.save
    redirect_to request.env["HTTP_REFERER"]
  end
end
