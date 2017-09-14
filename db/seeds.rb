# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

New.create(title: 'Grenfell inquiry ‘can and will get answers’', author: 'Neil Johnston and Sean O’Neill', body: "The chairman of the Grenfell Tower inquiry said this morning that he would not “shrink away” from making judgments that could
implicate people and organisations.As he opened the public inquiry into the disaster that killed at least 80 people Sir Martin Moore-Bick sought to reassure survivors that the investigation could and would provide answers.
The retired judge was heckled by residents at the conclusion of his statement after he refused to take a “quick request on behalf of survivors” from Michael Mansfield QC.
Sir Martin had earlier revealed that his first report, which will examine how the fire spread and which could have implications for those living in tower blocks across the country, was not likely to be published until Easter. He added that…")

%w[viewer moderator admin banned].each do |role|
  Role.find_or_create_by(name: role)
end
