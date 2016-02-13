# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
						{ name: 't2', email: 't2@gmail.com', password: 't2', image_url: 'http://images.clipartpanda.com/question-mark-black-and-white-Icon-round-Question_mark.jpg' },
						{ name: 't1', email: 't1@gmail.com', password: 't1', image_url: 'http://images.clipartpanda.com/question-mark-black-and-white-Icon-round-Question_mark.jpg' }
						 ])
Trip.create([ 
						{name: 'trip1',lng: '-73.98',lat: '40.74',trip_date: '2016-03-01',description: 'This is test comment, ba bab ab aba',user_id: 1},
						{name: 'trip2',lng: '-73.88',lat: '40.64',trip_date: '2016-03-07',description: 'This is test comment, ba bab ab aba',user_id: 2}
							])
Comment.create([ 
						{comment: 'This is test comment, ba bab ab aba', user_id: 1,trip_id: 1},
						{comment: 'This is test comment, ba bab ab aba', user_id: 2,trip_id: 2}
							])
Invitation.create([ 
						{email: 't1@gmail.com',trip_id: 1, user_name: 't2',user_email: 't2@gmail.com'},
						{email: 't2@gmail.com',trip_id: 2, user_name: 't1',user_email: 't1@gmail.com'}
							])
TripUserList.create([ 
						{user_id: 1, trip_id: 1},
						{user_id: 1, trip_id: 2},
						{user_id: 2, trip_id: 2}
							])