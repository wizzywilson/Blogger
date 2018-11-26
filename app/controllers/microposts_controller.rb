class MicropostsController < ApplicationController
  protect_from_forgery


  def create

    @micropost = current_user.microposts.build(micropost_params)

    if @micropost.save
      flash[:success] = "Micropost created!"
      tags = params[:micropost][:tags]
      tags.delete('')



      tags.each do |tag|
        @tag = Tag.find_by(name: tag)

        @tag = Tag.create(name: tag) if @tag == nil

        @micropost.micropost_tags.build(tag_id: @tag.id).save
      end

      redirect_to request.env["HTTP_REFERER"]

    else
      redirect_to request.env["HTTP_REFERER"]

    end
  end

  def show
    @microposts = [Micropost.find_by(id:params[:id])]
      render 'microposts/_micropost'
  end

  def destroy
    Micropost.destroy(params[:id])
    redirect_to request.env["HTTP_REFERER"]

  end


  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :title,:access)
    end
end
