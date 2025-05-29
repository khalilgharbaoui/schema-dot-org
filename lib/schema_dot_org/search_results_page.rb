require 'schema_dot_org'

module SchemaDotOrg
  class SearchResultsPage < SchemaType
    validated_attr :name,           type: String
    validated_attr :description,    type: String, allow_nil: true
    validated_attr :url,            type: String, allow_nil: true
    validated_attr :main_entity,    type: SchemaDotOrg::ItemList, allow_nil: true
    validated_attr :publisher,      type: SchemaDotOrg::Organization, allow_nil: true
    validated_attr :about,          type: String, allow_nil: true
    validated_attr :date_published, type: String, allow_nil: true
    validated_attr :date_modified,  type: String, allow_nil: true
    validated_attr :in_language,    type: String, allow_nil: true
    validated_attr :search_terms,   type: String, allow_nil: true
    validated_attr :result_count,   type: Integer, allow_nil: true
  end
end