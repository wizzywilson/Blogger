class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id:params[:id])
    @microposts = @tag.microposts

    render 'microposts/_micropost'
  end

end
