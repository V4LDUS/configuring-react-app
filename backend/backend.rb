require 'sinatra'
require 'sinatra/json'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

data = {
    msg: "healthy"
}

get '/health' do
    return json(data)
end 