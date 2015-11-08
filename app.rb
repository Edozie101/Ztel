require 'sinatra'

get '/' do
  erb :index
end

post '/mail' do
  require 'pony'
  Pony.options = {
  # unless params[:name] == '' || params[:email] == '' || params[:content] == ''
    :subject => "Some Subject",
    :body => "This is the body.",
    :to => "edzye101@gmail.com"
    :via => :smtp,
    :via_options => {
      :address => 'smtp.sendgrid.net',
      :port => '587',
      :domain => 'heroku.com',
      :user_name => ENV['SENDGRID_USERNAME'],
      :password => ENV['SENDGRID_PASSWORD'],
      :authentication => :plain,
      :enable_starttls_auto => true
  }
}
  # end
redirect '/'
end
