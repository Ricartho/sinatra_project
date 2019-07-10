class ArticlesController < ApplicationController

    get "/articles" do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        @articles = Article.where(user_id: session[:user_id])
        erb "/articles/index".to_sym
      else
        redirect to "/login"
      end
    end
end
