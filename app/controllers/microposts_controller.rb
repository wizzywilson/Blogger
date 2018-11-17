class MicropostsController < ApplicationController
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to request.env["HTTP_REFERER"]

    else
      redirect_to request.env["HTTP_REFERER"]

    end
  end

  def destroy
    Micropost.destroy(params[:id])
    redirect_to request.env["HTTP_REFERER"]

  end


  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
end
