class LikesController < ApplicationController
  def create
    if params[:type] == 'micropost'
    Micropost.find_by(id:params[:id]).likes.build(user_id:current_user.id).save
  else

Comment.find_by(id:params[:id]).likes.build(user_id:current_user.id).save
  end
    redirect_to request.env["HTTP_REFERER"]
  end
end
