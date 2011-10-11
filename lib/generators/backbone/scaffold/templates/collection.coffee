class <%= collection_namespace %> extends Backbone.Collection
  model: <%= model_namespace %>
  url: '<%= route_url %>'
