require 'schema_dot_org'

module SchemaDotOrg
  class HowToStep < SchemaType
    validated_attr :name,            type: String
    validated_attr :text,            type: String, allow_nil: true
    validated_attr :position,        type: Integer, allow_nil: true
    validated_attr :image,           type: [String, Array], allow_nil: true
    validated_attr :video,           type: [String, Array], allow_nil: true
    validated_attr :url,             type: String, allow_nil: true
    validated_attr :description,     type: String, allow_nil: true
    validated_attr :supply,          type: Array, allow_nil: true
    validated_attr :tool,            type: Array, allow_nil: true
    validated_attr :prep_time,       type: String, allow_nil: true
    validated_attr :perform_time,    type: String, allow_nil: true
  end
end