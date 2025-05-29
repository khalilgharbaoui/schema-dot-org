require 'schema_dot_org'

module SchemaDotOrg
  class HowTo < SchemaType
    validated_attr :name,            type: String
    validated_attr :description,     type: String, allow_nil: true
    validated_attr :step,            type: Array, allow_nil: true
    validated_attr :image,           type: [String, Array], allow_nil: true
    validated_attr :video,           type: [String, Array], allow_nil: true
    validated_attr :total_time,      type: String, allow_nil: true
    validated_attr :prep_time,       type: String, allow_nil: true
    validated_attr :perform_time,    type: String, allow_nil: true
    validated_attr :yield,           type: String, allow_nil: true
    validated_attr :estimated_cost,  type: Hash, allow_nil: true
    validated_attr :supply,          type: Array, allow_nil: true
    validated_attr :tool,            type: Array, allow_nil: true
    validated_attr :url,             type: String, allow_nil: true
    validated_attr :author,          type: [SchemaDotOrg::Person, SchemaDotOrg::Organization], allow_nil: true
    validated_attr :publisher,       type: SchemaDotOrg::Organization, allow_nil: true
    validated_attr :date_published,  type: String, allow_nil: true
    validated_attr :date_modified,   type: String, allow_nil: true
    validated_attr :in_language,     type: String, allow_nil: true
  end
end