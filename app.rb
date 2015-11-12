require 'sinatra'

get '/' do
  erb :index
end
get '/users' do
  erb :users
end

post '/login' do
  puts params
end

post '/mail' do
  require 'pony'

  name = params["fullName"]
  email = params["email"]
  phone = params["phone"]
  subject = name + " has contacted you about ZegTel"
  body = params["message"]
  puts name + " hello world"
  Pony.mail(
  # unless params[:name] == '' || params[:email] == '' || params[:content] == ''
    :from => 'edzye101@gmail.com',
    :subject => subject,
    :body => body + "\n" + "email : #{email} \n phone: #{phone}",
    :to => "edzye101@gmail.com",
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
)
end
