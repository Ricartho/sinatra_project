class AuthorsController < ApplicationController

  get "/authors" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @authors = Author.where(user_id: session[:user_id])
      erb "/authors/index".to_sym
    else
      redirect to "/login"
    end
  end

  get "/authors/new" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      erb "/authors/new".to_sym
    else
      redirect to "/login"
    end
  end

  post "/authors" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @author = Author.new(params[:author])
        if @author.valid?
          @author.save
          redirect to "/authors"
        else
          ##deal with validations
        end
    else
      redirect to "/login"
    end

  end

  get "/authors/:id" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @author = Author.find(params[:id])
      erb "/authors/show".to_sym
    else
      redirect to "/login"
    end

  end


  get "/authors/:id/edit" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @author = Author.find(params[:id])
      if @author && @author.user == Helpers.current_user(session)
        erb "/authors/edit".to_sym
      else
      ##deal with validations
      end
    else
      redirect to "/login"
    end

  end

  patch "/authors/:id" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @author = Author.find(params[:id])
      if @author && @author.user == Helpers.current_user(session)
        @author.update(params[:author])
        redirect to "/authors".to_sym
      else
        #deal with validations
      end
    else
      redirect to "/login"
    end

  end

  delete "/authors/:id/delete" do
    if Helpers.is_logged_in?(session)
      @user = User.find(session[:user_id])
      @author = Author.find(params[:id])
      if @author && @author.user == Helpers.current_user(session)
        @author.delete
        redirect to "/authors"
      else
        ##deal with validations
      end
    else
      redirect to "/login"
    end
  end

end
