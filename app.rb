require 'sinatra'
#require 'sinatra/activerecord'
require 'sinatra/json'

#require_relative 'models/drawing'
#require_relative 'models/section'


class App < Sinatra::Base

  configure :production, :test do
    set :bind, '0.0.0.0'
  end


  before do
    content_type :json    
    headers 'Access-Control-Allow-Origin' => '*', 
           'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
           'Access-Control-Allow-Headers' => 'Content-Type'  
  end
 
  set :protection, false  

  get '/' do
    "Hello World"
  end

  options '/drawings' do
    
  end

  get '/drawings' do
    json Drawing.all
  end
  
  post '/drawings' do
    puts "Hola #{params}!"
  end
end
