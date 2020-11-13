# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

details = {'netflix': 'https://github.com/netflix',
'facebook': 'https://github.com/facebook',
'flock': 'https://github.com/flock',
'tesla': 'https://github.com/tesla'
}

details.each do |name, url|
  Repo.create(name: name, url: url)
end
