class Twit < ApplicationRecord
	belongs_to :user

	validates :message, presence: true
	validates :message, length: {maximum: 140, too_long: "A twit can only contain 140 charrictors"}
end
