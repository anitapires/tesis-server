require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'models/drawing'
require_relative 'models/section'
require_relative 'models/point'


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
    json "WeDraw API"
  end

  get '/drawings' do
    json Drawing.all
  end

  #get '/create-drawing' do
    #Drawing.create({
      #created_at: nil, 
      #sections_attributes:[
        #color: '#ff0000',
        #points_attributes:[
          #{ latitude: -34.9215272, longitude: -57.9632371},
          #{ latitude: -34.9215273, longitude: -57.9632372},
          #{ latitude: -34.9215274, longitude: -57.9632373},
        #]
      #]
    #});
  #end

  options '/drawings' do
  end

  post '/drawings' do
    puts "Hola #{params}!"
    # Drawing.create({ sections_attributes:[ { color: xxx, points_attributes:[ { latitude: xxx, longitude: yyy } ] } ]})

    # Drawing.create({ sections_attributes: params[sections] })
  end
end
