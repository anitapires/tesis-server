require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/json'

require_relative 'models/drawing'
require_relative 'models/section'
require_relative 'models/point'


class App < Sinatra::Base

  register Sinatra::ActiveRecordExtension

  configure :production, :test do
    set :bind, '0.0.0.0'
  end


  before do
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*',
           'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
           'Access-Control-Allow-Headers' => 'Content-Type'
  end

  get '/' do
    json "WeDraw API"
  end

  get '/drawings' do
    json Drawing.all
  end

  get '/drawings/:id' do
    json Drawing.find(params[:id])
  end

  get '/drawings/:id/delete' do
    Drawing.destroy(params[:id])
    "Destruido dibujo con ID ##{params[:id]}"
  end

  options '/drawings' do
  end

  post '/drawings' do
    puts "Hola #{params}!"
    # Drawing.create({ sections_attributes:[ { color: xxx, points_attributes:[ { latitude: xxx, longitude: yyy } ] } ]})

    # Drawing.create({ sections_attributes: params[sections] })
  end
end
