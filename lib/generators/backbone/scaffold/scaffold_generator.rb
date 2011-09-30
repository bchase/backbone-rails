require 'generators/backbone/model/model_generator'

module Backbone
  module Generators
    class ScaffoldGenerator < ModelGenerator
      class_option :template_engine, :type => :string, :default => "erb"

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates the client side crud scaffolding"

      def create_router_files
        template 'router.coffee', File.join(backbone_path, "routers", class_path, "#{plural_name}_router.js.coffee")
      end

      def create_view_files
        available_views.each do |view|
          template "views/#{view}_view.coffee", File.join(backbone_path, "views", plural_name, "#{view}_view.js.coffee")
          template "templates/#{options.template_engine}/#{view}.jst", File.join(backbone_path, "templates", plural_name, "#{view}.jst.ejs#{options.template_engine == "haml" ? ".haml" : ""}")
        end

        template "views/model_view.coffee", File.join(backbone_path, "views", plural_name, "#{singular_name}_view.js.coffee")
        template "templates/model.jst", File.join(backbone_path, "templates", plural_name, "#{singular_name}.jst.ejs")
      end

      protected
        def available_views
          %w(index show new edit)
        end

    end
  end
end