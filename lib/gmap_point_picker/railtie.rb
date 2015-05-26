module Rails
  module GmapPointPicker
    class Railtie < Rails::Railtie
      initializer "setup config" do
        begin
          ActionView::Base.send(:include, ::GmapPointPicker::JavascriptHelper)
        end
      end
    end
  end
end

