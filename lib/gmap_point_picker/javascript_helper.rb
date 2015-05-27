module GmapPointPicker
  module JavascriptHelper
    def gmap_point_picker_bind options={}
      key             = options[:key]             ||= GmapPointPicker.configuration.api_key
      load_js         = options[:load_js]         ||= GmapPointPicker.configuration.load_js
      lat_field_id    = options[:lat_field_id]    ||= GmapPointPicker.configuration.lat_field_id
      lng_field_id    = options[:lng_field_id]    ||= GmapPointPicker.configuration.lng_field_id
      map_div_id      = options[:map_div_id]      ||= GmapPointPicker.configuration.map_div_id
      latitude        = options[:latitude]        ||= GmapPointPicker.configuration.latitude
      longitude       = options[:longitude]       ||= GmapPointPicker.configuration.longitude
      search_field_id = options[:search_field_id] ||= GmapPointPicker.configuration.search_field_id

      html = ""

      if load_js
        html << <<-EOS
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=#{key}&libraries=places"></script>
        EOS
      end

      html << <<-EOS
      <script>
      jQuery(document).ready(function() {
        var marker = false;
        var center, input, map, search_box;
        if (jQuery("##{map_div_id}").length === 0) {
          return;
        }
        center = new google.maps.LatLng(#{latitude}, #{longitude});
        map    = new google.maps.Map(document.getElementById("#{map_div_id}"), {
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          center: center
        });
        map.setZoom(16);
        input      = document.getElementById("#{search_field_id}");
        search_box = new google.maps.places.SearchBox(input);
        google.maps.event.addListener(search_box, "places_changed", function() {
          var bounds, i, image, place, places;
          places = search_box.getPlaces();
          i = 0;
          bounds = new google.maps.LatLngBounds();
          place = void 0;
          place = places[0];
          if (place) {
            image = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };
            bounds.extend(place.geometry.location);
          }
          map.fitBounds(bounds);
          if (map.getZoom() > 16) {
            map.setZoom(16);
          }
          return google.maps.event.addListener(map, "bounds_changed", function() {
            bounds = map.getBounds();
            return search_box.setBounds(bounds);
          });
        });
        return google.maps.event.addListener(map, "click", function(event) {
          var location, mapZoom;
          mapZoom = map.getZoom();
          location = event.latLng;
          jQuery("##{lat_field_id}").val(location.lat());
          jQuery("##{lng_field_id}").val(location.lng());
          if (marker) {
            marker.setMap(null);
          }
          return marker = new google.maps.Marker({
            position: event.latLng,
            map: map,
            title: "GmapPointPicker"
          });
        });
      });
      </script>
      EOS
      return (html.respond_to?(:html_safe) && html.html_safe) || html
    end

    def gmap_point_picker_bind_no_jquery options={}
      key             = options[:key]             ||= GmapPointPicker.configuration.api_key
      load_js         = options[:load_js]         ||= GmapPointPicker.configuration.load_js
      lat_field_id    = options[:lat_field_id]    ||= GmapPointPicker.configuration.lat_field_id
      lng_field_id    = options[:lng_field_id]    ||= GmapPointPicker.configuration.lng_field_id
      map_div_id      = options[:map_div_id]      ||= GmapPointPicker.configuration.map_div_id
      latitude        = options[:latitude]        ||= GmapPointPicker.configuration.latitude
      longitude       = options[:longitude]       ||= GmapPointPicker.configuration.longitude
      search_field_id = options[:search_field_id] ||= GmapPointPicker.configuration.search_field_id

      html = ""

      if load_js
        html << <<-EOS
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=#{key}&libraries=places"></script>
        EOS
      end

      html << <<-EOS
      <script>
      document.addEventListener("DOMContentLoaded", function(event) {
        var marker = false;
        var center, input, map, search_box;
        if (!document.getElementById("#{map_div_id}")) {
          return;
        }
        center = new google.maps.LatLng(#{latitude}, #{longitude});
        map    = new google.maps.Map(document.getElementById("#{map_div_id}"), {
          mapTypeId: google.maps.MapTypeId.ROADMAP,
          center: center
        });
        map.setZoom(16);
        input      = document.getElementById("#{search_field_id}");
        search_box = new google.maps.places.SearchBox(input);
        google.maps.event.addListener(search_box, "places_changed", function() {
          var bounds, i, image, place, places;
          places = search_box.getPlaces();
          i = 0;
          bounds = new google.maps.LatLngBounds();
          place = void 0;
          place = places[0];
          if (place) {
            image = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };
            bounds.extend(place.geometry.location);
          }
          map.fitBounds(bounds);
          if (map.getZoom() > 16) {
            map.setZoom(16);
          }
          return google.maps.event.addListener(map, "bounds_changed", function() {
            bounds = map.getBounds();
            return search_box.setBounds(bounds);
          });
        });
        return google.maps.event.addListener(map, "click", function(event) {
          var location, mapZoom;
          mapZoom = map.getZoom();
          location = event.latLng;
          document.getElementById("#{lat_field_id}").value = location.lat();
          document.getElementById("#{lng_field_id}").value = location.lng();
          if (marker) {
            marker.setMap(null);
          }
          return marker = new google.maps.Marker({
            position: event.latLng,
            map: map,
            title: "GmapPointPicker"
          });
        });
      });
      </script>
      EOS
      return (html.respond_to?(:html_safe) && html.html_safe) || html
    end
  end # JavascriptHelper
end # GmapPointPicker
