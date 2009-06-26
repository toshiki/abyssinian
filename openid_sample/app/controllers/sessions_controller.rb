class SessionsController < ApplicationController
  def new
  end

  #  def create
  #    authenticate_with_open_id do |result, identity_url|
  #      if result.successful?
  #        if @current_user = User.find_by_identity_url(identity_url)
  #          successful_login
  #        else
  #          session[:_url] = identity_url
  #          redirect_to(new_user_path)
  #        end
  #      else
  #        failed_login result.message
  #      end
  #    end
  #  end
  def create
    # authenticate_with_open_idで行われるnormalize_urlが行われなくなるので,
    # この時点で使っておく
    openid_url = normalize_url('https://www.google.com/accounts/o8/id')
    begin_open_id_authentication openid_url do |result, identity_url, sreg|
      # ログインに失敗
      # (begin_open_id_authenticationメソッドに与えたブロックは認証に失敗したとき
      #  にしか呼ばれないので, ブロック実行=認証失敗)
      failed_login result.message
    end
  end

  def complete
    complete_open_id_authentication do |result, identity_url, sreg|
      if User.find_by_identity_url identity_url
        # ログインに成功し, すでにアカウントがある
        render :text => 'top page.'
      else
        # ログインには成功したけど, アカウントを所有していない
        session[:identity_url] = identity_url
        redirect_to(new_users_path)
      end
    end
  rescue => ex
    render :text => ex.message
  end



  def destroy
  end

end
