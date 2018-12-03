class CommentsController < ApplicationController
  def create
    if params[:type] == 'replies'

      @parent = Comment.find_by(id:params[:id])
      Comment.create(content:params[:content],user_id: current_user.id,micropost_id:@parent.micropost_id,parent_id:@parent.id)
      @type = 'comment'
      @id = params[:id]
      comment = @parent

    else
      @micropost = Micropost.find_by(id:params[:id])
      @comment = @micropost.comments.build(content:params[:content], user_id: current_user.id)
      @comment.save
      @type = 'micropost'
      @id = params[:id]

    end
  end

  def update

    if params[:type] == 'delete'

      @comment=Comment.find_by(id:params[:id])
      @comment.deleted = true
      @comment.save


      if @comment.parent == nil
        @type = 'micropost'
        @micropost = @comment.micropost
        @id = @micropost.id
      else
        @parent = @comment.parent
        @type = 'comment'
        @id = @comment.id
      end

      respond_to do |format|
        format.js { render 'create.js.erb' }
      end

    else
      @comment=Comment.find_by(id:params[:id])
      @comment.content=params[:content]
      @comment.save

      if @comment.parent == nil
        @type = 'micropost'
        @micropost = @comment.micropost
        @id = @micropost.id
      else
        @parent = @comment.parent
        @type = 'comment'
        @id = @comment.id
      end

      respond_to do |format|
        format.js { render 'create.js.erb' }
      end
    end

  end

  def autocomplete

  end

end
