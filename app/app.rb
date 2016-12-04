ENV['RACK_ENV'] ||='development'
require 'sinatra/base'
require_relative './models/tweet'
require_relative './models/user'


class Twitter < Sinatra::Base
  enable :session
  set :session_secret, 'super secret'


  get '/' do
  end

  get '/twitter' do
    @tweets = Tweet.all
    erb :'index'
  end

  get '/users/new' do
    erb :'sign_up'
  end


  post '/users' do
    User.create(email: params[:email], username: params[:username],
              password_method2: params[:password])
    redirect '/twitter'
  end

  get '/tweets/new' do
    erb :'new_tweet'
  end

  post '/twitter' do
    Tweet.create(message: params[:message])
    redirect '/twitter'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
