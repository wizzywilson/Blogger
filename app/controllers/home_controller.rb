class HomeController < ApplicationController
  def index
    if current_user
      @user = User.find_by(id: current_user.id)
    end
  end
end
