require 'sinatra'

get '/' do
  set :public_folder, File.join(APP_ROOT, "Public")
  File.read(File.join("Public", "dads_site2.html"))
end
