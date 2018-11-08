class MicropostsController < ApplicationController
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    Micropost.destroy(params[:id])
    redirect_to root_path
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
end
