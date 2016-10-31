require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/cross_origin'
require 'sinatra/contrib'

require_relative 'models/drawing'
require_relative 'models/section'
require_relative 'models/stroke'
require_relative 'models/point'


class App < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  register Sinatra::CrossOrigin

  use Rack::MethodOverride

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

  # GET /drawings.(html|json)
  get '/drawings', provides: [:html, :json] do
    @drawings = Drawing.all

    respond_to do |format|
      format.json { json @drawings }
      format.html { erb :index}
    end
  end

  # GET /drawings.html
  get '/drawings/new' do
    @drawing = Drawing.new

    erb :new
  end

  post '/drawings', provides: [:html, :json] do

    respond_to do |format|
      format.json do
        drawing_data = JSON.parse(request.body.read)

        json Drawing.create({sections_attributes: drawing_data['sections']})
      end

      format.html do
        Drawing.create({ sections_attributes: params[:sections_attributes] })

        redirect to('/drawings')
      end
    end
  end

  get '/drawings/:id', provides: [:html, :json] do
    json Drawing.find(params[:id])
  end

  delete '/drawings/:id' do
    Drawing.destroy(params[:id])

    redirect to('/drawings')
  end

  options '*' do
    headers 'Allow' => "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    headers 'Access-Control-Allow-Headers' => "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

    status 200
  end
end
