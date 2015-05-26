module GmapPointPicker
  class Configuration
    attr_accessor :api_key,
      :load_js,
      :lat_field_id,
      :lng_field_id,
      :map_div_id,
      :search_field_id,
      :latitude,
      :longitude

    def initialize #:nodoc:
      @load_js         = false
      @lat_field_id    = "latitude"
      @lng_field_id    = "longitude"
      @map_div_id      = "map-canvas"
      @search_field_id = "gmap-search"
      @latitude        = "47.523398"
      @longitude       = "-98.489568"
    end
  end
end
