require 'schema_dot_org'

module SchemaDotOrg
  class Review < SchemaType
    validated_attr :author,           type: [SchemaDotOrg::Person, SchemaDotOrg::Organization], allow_nil: true
    validated_attr :review_rating,    type: Hash, allow_nil: true
    validated_attr :review_body,      type: String, allow_nil: true
    validated_attr :name,             type: String, allow_nil: true
    validated_attr :headline,         type: String, allow_nil: true
    validated_attr :date_published,   type: String, allow_nil: true
    validated_attr :date_modified,    type: String, allow_nil: true
    validated_attr :about,            type: [SchemaDotOrg::Product, Hash], allow_nil: true
    validated_attr :publisher,        type: SchemaDotOrg::Organization, allow_nil: true
    validated_attr :url,              type: String, allow_nil: true
    validated_attr :in_language,      type: String, allow_nil: true
    validated_attr :item_reviewed,    type: [SchemaDotOrg::Product, Hash], allow_nil: true
  end
end