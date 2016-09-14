OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Figaro.env.facebook_app_id, Figaro.env.facebook_app_secret
end

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
  provider :google_oauth2, Figaro.env.google_client_id, Figaro.env.google_client_secret,
  :client_options => {:ssl => {:ca_file => '/etc/pki/tls/certs/ca-bundle.crt'},
  :scope => 'userinfo.profile,youtube'}, provider_ignores_state: true
end


# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['YT_CLIENT_ID'], ENV['YT_CLIENT_SECRET'],
#   :client_options => {:ssl => {:ca_file => '/etc/pki/tls/certs/ca-bundle.crt'},
#   :scope => 'userinfo.profile,youtube'}, provider_ignores_state: true
# end
