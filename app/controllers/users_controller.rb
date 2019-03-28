class UsersController < ApplicationController

before_action :check_session, :only => [:index, :show]
before_action :check_session_for_login, :only => [:login, :signup]
# validates :first_name, :last_name, :email, :encrypted_password : true

# before_filter :save_login_state, :only => [:users_login]
  
   def index
    @users = User.all
   end

   def new
     @user =Users.new
   end

   def show
    @user = User.find_by_id(params[:id])
    # redirect_to users_path if @user.nil?
   end

   def users_login
     @user = User.find_by_email(params[:email])
      if @user.present?
      if (@user.encrypted_password == params[:encrypted_password])
          session[:user_id] = @user.id
          # if session.present?
            
          # flash[:notice] = "Wow Welcome again, you logged in"
          redirect_to users_path
        # if user && user.authenticate(params[:password])  
            
      elsif (@user.encrypted_password != params[:encrypted_password])
        
      else
         
      end 
    end
  end

  def login
  end

    
  def create
      @user = User.new(user_params)
      if @user.save
      # if user && user.authenticate(params[:password])  
      #    session[:user_id] = @user.id   
      #    redirect_to user_path(@user), notice: 'User successfully created.'   
      redirect_to user_path(@user)
      else
         render "new"
     end
  end

  def check_session
    unless session[:user_id].present?
      redirect_to users_login_path
    end
  end

  def check_session_for_login
    if session[:user_id].present?
      redirect_to users_path
    end
  end

  def logout
    session[:user_id] = nil   
    redirect_to users_login_path, notice: 'Logged out!'   
  end


  def signup
  end

   
  

     # def match_password(login_password="")
     # encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
     # end

    # def encrypt_password
    #  if password.present?
    #  self.salt = BCrypt::Engine.generate_salt
    #   self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    #  end
    # end

   # def clear_password
   #  self.password = nil
   # end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password )
    end
end

   



