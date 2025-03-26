module SchemaDotOrg
  class Thing < SchemaType
    validated_attr :name, type: String, allow_nil: true
    validated_attr :position, type: Integer, allow_nil: true
    validated_attr :alternate_name, type: String, allow_nil: true
    validated_attr :image, type: SchemaDotOrg::ImageObject, allow_nil: true
    validated_attr :same_as, type: String, allow_nil: true
    validated_attr :url, type: String, allow_nil: true
    validated_attr :potential_action, type: SchemaDotOrg::Action, allow_nil: true
  end
end