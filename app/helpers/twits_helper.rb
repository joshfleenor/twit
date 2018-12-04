module TwitsHelper
	def anchor_hash(twit)
		message_arr = Array.new
		message_arr = twit.message.split
	    message_arr.each_with_index do |word, index|
	      if word[0] == "#"
	        if Tag.pluck(:phrase).include?(word.downcase)
	          tag = Tag.find_by(phrase: word.downcase)
	        else
	          tag = Tag.create(phrase: word.downcase)
	        end
	        twit_tag = TwitTag.create(twit_id: twit.id, tag_id: tag.id)
	        message_arr[index] = "<a href='/tag_twits?id=#{tag.id}'>#{word}</a>"
	      end
	    end

	    twit.update(message: message_arr.join(" "))
	    return twit
	end
end
