# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'httparty'
#res = HTTParty.get('http://boone.fluv.net:80');
res = HTTParty.get('https://chippy.ch/files/wines.txt');
data = JSON.parse(res.body)

data.each do |datum|
    Wine.create(datum)
end
