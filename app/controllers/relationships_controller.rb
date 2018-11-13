class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    @relationship = Relationship.new(relationship_params)
    @relationship.save
    redirect_to account_path(@user)
 end

 def destroy
   @user = User.find_by(id:Relationship.find_by(id:params[:id]).followed_id)
   Relationship.destroy(params[:id])
   redirect_to account_path(@user)
 end

private

def relationship_params
  {follower_id:current_user.id,followed_id:@user.id}
end

end
