OmniAuth.config.logger = Rails.logger

client_id = '490354722247-q773hkk1m6br2emkliguee8rqlnpdvpr.apps.googleusercontent.com'
client_secret = '3QLiU9kQ73jceYkaihC58262'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, client_id, client_secret, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end