# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"


AssetSync.configure do |config|
    config.fog_provider = "AWS"
    config.aws_access_key_id = Rails.application.credentials.dig(:aws, :access_key_id)
    config.aws_secret_access_key = Rails.application.credentials.dig(:aws, :secret_access_key)
    config.fog_directory = Rails.application.credentials.dig(:aws, :bucket)
    config.fog_region = Rails.application.credentials.dig(:aws, :region)
end

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( bootstrap.min.js popper.js)
Rails.application.config.assets.precompile += %w[ckeditor/config.js]
