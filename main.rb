require 'config/config'
require 'base64'
require 'rubygems'
require 'sinatra'

#TODO:  The following really only need in dev
require 'byebug'
require 'sqlite3'

Dir["./helpers/*.rb"].each{|file| require file}
Dir["./routes/*.rb"].each{|file| require file}

enable :sessions
set :sessions, :expire_after => 3600
# TODO: get the database stuff setup
#case ENV['sinenv']
#when 'dev'
  #byebug
#when 'production'
  #byebug
#end

get '/' do
  erb :index, :locals => vars
end

#TODO:
get '/entries' do
  erb :entries
end

#TODO:
get '/blog' do
  erb :blog
end

#TODO:
get '/jobs' do
  erb :jobs
end

#TODO: Go back to the standard layout or something here...
get '/organizers' do
  erb :organizers, :layout => :foobar
end

#TODO:
get '/contestants' do
  erb :contestants
end

# Basic user authentication that stores
# info in a cookie.
post '/auth/auth' do
  errors = []
  user = $DB[:users][:username => params["user"]]
  if user
    if $cipher.dec(user[:password]) == params["pass"]
      session[:user] = params["user"]
      session[:password] = params["password"]
      redirect "/"
    else
      errors << "Invalid username or password combination"
      status 401 #unauthorized
      redirect "/auth/unauthorized"
    end
  else
    errors << "Invalid username or password combination"
    status 401 #unauthorized
    redirect "/auth/unauthorized"
  end

end

# TODO
get "/auth/unauthorized" do

end

get '/auth/signin' do
  erb :"auth/signin", :layout => false
end

get '/auth/logout' do
  reset_session
  redirect "/"
end

get '/auth/register' do
  erb :"auth/register", :layout => false
end

#TODO: Enable registration
post '/auth/register' do
  byebug
  redirect "/"
end

#TODO:
get '/auth/twitter' do
  'Coming Soon'
end

#TODO:
get '/auth/admin' do
  'Coming Soon'
end

#TODO:
get '/rules' do
  erb :rules
end

#TODO:
get '/conduct' do
  erb :conduct
end
