class User < ActiveRecord::Base
	has_many :shopping_lists
	def self.find_or_create_from_auth(auth)
		user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

		user.name = auth.info.name
		user.nickname = auth.info.nickname
		user.image_url = auth.info.image
		user.token = auth.credentials.token
		user.save
		user
	end
end
