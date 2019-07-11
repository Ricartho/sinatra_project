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

    get "/articles/new" do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        @categories = Category.all
        @authors = Author.all
        erb "/articles/new".to_sym
      else
          redirect to "/login"
      end
    end

    post "/articles" do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        @article = Article.new(params[:article])
        if @article.valid?
          @article.save
          redirect to "/articles"
        else
         ##deal with validations
        end
      else
        redirect to "/login"
      end
    end

    get "/articles/:id" do
      if Helpers.is_logged_in?(session)
        @article = Article.find(params[:id])
        @user = User.find(session[:user_id])
        erb "/articles/show".to_sym
      else
        redirect to "/login"
      end
    end

    get "/articles/:id/edit" do
      if Helpers.is_logged_in?(session)
        @article = Article.find(params[:id])
        @user = User.find(session[:user_id])
        @categories = Category.all
        @authors = Author.all
        erb "/articles/edit".to_sym
      else
        redirect to "/login"
      end
    end

    patch "/articles/:id" do
      if Helpers.is_logged_in?(session)
        @article = Article.find(params[:id])
        @user = User.find(session[:user_id])
        if @article.update(params[:article])
          redirect to "/articles"
        else
          ##deal with validations
        end
      else
        redirect to "/login"
      end
    end

    delete "/articles/:id/delete" do
      if Helpers.is_logged_in?(session)
        @user = User.find(session[:user_id])
        @article = Article.find(params[:id])
        @article.delete
        redirect to "/articles"
      else
        redirect to "/login"
      end
    end
end
