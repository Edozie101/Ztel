require 'sinatra'
require 'socket'
ip = IPSocket.getaddress(Socket.gethostname)
local_ip = UDPSocket.open {|s| s.connect("64.233.187.99", 1); s.addr.last}
iphash = system("curl", 'https://api.ipify.org?format=json')

puts ip
puts local_ip
puts iphash
get '/' do
  erb :index
end
get '/users' do
  erb :users
end

post '/login' do
  require 'mechanize'
  require 'logger'
  puts "it starts here"
  user =  params[:user]
  password =  params[:password ]

    agent = Mechanize.new do |a|
      # a.set_proxy( "zegtel.atmailcloud.com/index.php" ,443)

    end
    # Getting a logger for the mechanize classie
    agent.log = Logger.new("mech.log")
    #set up the alias as a Mac safari
    agent.user_agent_alias = "Mac Safari"


    page = agent.get("https://zegtel.atmailcloud.com")
    # a.add_auth(page.uri, user, password)

    form = page.form_with :name => "loginPage"
    form.field_with(:name => "email").value = user
    form.field_with(:name => "password").value = password
    # npage = form.submit
    puts "here is the PAGEEEEEEEE __>>>>"
    # npage.to_s
    puts "here is the URLLLLLL __>>>>"
    # puts npage.uri
  redirect "#{page.uri}"
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
