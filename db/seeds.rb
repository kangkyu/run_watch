# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Task.delete_all
start = Date.new(2010,7,11)
# most_recent = Date.new(2014,7,6)
# (most_recent - start)/7 + 1 => 209/1
(1..209).each_with_index do |num, i|
  Task.find_or_create_by(date: DateTime.parse((start + i*7).to_s))
end

def date_cancel(date)
  Task.find_by_date(DateTime.parse(date)).update(title: 'cancel')
end

def date_casts(episode_range, start_date)
  start = DateTime.parse(start_date)
  episode_range.each_with_index do |num, i|
    Task.find_by_date(DateTime.parse((start + i*7).to_s)).update(episode: num)
  end
end

date_casts(1..13, "2010-07-11")

date_cancel("2010-10-10") # 2010-10-10 cancel
date_casts(14..17, "2010-10-17")

date_cancel("2010-11-14") # 2010-11-14 cancel
date_casts(18..64, "2010-11-21")

date_cancel("2011-10-16") # 2011-10-16 cancel
date_casts(65..104, "2011-10-23")

date_cancel("2012-07-29") # 2012-07-29 cancel
date_casts(105..193, "2012-08-05")

date_cancel("2014-04-20")
date_cancel("2014-04-27") # 2014-04-20 2014-04-27 cancel
date_casts(194..203, "2014-05-04")


