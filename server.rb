require 'sinatra'

get '/' do
  File.read(File.join("public", "dads_site2.html"))
end
