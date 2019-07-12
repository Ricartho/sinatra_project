class CategoryController < ApplicationController

  get "/categories" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      @categories = Category.where(user_id: session[:user_id])
      erb "/categories/index".to_sym
    else
      redirect to "/login"
    end
  end

  get "/categories/new" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      erb "/categories/new".to_sym
    else
      redirect to "/login"
    end
  end

  post "/categories" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      @category = Category.new(params[:category])
      if @category && @category.user == Helpers.current_user(session)
        @category.save
        redirect to "/categories"
      else
        #deal with validations
      end
    else
      redirect to "/login"
    end

  end

  get "/categories/:id" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      @category = Category.find(params[:id])
      erb "/categories/show".to_sym
    else
      redirect to "/login"
    end
  end

  get "/categories/:id/edit" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      @category = Category.find(params[:id])
      if @category && @category.user == Helpers.current_user(session)
        erb "/categories/edit".to_sym
      else
        #dela with validations
      end
    else
      redirect to "/login"
    end

  end

  patch "/categories/:id" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      @category = Category.find(params[:id])
      if @category && @category.user == Helpers.current_user(session)
        @category.update(params[:category])
      redirect to "/categories"
      else
        #deal with validations

      end
    else
      redirect to "/login"
    end
  end

  delete "/categories/:id/delete" do
    if Helpers.is_logged_in?(session)
      @user =  User.find(session[:user_id])
      @category = Category.find(params[:id])
      if @category && @category.user == Helpers.current_user(session)
        @category.delete
        redirect to "/categories"
      else
        #deal with validations
      end
    else
      redirect to "/login"
    end
  end

end
