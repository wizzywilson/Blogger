class AccountsController < ApplicationController
  def show
    @user = User.find_by(id:params[:id])
    @microposts = Micropost.where("user_id= ?", @user.id).paginate(page: params[:page]) if current_user
  end


end
