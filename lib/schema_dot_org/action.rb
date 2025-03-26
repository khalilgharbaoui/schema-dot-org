require 'schema_dot_org/organization'

module SchemaDotOrg
  class Action < SchemaType
    validated_attr :target, type: String, allow_nil: true
    validated_attr :agent, type: SchemaDotOrg::Organization, allow_nil: true
  end
end
