module SchemaDotOrg
  class Thing < SchemaType
    validated_attr :name, type: String, presence: true
    validated_attr :alternate_name, type: String, allow_nil: true
    validated_attr :image, type: ImageObject, allow_nil: true
    validated_attr :same_as, type: String, allow_nil: true
  end
end
