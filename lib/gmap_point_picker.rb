require "gmap_point_picker/version"

module GmapPointPicker
  # Gives access to the current Configuration.
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    config = configuration
    yield(config)
  end
end

if defined?(Rails)
  require 'gmap_point_picker/rails'
  require 'gmap_point_picker/railtie'
end
