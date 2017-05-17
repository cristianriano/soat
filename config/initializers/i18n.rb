# Available locales and default one
I18n.config.available_locales = [:en, :es]
I18n.config.default_locale = :es

# The default locale is :es and all translations from config/locales/*.rb,yml are auto loaded.
I18n.config.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
