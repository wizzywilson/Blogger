class LikesController < ApplicationController
  def create

    if params[:type] == 'micropost'

      @type = params[:type]
      @micropost = Micropost.find_by(id:params[:id])
      @micropost.likes.build(user_id:current_user.id).save
      @id = params[:id]
  else

      @type = params[:type]
      @comment = Comment.find_by(id:params[:id])
      @comment.likes.build(user_id:current_user.id).save
  end

  end

  def destroy
    @like = Like.find_by(id:params[:id])
    @type = @like.likeable_type
    @id = @like.likeable_id

    if(@type == 'Micropost')
      @micropost = Micropost.find_by(id: @id)
    elsif @type == 'Comment'
      @comment = Comment.find_by(id: @id)
    end

    Like.destroy(params[:id])
  end

end
