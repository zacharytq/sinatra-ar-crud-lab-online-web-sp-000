
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end


  get '/articles/new' do
    erb :new
  end

  post "/articles" do
    id = Article.create(params).id
    redirect "/articles/show/#{id.to_s}"
  end

  get "/articles/show/:id" do
    @post = Article.find(params["id"])
    erb :show
  end

end
