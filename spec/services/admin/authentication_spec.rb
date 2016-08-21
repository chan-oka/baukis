require 'rails_helper'

RSpec.describe Admin::Authenticator do
	describe '#authenticator' do
		example '正しいパスワードならtrue返す' do
			m = build(:administrator)
			expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
		end

		example '誤ったパスワードならfalse返す' do
			m = build(:administrator)
			expect(Admin::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'パスワード未設定ならfalse返す' do
			m = build(:administrator, password: nil)
			expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
		end

		example '停止フラグが立っていてもtrue' do
			m = build(:administrator, suspended: true)
			expect(Admin::Authenticator.new(m).authenticate('pw')).to be_truthy
		end
	end
end