# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

start = Date.new(2010,7,11)
# most_recent = Date.new(2014,7,6)

(0..10).each do |i|
Task.find_or_create_by(date: DateTime.parse((start + i*7).to_s))
end

# (start..most_recent).step(7) do |date|
#   Task.find_or_create_by_date(date)
# end
# Task.find_or_create_by(date: start)