class UsersController < ApplicationController
    get "/signup" do
      erb "/users/signup".to_sym,:layout => "/layout2".to_sym
    end

    post "/signup" do
      user = User.new(:email => params[:email],:password => params[:password],:pseudo => params[:pseudo])
      if user.save #verify whether the new user is create
        session[:user_id] = user.id
        redirect to "/home"
      else
      #  redirect to "/signup"
       "failed"
      end
    end

    get "/login"  do
        erb "/users/login".to_sym,:layout => "/layout2".to_sym
      end

    post "/login" do
      user = User.find_by(:pseudo => params[:pseudo])
       if user && user.authenticate(params[:password])
         session[:user_id] = user.id
         redirect to "/home"
       else
         #redirect to "/login"
         "failed"
       end
    end

    get "/home" do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        @articles = Article.all
        erb "/users/home".to_sym
      else
        redirect to "/login"
      end
    end

    get "/logout" do
      if Helpers.is_logged_in?(session)
        session.clear
        redirect to "/login"
      else
        redirect to "/"
      end
    end
    get "/profil" do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        erb "/users/profil".to_sym
      else
        redirect to "/login"
      end
    end


end
