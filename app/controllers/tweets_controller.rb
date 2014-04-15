class TweetsController < ApplicationController
  skip_before_action :must_login,  only: [:index, :new]
  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.create(tweet_params)

    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end

  end

  private
    def tweet_params
      params.require(:tweet).permit(:message, :photo)
    end

end
