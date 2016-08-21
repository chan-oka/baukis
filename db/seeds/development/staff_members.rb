StaffMember.create(
	email: 'taro@example.com',
	family_name: '山田',
	given_name: '太郎',
	family_name_kana: 'ヤマダ',
	given_name_kana: 'タロウ',
	password: 'password',
	start_date: Date.today
)

StaffMember.create(
	email: 'taro2@example.com',
	family_name: '山田2',
	given_name: '太郎2',
	family_name_kana: 'ヤマダ2',
	given_name_kana: 'タロウ2',
	suspended: 1,
	password: 'password',
	start_date: Date.today
)