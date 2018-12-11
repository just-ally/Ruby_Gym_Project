require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/workout.rb')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb(:"members/index")
end

get '/members/new' do
  erb(:"members/new")
end

post '/members' do
  member = Member.new(params)
  member.save()
  redirect to("/members")
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  @gymclasses = @member.gymclasses()
  erb(:"members/show")
end

post '/members/:id/delete' do
  @member = Member.find(params['id'])
  @member.delete
  redirect to("/members")
end

#should this be post or get??? get in previous
get '/members/:id/edit' do
  @member = Member.find(params[:id].to_i)
  @member_options = ["Yes", "No"]
  erb(:"members/edit")
end

post '/members/:id' do
  @member = Member.new(params)
  @member.update()
  redirect to ("/members")
end
