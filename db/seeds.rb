# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'
suppliers = Array[
    'https://chippy.ch/files/wines.txt',
    'https://chippy.ch/files/wines2.txt'
]

suppliers.each { |url|
    res = HTTParty.get(url);
    data = JSON.parse(res.body)

    data.each do |datum|
        print '.'
        Wine.create(datum)
    end
}
puts 'done.'
