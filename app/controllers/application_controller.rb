require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "application_secret"
  end

  get "/"  do
    erb "/welcome".to_sym
  end
  # get "/signup" do
  #   erb "/signup".to_sym
  # end
  # get "/" do
  # 	@articles = Article.all
  # 	@categories = Category.all
  # 	@clients = Client.all
  # 	@images = Image.all
  #   erb "/welcome".to_sym
  # end

  # get "/index_articles/:id" do
  # 	@article = Article.find(params[:id])
  # 	erb "/show".to_sym ,:layout => "/show".to_sym
  # end

end
