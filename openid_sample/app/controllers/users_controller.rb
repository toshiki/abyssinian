class UsersController < ApplicationController
  def create
    @current_user = User.new(params[:user])
    @current_user.identity_url = session[:identity_url]
    @current_user.save!
    render :text => 'top page'
  end

  def new
    @user = User.new
  end

end
