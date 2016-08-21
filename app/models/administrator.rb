class Administrator < ActiveRecord::Base
	before_validation do
		self.email_for_index = email.downcase if email
	end

	def password=(raw_password)
		# Stringオブジェクトかチェック
		if raw_password.kind_of?(String)
			# パスワードをハッシュ化
			self.hashed_password = BCrypt::Password.create(raw_password)
		elsif raw_password.nil?
			self.hashed_password = nil
		end
	end
end
