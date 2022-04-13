class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new,:create,:index,:login]
    def index
      
    end
  
    def dashboard
      @current_user = User.find_by_id(session[:user_id])
      @articles = Article.where(user_id: session[:user_id])
    end


    def new
      @user = User.new
    end
  
    def create
      @user = User.create(user_params)
      if @user.valid?
        redirect_to '/',notice: "Register Successfully"
      else
        flash[:error] = "Error- please try to create an account again."
        redirect_to new_user_path
      end
    end

    def login
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to action: "dashboard"
      else
        flash[:error] = "Enter Correct Login Password"
        redirect_to index
      end
    end
  
    def logout
      reset_session
      redirect_to new
    end

    def addusers
     puts params[:article_id]
    end


    private 
    def user_params
      params.permit(:email, :password)
    end
  end