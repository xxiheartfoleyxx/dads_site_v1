require 'sinatra'

get '/' do
  File.read(File.join("Public", "dads_site2.html"))
end
