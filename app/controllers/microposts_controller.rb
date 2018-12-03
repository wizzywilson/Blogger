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
    @microposts = Micropost.paginate(page: params[:page]).where("id = ?", params[:id])


    respond_to do |format|
      format.js { render 'home/index.js.erb' }
    end

  end

  def destroy
    @id = params[:id]
    Micropost.destroy(params[:id])

  end

  def edit
    @micropost = Micropost.find_by(id:params[:id])
    @tags = @micropost.tags

  end

  def update
    @micropost = Micropost.find_by(id:params[:id])
    @micropost.update(micropost_update_params)

    @micropost.micropost_tags.destroy_all

    tags = params[:micropost][:tags]
    tags.delete('')



    tags.each do |tag|
      @tag = Tag.find_by(name: tag)

      @tag = Tag.create(name: tag) if @tag == nil

      @micropost.micropost_tags.build(tag_id: @tag.id).save
    end



    @micropost = Micropost.new
    redirect_to request.env["HTTP_REFERER"]


  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture, :title,:access)
    end

    def micropost_update_params
      params.require(:micropost).permit(:content, :picture, :title,:access,:tags)
    end

end
