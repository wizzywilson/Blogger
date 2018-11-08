class HomeController < ApplicationController
  def index
    if current_user
      @user = User.find_by(id: current_user.id)
      @micropost = current_user.microposts.build if current_user
      @microposts = Micropost.paginate(page: params[:page]) if current_user
    end
  end

  def search
    @users = User.paginate(page: params[:page])
  end

  def destroy_user
    if current_user.admin
      User.find(params[:id]).destroy
      redirect_to home_search_path
    end
  end

  def add_admin
    if current_user.admin
      @user = User.find(params[:id])
      @user.update_attributes(admin: true)
      redirect_to home_search_path
    end
  end
end