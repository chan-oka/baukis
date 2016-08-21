require 'rails_helper'

RSpec.describe Staff::Authenticator do
	describe '#authenticator' do
		example '正しいパスワードならtrue返す' do
			m = build(:staff_member)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
		end

		example '誤ったパスワードならfalse返す' do
			m = build(:staff_member)
			expect(Staff::Authenticator.new(m).authenticate('xy')).to be_falsey
		end

		example 'パスワード未設定ならfalse返す' do
			m = build(:staff_member, password: nil)
			expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
		end

		example '停止フラグが立っていてもtureを返す' do
			m = build(:staff_member, suspended: true)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
		end

		example '開始前ならfalse返す' do
			m = build(:staff_member, start_date: Date.tomorrow)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
		end

		example '終了後ならfalse返す' do
			m = build(:staff_member, end_date: Date.today)
			expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
		end
	end
end