class UserMailer < ApplicationMailer
	def new_comment(comment_id)
		@comment=Comment.find(comment_id)
		to_email=@comment.post.user.email
		mail(
			to: 'mandeep.sidhu2@gmail.com',
			#to: to_email,
			subject: 'New Comment On Your Post'
			)
	end
end
