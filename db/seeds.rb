# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: 'test@acount', password: '201909')

Notice.create!(
	[
		{
			judgement: false,
			reason: '追放されていない'
		},
		{
			judgement: true,
			reason: '迷惑行為'
		},
		{
			judgement: true,
			reason: '誹謗中傷'
		},
		{
			judgement: true,
			reason: 'その他'
		}
	]
)

Genre.create!(
	[
		{
			genre_name: '運動系'
		},
		{
			genre_name: '頭脳系'
		},
		{
			genre_name: '作る系'
		},
		{
			genre_name: '学ぶ系'
		},
		{
			genre_name: '自然系'
		},
		{
			genre_name: 'その他'
		}
	]
)

Level.create!(
	[
		{
			level_point: 0
		}
	]
	)

99.times do |n|
	Level.create(level_point: 3 * (n + 1) + Level.find(n + 1).level_point)
end