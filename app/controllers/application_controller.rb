require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "application_secret"
  end

  get "/" do
    erb :"/index",:layout => "/layout2".to_sym
  end



end
