CarrierWave.configure do |config|
  config.dropbox_app_key = "durpz9n4gn7i12f"
  config.dropbox_app_secret = ENV["APP_SECRET"]
  config.dropbox_access_token = "4d7vh681cve6qbu0"
  config.dropbox_access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
  config.dropbox_user_id = "134513580"
  config.dropbox_access_type = "app_folder"
end