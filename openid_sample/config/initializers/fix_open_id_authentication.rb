# config/initializers/fix_open_id_authentication.rb
require 'open_id_authentication'

module OpenIdAuthentication
  private
  def open_id_redirect_url(open_id_request, return_to = nil)
    # return_toをコントローラ名/completeにするので, open_id_complete=1で判断する必要なし
    # よって取り除いた(たぶんその判断にしか使っていないと思う)
    open_id_request.redirect_url realm, return_to || url_for(:action => 'complete')
  end

  def requested_url
    "#{request.protocol + request.host_with_port + request.path}"
  end
end
