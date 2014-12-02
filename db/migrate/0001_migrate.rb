#require 'sequel'
#require 'gibberish'

#case ENV['sinenv']
#when 'dev'
  ##TODO: Get this setup for prod
  #DB = Sequel.sqlite('./cold.db')
  ##DB = Sequel.postgres(:host=>'localhost', :user=>'joieyseeley', :password=>'monkey69', :database=>'hackathon', :port => '5433')
#when 'prod'
  #DB = Sequel.sqlite('./cold.db')
#end

Sequel.migration do
  up do
    create_table :users do
      primary_key :id
      String :username
      String :password
      String :role
      String :email
    end

    create_table :blog_postings do
      primary_key :id
      foreign_key :user_id, :users
      String :title
      String :body, :text => true
      String :category, :text => true
      DateTime :created
    end

    #create_table :jobs do
      #primary_key :id
      #String :title
      #String :body, :text => true
    #end
  end

  down do
    drop_table :users
    drop_table :blog_postings
    #drop_table :jobs
  end
end

#users = DB[:users]

##TODO: Move into common settings/config
#cipher = Gibberish::AES.new(ENV["sincipher"])

#users.insert(username: 'jseeley', password: cipher.enc('s3cur1t7'), role: 'admin', email: 'joiey.seeley@gmail.com')
#users.insert(username: 'zsanderson', password: cipher.enc('s1mpl3p@55'), role: 'admin', email: 'zachary-sanderson@uiowa.edu')

