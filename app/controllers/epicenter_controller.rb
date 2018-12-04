class EpicenterController < ApplicationController
  def feed
  	@following_twits = []

  	Twit.all.each do |twit|
  		if current_user.following.include?(twit.user_id) || current_user.id == twit.user_id
  			@following_twits.push(twit)
  		end
  	end
  end

  def show_user
  	@user = User.find(params[:id])
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
