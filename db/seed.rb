require 'sequel'
require 'gibberish'

case ENV['sinenv']
when 'dev'
  #TODO: Get this setup for prod
  DB = Sequel.sqlite('./cold.db')
  #DB = Sequel.postgres(:host=>'localhost', :user=>'joieyseeley', :password=>'monkey69', :database=>'hackathon', :port => '5433')
when 'prod'
  DB = Sequel.sqlite('./cold.db')
end

users = DB[:users]

#TODO: Move into common settings/config
cipher = Gibberish::AES.new(ENV["sincipher"])

users.insert(username: 'jseeley', password: cipher.enc('s3cur1t7'), role: 'admin', email: 'joiey.seeley@gmail.com')
users.insert(username: 'zsanderson', password: cipher.enc('s1mpl3p@55'), role: 'admin', email: 'zachary-sanderson@uiowa.edu')

