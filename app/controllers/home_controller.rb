class HomeController < ApplicationController
  def index
    if current_user
      @user = User.find_by(id: current_user.id)
      @micropost = current_user.microposts.build if current_user
      @microposts = Micropost.where("user_id IN (?) OR user_id= ?", @user.following_ids,@user.id).paginate(page: params[:page]) if current_user

    end
  end

  def search

      search_term = params[:search_for]
      option = params[:radio]
      if option == 'Person'
        @results = User.where("first_name LIKE ?",search_term.upcase + '%')        
      end

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
