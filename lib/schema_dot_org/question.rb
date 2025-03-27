module SchemaDotOrg
  class Question < SchemaType
    validated_attr :name, type: String
    validated_attr :text, type: String, allow_nil: true
    validated_attr :accepted_answer, type: String, allow_nil: true
    validated_attr :suggested_answer, type: String, allow_nil: true
    validated_attr :image, type: ImageObject, allow_nil: true
  end
end