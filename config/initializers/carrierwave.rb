CarrierWave.configure do |config|
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region:                Rails.application.credentials.dig(:aws, :region),
    }
    config.asset_host = 'http://d3nnkg2bmwmyy0.cloudfront.net'
    config.fog_directory  = Rails.application.credentials.dig(:aws, :bucket)
    config.fog_public     = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    # config.storage = :fog
    # config.fog_provider = 'fog/aws'
    # For an application which utilizes multiple servers but does not need caches persisted across requests,
    # uncomment the line :file instead of the default :storage.  Otherwise, it will use AWS as the temp cache store.
    # config.cache_storage = :file
  end