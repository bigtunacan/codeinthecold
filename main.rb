require 'config/config'
require 'base64'
require 'rubygems'
require 'sinatra'
require 'rack-flash'

#TODO:  The following really only need in dev
require 'byebug'
require 'sqlite3'

Dir["./helpers/*.rb"].each{|file| require file}
Dir["./routes/*.rb"].each{|file| require file}

enable :sessions
set :sessions, :expire_after => 3600
use Rack::Flash

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
get '/admin/blog' do
  'Coming soon...'
end

#TODO: Add some validation and other goodness
# eventually, but for now this will work.
post '/admin/blog' do
  user_id = $DB[:users].first(:username => session["user"])[:id]
  $DB[:blog_postings].insert(:user_id => user_id, :title => params["title"], :body => params["body"], :category => params["category"], :created => Time.now.to_s)
  flash[:notice] = "#{params["category"]} entry created."
  redirect "/admin/index"
end

#TODO:
get '/blog' do
  byebug
  posts = $DB[:blog_postings].where(:category => "blog_post").order(Sequel.desc(:created_at))
  posts.each do |post|
    #TODO: Render blog posts from markdown here...
  end

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
      flash[:notice] = "Invalid username or password combination"
      status 401 #unauthorized
      redirect "/auth/signin"
    end
  else
    status 401 #unauthorized
    flash[:notice] = "Invalid username or password combination"
    redirect "/auth/signin"
  end

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
get '/admin/index' do
  erb :"admin/index", :layout => false
  #erb :"auth/register", :layout => false
end

#TODO:
get '/rules' do
  erb :rules
end

#TODO:
get '/conduct' do
  erb :conduct
end
