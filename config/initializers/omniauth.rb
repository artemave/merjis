Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, OpenID::Store::ActiveRecord.new
end
