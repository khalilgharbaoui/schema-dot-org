module SchemaDotOrg
  class FAQPage < SchemaType
    validated_attr :main_entity, type: Array
    validated_attr :name, type: String, allow_nil: true
  end
end 