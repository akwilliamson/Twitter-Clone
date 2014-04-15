class UsersController < ApplicationController
  before_action :must_login,  only: [:new]

  def index
    @users = User.all.reject {|x| x == current_user }
    @leaders = Follower.pluck(:user_id)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.find(:all, :order => 'created_at').reverse
    @tweet = Tweet.new

    @leaders = Follower.pluck(:user_id)
    # breakerasdfa
    feed_tweets = []
    Tweet.all.each do |tweet|
      if @leaders.include?(tweet.user_id)
        feed_tweets << tweet
      end
    end

    @feed_tweets = feed_tweets.sort_by &:created_at
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
