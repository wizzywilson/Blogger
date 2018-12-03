class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(id:params[:id])
    @microposts = @tag.microposts.paginate(page: params[:page])

    respond_to do |format|
      format.js { render 'home/index.js.erb' }
    end

  end

end
