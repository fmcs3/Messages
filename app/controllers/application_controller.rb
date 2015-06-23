class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Criando métodos para verificar se o usuário está online #
  helper_method :current_user

  def current_user
    def raise_and_rescue
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue
        session[:user_id] = nil
      end
    end
  end

  def require_user
    flash[:notice] = 'You must loggin first'
    redirect_to '/login' unless current_user
  end
end
