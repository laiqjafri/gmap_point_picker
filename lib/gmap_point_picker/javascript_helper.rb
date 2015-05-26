module GmapPointPicker
  module JavascriptHelper
    def gmap_point_picker_bind
      html = ""
      html << <<-EOS
      <h1>HELLO</h1>
      EOS
      return (html.respond_to?(:html_safe) && html.html_safe) || html
    end
  end # JavascriptHelper
end # GmapPointPicker
