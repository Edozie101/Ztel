# configure :production, :development do
#   db = URI.parse(ENV['DATATBASE_URL'] || "postgres://localhost/mydb")
#
#   ActiveRecord.Base.establish_connection (
#               :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
#               :host => db.host,
#               :username => db.user,
#               :password => db.password,
#               :database => db.path[1..-1],
#               :encoding => 'uft8'
#
#
#
#
#   )
# end
