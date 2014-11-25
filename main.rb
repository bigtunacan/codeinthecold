require 'base64'
require 'rubygems'
require 'sinatra'

Dir["./helpers/*.rb"].each{|file| require file}
Dir["./routes/*.rb"].each{|file| require file}

get '/' do
  erb :index
end

get '/entries' do
  erb :entries
end

get '/blog' do
  erb :blog
end

get '/jobs' do
  erb :jobs
end

get '/organizers' do
  erb :organizers, :layout => :foobar
end

get '/contestants' do
  erb :contestants
end

get '/auth/signin' do
  'Coming Soon...'
end

get '/auth/register' do
  'Coming Soon'
end

get '/auth/twitter' do
  'Coming Soon'
end

get '/auth/admin' do
  'Coming Soon'
end

get '/rules' do
  erb :rules
end

get '/conduct' do
  erb :conduct
end
