require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'models/drawing'
require_relative 'models/section'


class App < Sinatra::Base
  configure :production, :test do
    set :bind, '0.0.0.0'
  end
  
  get '/drawings' do
    json Drawing.all
  end
  
  post '/drawings' do
    json message: "TODO"
  end
end
