module ApplicationHelper
	def profile_pic(user)
		if user.autopic != nil
			user.autopic
		elsif user.avatar.url != nil
			user.avatar.url
		else
			'default.png'
		end
	end

	def random_twit
		if User.where(bot: true).count > 0
			twiter = User.find(User.where(bot: true).pluck(:id).sample)
			Twit.create!(message: Faker::TwinPeaks.quote, user_id: twiter.id)
		end
	end
end
