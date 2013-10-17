OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do |variable|
  provider :facebook, ENV['facebook_app_id'], ENV['facebook_secret']
end