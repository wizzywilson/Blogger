class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id:params[:id])
    @microposts = @tag.microposts.paginate(page: params[:page])

    render 'home/_view_post_tags'

  end

end
