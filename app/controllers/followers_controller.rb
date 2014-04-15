class FollowersController < ApplicationController

  def create
    @follower = User.find(params[:follower_id])
    @user = User.find(params[:user_id])
    @user.followers.create(follower_id: @follower.id)
    redirect_to users_path
  end

  def destroy
    @follower = User.find(params[:id])
    @user = User.find(params[:user_id])
    Follower.destroy_all({user_id: @user.id, follower_id: @follower.id})
    # @deleteme.destroy
    # @user.followers.destroy(@follower)
    redirect_to users_path
  end

  private
    # def follower_params
    #   params.require[:follower]
    # end

end
