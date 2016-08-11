unless Rails.env.production?
  Sidekiq.configure_client do |config|
    config.redis = { :url => 'redis://127.0.0.1:6379/1' }
  end

  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://127.0.0.1:6379/1' }
  end
else
  Sidekiq.configure_client do |config|
    config.redis = { :url => ENV['REDISTOGO_URL'], :size => 1 }
  end

  Sidekiq.configure_server do |config|
    config.redis = { :url => ENV['REDISTOGO_URL'], :size => 2 }
  end
end
