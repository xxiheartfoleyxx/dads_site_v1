require 'sinatra'

get '/this' do
  "Hello World"
end

get '/' do
  File.read(File.join("Public", "dads_site2.html"))
end
