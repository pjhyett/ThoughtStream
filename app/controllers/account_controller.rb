class AccountController < ApplicationController

  def login
    case @request.method
      when :post
      if session[:user] = User.authenticate(@params[:user_login], @params[:user_password])

        flash['notice']  = "Login successful"
        redirect_back_or_default :controller => "thoughts", :action => "list"
      else
        flash.now['notice']  = "Login unsuccessful"

        @login = @params[:user_login]
      end
    end
  end
  
  def signup
    if(User.find_first.nil? || session[:user])
      @user = User.new(@params[:user])

      if @request.post? and @user.save
        session[:user] = User.authenticate(@user.login, @params[:user][:password])
        flash['notice']  = "Signup successful"
        redirect_back_or_default :controller => "thoughts", :action => "list"
      end
    else
      render_text "If you want to create another user, you must be logged in first"
    end    
  end  
  
  def logout
    session[:user] = nil
    redirect_to :controller => "days", :action => "index"
  end
  
end
