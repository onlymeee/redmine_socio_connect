require 'redmine'

Redmine::Plugin.register :redmine_socio_connect do
  name 'SocioConnect'
  author 'Haseeb Khan'
  description 'Authentication with Facebook and Twitter using OAuth'
  version '1.0'
  url ''
  author_url 'http://github.com/mhaseebkhan'

  $socio_connect_settings = YAML::load(File.open("#{File.dirname(__FILE__)}/config/settings.yml"))

end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, $socio_connect_settings['twitter']['key'], $socio_connect_settings['twitter']['secret']
  provider :facebook, $socio_connect_settings['facebook']['key'], $socio_connect_settings['facebook']['secret'] 
end

require 'redmine_socio_connect'
