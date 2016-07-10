require 'sinatra/base'
require 'pony'

get '/' do
  File.read(File.join("Public", "dads_site2.html"))
end

post '/' do
  configure_pony
  name = params[:name]
  sender_email = params[:email]
  message = params[:message]
  logger.error params.inspect
  begin
    Pony.mail(
      :from => "#{name}<#{sender_email}>",
      :to => 'mgualtieri7@gmail.com',
      :subject =>"#{name} has contacted you",
      :body => "#{message}",
    )
    redirect '/success'
  rescue
    @exception = $!
    erb :boom
  end
end

def configure_pony
  Pony.options = {
    :via => :smtp,
    :via_options => {
   :address              => 'aspmx.l.google.com',
   :port                 => '587',
   :enable_starttls_auto => true,
   :user_name            => 'user',
   :password             => 'password',
   :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
   :domain               => "http://localhost:4567" # the HELO domain provided by the client to the server
    }
  }
end
