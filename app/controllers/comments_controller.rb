class CommentsController < ApplicationController
  def create
    if params[:type] == 'replies'

      @parent = Comment.find_by(id:params[:id])
      Comment.create(content:params[:content],user_id: current_user.id,micropost_id:@parent.micropost_id,parent_id:@parent.id)
      redirect_to request.env["HTTP_REFERER"]

    else
      @comment = Micropost.find_by(id:params[:id]).comments.build(content:params[:content], user_id: current_user.id)
      @comment.save
      redirect_to request.env["HTTP_REFERER"]

    end
  end
end
