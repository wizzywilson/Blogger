class HomeController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def index
    if current_user
      @user = User.find_by(id: current_user.id)
      @micropost = current_user.microposts.build if current_user
      @microposts = Micropost.where("(user_id IN (?) AND access=?) OR user_id= ? ", @user.following_ids,"Public",@user.id).paginate(page: params[:page]) if current_user
    end
  end

  def search

      search_term = params[:search_for]
      @option = params[:radio]
      if @option == 'Person'
        @results = User.where("first_name ILIKE ?  ",search_term + '%')
      elsif @option == 'Post'
        @results = Micropost.where("title ILIKE ? and (access = ? OR user_id = ?) ",search_term+'%',"Public",current_user.id)
      elsif @option == 'Tag'

        @results = Tag.where("name ILIKE ?  ",search_term+ '%')
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
