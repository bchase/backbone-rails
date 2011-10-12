require 'generators/backbone/resource_helpers'

module Backbone
  module Generators
    class ModelGenerator < Rails::Generators::NamedBase
      include Backbone::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator creates a backbone model"

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      def create_backbone_model
        template "model.coffee", "#{backbone_path}/models/#{file_name}.js.coffee"
        template "collection.coffee", "#{backbone_path}/collections/#{plural_name}.js.coffee"
 
        template "model_spec.coffee", "spec/javascripts/backbone/models/#{file_name}_spec.coffee" if using_jasmine?
        template "collection_spec.coffee", "spec/javascripts/backbone/collections/#{plural_name}_spec.coffee" if using_jasmine?
      end

    end
  end
end
