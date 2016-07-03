require 'sinatra'

get '/' do
  File.read(File.join("Public", "dads_site2.html"))
  set :public_folder, File.join(APP_ROOT, "Public")
end
