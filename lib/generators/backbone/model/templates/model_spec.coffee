describe "<%= singular_model_name.downcase %> model", ->
  
  describe "when instantiated", ->

    it "should have default attributes", ->
      <%= singular_table_name %> = new <%= model_namespace %>()
<% attributes.each do |attribute| -%>
      expect(<%= singular_table_name %>.get("<%= attribute.name %>")).toEqual(null)
<% end -%> 
