class EpicenterController < ApplicationController
  def feed
  	@following_twits = []

  	Twit.all.order(created_at: :desc).each do |twit|
  		if current_user.following.include?(twit.user_id) || current_user.id == twit.user_id
  			@following_twits.push(twit)
  		end
  	end
  end

  def all_users
    @users = User.all 
    # User.order(:name) add a feature
  end

  def show_user
  	@user = User.find(params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
    end
  end

  def tag_twits
    @tag = Tag.find(params[:id])
  end

  def now_following
  	current_user.following.push(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end

  def unfollow
  	current_user.following.delete(params[:id].to_i)
  	current_user.save

  	redirect_to show_user_path(id: params[:id])
  end
end
