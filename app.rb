require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cross_origin'
require 'sinatra/json'

require_relative 'models/drawing'
require_relative 'models/section'
require_relative 'models/stroke'
require_relative 'models/point'


class App < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin

    set :allow_origin, :any
    set :allow_methods, [:get, :post, :options]
    set :expose_headers, ['Content-Type']
    set :allow_credentials, true
  end

  configure :production, :test do
    set :bind, '0.0.0.0'
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

  options '*' do 
    headers 'Allow' => "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    headers 'Access-Control-Allow-Headers' => "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

    status 200
  end

  post '/drawings' do
    drawing_data = JSON.parse(request.body.read)
    
    json Drawing.create({sections_attributes: drawing_data['sections']})
  end

  get '/prueba_geo' do
    erb :geo
  end
end
