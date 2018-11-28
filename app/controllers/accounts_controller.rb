class AccountsController < ApplicationController
  def show
    @micropost =nil;
    @user = User.find_by(id:params[:id])

    current_user != @user ? @microposts =Micropost.where("user_id= ? and access=?", @user.id,"Public").paginate(page: params[:page]): @microposts = Micropost.where("user_id= ?", @user.id).paginate(page: params[:page])
  end


end
