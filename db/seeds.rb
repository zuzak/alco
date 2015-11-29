# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Wine.create!(
    name: 'Contoso Basics Alcohol-Free Wine',
    desc: %{This exclusive wine has a taste directly in line with its
        price-point. Expect cheap flavours of disappointment, with a
        faint taste of copper-plated steel from the loose change in
        your pocket.},
    price: 0.49,
    short_desc: 'Wine perfect for the less-than-discerning customer',
    supplier: 'Contoso',
    origin: 'us',
    vegetarian: false
)

