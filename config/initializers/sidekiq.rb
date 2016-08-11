unless Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { :url => 'redis://127.0.0.1:6379/1' }
  end

  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://127.0.0.1:6379/1' }
  end
else
  Sidekiq.configure_client do |config|
    config.redis = { :url => ENV['REDIS_URL'] }
  end

  Sidekiq.configure_server do |config|
    config.redis = { :url => ENV['REDIS_URL'] }
  end
end
